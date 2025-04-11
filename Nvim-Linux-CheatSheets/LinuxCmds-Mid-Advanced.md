
# 🐧 **Linux Command Cheat Sheet (Intermediate–Advanced)**

## 📁 File & Directory Management

|Command|Description|
|---|---|
|`rsync -avh src/ dest/`|Efficient file sync (preserves perms & timestamps)|
|`cp -r --parents file path/`|Copy with full directory structure|
|`find . -type f -iname "*.py" -exec grep -Hn "def " {} +`|Find Python defs in all files recursively|
|`du -sh *|sort -h`|
|`tree -L 2`|Display directory tree up to 2 levels|
|`xargs -n 1 < file.txt`|Run a command on each line of file.txt|

---

## 🔧 System Monitoring & Process Management

|Command|Description|
|---|---|
|`htop`|Interactive process viewer (better `top`)|
|`iotop`|Monitor disk I/O per process|
|`watch -n 1 df -h`|Watch disk space live every second|
|`ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%mem|head`|
|`lsof -i :8000`|See what’s using port 8000|
|`kill -9 $(pidof process)`|Force kill a process by name|

---

## 🌐 Networking & Internet

|Command|Description|
|---|---|
|`curl -I https://example.com`|Fetch HTTP headers only|
|`netstat -tulnp`|List open ports and associated processes|
|`ss -tnlp`|Modern alternative to `netstat`|
|`ping -c 5 google.com`|Ping with count limit|
|`dig +short example.com`|Get DNS info|
|`traceroute example.com`|Trace packet route to host|

---

## 🧪 Scripting, Shell Tricks & Shortcuts

|Command|Description|
|---|---|
|`!!`|Repeat last command|
|`!$`|Last argument of previous command|
|`$(command)`|Command substitution (like backticks)|
|`function mkcd() { mkdir -p "$1"; cd "$1"; }`|Custom shell function: make & cd into dir|
|`: > file.txt`|Truncate a file (empty it)|
|`diff <(ls dir1) <(ls dir2)`|Compare output of two commands|

---

## 🗂️ Archiving & Compression

|Command|Description|
|---|---|
|`tar -czvf archive.tar.gz dir/`|Compress directory to .tar.gz|
|`tar -xvzf file.tar.gz`|Extract .tar.gz|
|`zip -r archive.zip folder/`|Create zip archive|
|`unzip archive.zip -d dest/`|Extract zip to destination|

---

## 🔒 Permissions, Ownership, and ACLs

|Command|Description|
|---|---|
|`chmod -R u+rwX,g-rwX,o-rwx .`|Recursive permissions: user RWX, remove others|
|`chown user:group file`|Change ownership|
|`getfacl /path/file`|View Access Control List|
|`setfacl -m u:john:rwx file`|Set ACL for user 'john'|

---

## 📦 Package & Software Management

|Command|Description|
|---|---|
|`apt list --installed`|List all installed packages (Debian/Ubuntu)|
|`apt-mark showmanual`|Show manually installed packages|
|`dpkg -S /bin/bash`|Find package owning a file|
|`snap list` / `flatpak list`|List Snap/Flatpak apps|

---

## 🧠 Useful Aliases (add to `~/.bashrc` or `~/.zshrc`)

```bash
alias ll='ls -lah'
alias gs='git status'
alias update='sudo apt update && sudo apt upgrade'
alias ..='cd ..'
alias ipinfo='curl ifconfig.me'
