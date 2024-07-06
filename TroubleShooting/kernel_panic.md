# Kernel panic - not syncing

## Error message:

**_"Not activating mandotory Access Control as `/sbin/tomoyo-init` does not exist Kernel panic - not syncing: 
Attemted to kill init! `/sbin/int`: error while loading shared libraries: `libsystemd-core-252.so`: cannot open shared object file: No such file or directory"_**


<br>

## Meaning and possible solutions:
The error This indicates a critical issue with your Debian 11 system during boot, particularly with the initialization process (`/sbin/init`). Let's break down the error and how to address it:

1. **Error Analysis**:
   - **Missing `/sbin/tomoyo-init`**: This message suggests that a mandatory access control mechanism (`tomoyo-init`) is not being activated because the executable (`/sbin/tomoyo-init`) does not exist. This alone might not cause the kernel panic but indicates a setup issue.
   - **Kernel Panic**: The kernel panic occurs due to a failure in the init process (`/sbin/init`), which is the first process started by the kernel during boot.
   - **Shared Library Issue**: Further into the error message, there's a problem with loading shared libraries (`libsystemd-core-252.so`). This file is crucial for system functions related to systemd, which manages system and service control.

2. **Steps to Fix**:

   **Step 1: Boot Using a Live CD/USB**:
   - Since your system is encountering a kernel panic during boot, you'll likely need to boot into a live environment from a Debian 11 Live CD or USB.

   **Step 2: Mount the System Partition**:
   - After booting into the live environment, mount your Debian 11 system's root partition. You can typically do this by clicking on the partition in the file manager, or manually with commands like:
     ```
     sudo mkdir /mnt/debian
     sudo mount /dev/sdXY /mnt/debian
     ```
     Replace `/dev/sdXY` with your actual root partition identifier (e.g., `/dev/sda1`).

   **Step 3: Restore Missing Files and Libraries**:
   - Navigate to the `/sbin` directory on your mounted Debian system partition:
     ```
     cd /mnt/debian/sbin
     ```
   - Check if `tomoyo-init` exists. If it doesn't, you may need to reinstall the package that provides it. However, this is less critical compared to the missing systemd library.

   - Now, address the `libsystemd-core-252.so` library issue. This file is crucial for systemd functionality.

   - First, locate where this library should be located. Normally, it should be in `/lib` or `/lib64`. You can search for it:
     ```
     sudo find /mnt/debian/lib* -name "libsystemd-core-252.so*"
     ```
     This command will help locate if the library is present on your system.

   - If the library is missing or corrupted, you'll need to reinstall the `systemd` package to restore it:
     ```
     sudo chroot /mnt/debian
     apt-get update
     apt-get install --reinstall systemd
     ```

   **Step 4: Verify and Reboot**:
   - After reinstalling `systemd` and ensuring necessary files are restored, unmount the partition:
     ```
     exit (to exit the chroot environment)
     sudo umount /mnt/debian
     ```

   - Restart your system:
     ```
     sudo reboot
     ```

   - Monitor the boot process to see if the kernel panic and library errors are resolved.

3. **Further Troubleshooting**:
   - If the problem persists after these steps, consider checking the integrity of your filesystem (`fsck`), reviewing recent system changes, or examining logs (`/var/log/syslog`, `/var/log/messages`) for any additional clues.

By following these steps, you should be able to address the issues causing the kernel panic and library errors on your Debian 11 system during boot.
