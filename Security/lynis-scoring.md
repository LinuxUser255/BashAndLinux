# Title
To get the **highest Lynis score possible**, you need to address **every warning and suggestion** it provides. Here's a comprehensive checklist and approach you can automate or use in your script to improve the score:

---

## 🛡️ Lynis Score Optimization Strategy

### 📋 1. **Run a Full Audit First**

```bash
sudo lynis audit system --quick
```

This provides a report with:

- **Warnings** (high-priority)

- **Suggestions** (low/medium-priority)


Your goal: **fix or address everything in `/var/log/lynis.log` and `/var/log/lynis-report.dat`.**

---

### 🔍 2. **Understand How the Score Works**

- **Score increases** when:

    - Security settings are configured correctly

    - Services or daemons are hardened

    - Unnecessary software is removed

- **Score decreases** with:

    - Default/weak configurations

    - Unhardened services

    - Open ports, old software, missing security tools


---

## ✅ Key Hardening Areas to Improve Lynis Score

### 🔒 System Basics

- Ensure all packages are **up to date**


```bash
sudo apt update && sudo apt upgrade -y     # Debian/Ubuntu
sudo dnf update -y                         # RHEL/Fedora
```

- Enable **automatic updates**


```bash
sudo apt install unattended-upgrades
sudo dpkg-reconfigure unattended-upgrades
```

---

### 👮 User and Access Controls

- Disable root login over SSH (`/etc/ssh/sshd_config`)


```bash
PermitRootLogin no
```

- Use strong password policies:


```bash
sudo apt install libpam-pwquality
# Edit /etc/security/pwquality.conf
minlen = 12
dcredit = -1
ucredit = -1
lcredit = -1
ocredit = -1
```

- Lock inactive users:


```bash
usermod -L <username>
```

- Set user password aging:


```bash
chage -M 90 -m 7 -W 14 <username>
```

---

### 🛡️ Services & Network

- Disable unused services


```bash
systemctl disable <service>
```

- Harden sysctl:


```bash
cat <<EOF | sudo tee /etc/sysctl.d/99-hardening.conf
net.ipv4.conf.all.rp_filter = 1
net.ipv4.conf.default.rp_filter = 1
net.ipv4.icmp_echo_ignore_broadcasts = 1
net.ipv4.tcp_syncookies = 1
net.ipv4.conf.all.accept_source_route = 0
EOF

sudo sysctl --system
```

- Configure firewall (e.g. UFW or firewalld):


```bash
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw enable
```

---

### 🪪 Logging & Auditing

- Ensure logging is working:

    - Use `rsyslog` or `journald`

- Install and configure auditd:


```bash
sudo apt install auditd
sudo systemctl enable --now auditd
```

---

### 🧰 Tools & Configurations Lynis Looks For

- Install recommended tools:


```bash
sudo apt install apparmor lynis aide clamav chkrootkit debsums
```

- Configure AppArmor or SELinux


---

### 🧼 Clean Up Unused Packages

```bash
sudo apt autoremove --purge
```

---

### 🔐 File Permissions and Integrity

- Set file permissions for sensitive files:


```bash
chmod 600 /etc/shadow
chmod 600 /boot/grub/grub.cfg
```

- Configure AIDE or other file integrity tools


---

## 🧾 After Fixes: Re-audit and Confirm

```bash
sudo lynis audit system
```

- Look at `/var/log/lynis-report.dat`

- Repeat until **no warnings/suggestions remain**


---

## 🔁 Bonus: Automate with Script

You can turn the above tasks into a modular shell script with functions like:

```bash
hardening_firewall() { ... }
harden_ssh() { ... }
install_security_tools() { ... }
update_packages() { ... }
```

