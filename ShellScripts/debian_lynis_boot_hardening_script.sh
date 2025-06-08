#!/bin/bash
# Debian 12 Security Hardening Script (Lynis Remediation)
# Author: YourNameHere
# Tested on: Debian 12 (Bookworm)

set -euo pipefail

log() {
  printf "\033[1;32m[+] %s\033[0m\n" "$1"
}

error() {
  printf "\033[1;31m[!] %s\033[0m\n" "$1"
}

install_packages() {
  log "Installing missing security packages..."
  apt update && apt install -y \
    libpam-tmpdir \
    apt-listbugs \
    apt-listchanges \
    needrestart \
    fail2ban \
    apparmor \
    apparmor-profiles \
    apparmor-utils \
    libpam-pwquality \
    auditd \
    audispd-plugins \
    unattended-upgrades
}

enable_app_armor() {
  log "Enforcing all AppArmor profiles..."
  aa-enforce /etc/apparmor.d/* || true
  systemctl enable --now apparmor
}

harden_pam() {
  log "Hardening PAM password policy..."
  PAM_FILE="/etc/pam.d/common-password"
  grep -q pam_pwquality "$PAM_FILE" || {
    cp "$PAM_FILE" "$PAM_FILE.bak"
    echo 'password requisite pam_pwquality.so retry=3 minlen=14 difok=4 ucredit=-1 lcredit=-1 dcredit=-1 ocredit=-1' >> "$PAM_FILE"
  }
}

configure_grub_password() {
  log "Configuring GRUB password (manual step required)"
  echo "Run: grub-mkpasswd-pbkdf2 and copy the resulting hash."
  echo "Then edit /etc/grub.d/40_custom and add lines like:"
  echo '  set superuser="admin"'
  echo '  password_pbkdf2 admin <hash>'
  echo "Finally run: update-grub"
}

enable_auto_updates() {
  log "Enabling unattended upgrades..."
  dpkg-reconfigure --priority=low unattended-upgrades
}

configure_auditd() {
  log "Enabling auditd service..."
  systemctl enable --now auditd
}

modular_systemd_hardening() {
  log "Hardening systemd services..."
  SERVICES=(cron rsyslog cups exim4 getty@tty1 avahi-daemon colord lightdm dbus ntpsec)

  for svc in "${SERVICES[@]}"; do
    OVERRIDE_DIR="/etc/systemd/system/${svc}.service.d"
    mkdir -p "$OVERRIDE_DIR"
    cat > "$OVERRIDE_DIR/harden.conf" <<EOF
[Service]
PrivateTmp=true
ProtectSystem=full
ProtectHome=true
NoNewPrivileges=true
EOF
    log "Hardened $svc"
  done

  systemctl daemon-reexec
}

disable_unnecessary_services() {
  log "Disabling unnecessary services..."
  SERVICES=(avahi-daemon cups exim4)
  for svc in "${SERVICES[@]}"; do
    systemctl disable --now "$svc" || true
  done
}

main() {
  install_packages
  enable_app_armor
  harden_pam
  configure_grub_password
  enable_auto_updates
  configure_auditd
  modular_systemd_hardening
  disable_unnecessary_services

  log "Security hardening complete. Reboot is recommended."
}

main "$@"
