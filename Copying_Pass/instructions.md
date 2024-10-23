# How to transfer your gpg keys, password vault & more on Linux

To transfer your GPG keys (`secret-keys.gpg`, `public-keys.gpg`), and your password store from a USB drive to a new Linux computer, follow these steps:

### Step-by-Step Guide

#### 1. **Insert and Mount the USB Drive**

First, connect your USB drive to the new Linux computer. The USB drive should automatically mount, but if it doesn’t, you can manually mount it. To find the device name, run:

```bash
lsblk
```

Look for your USB drive, typically something like `/dev/sdb1`, and mount it to a directory (e.g., `/mnt/usb`):

```bash
sudo mount /dev/sdb1 /mnt/usb
```

#### 2. **Transfer GPG Keys**

##### A. Import the **Private** Keys

1. Navigate to the USB drive:
   ```bash
   cd /mnt/usb
   ```

2. Import your secret (private) GPG keys:
   ```bash
   gpg --import secret-keys.gpg
   ```

   You will be prompted to enter the passphrase for your GPG key if it's encrypted.

##### B. Import the **Public** Keys (Optional)

1. Import your public GPG keys:
   ```bash
   gpg --import public-keys.gpg
   ```

   This step is optional but recommended, especially if you want to ensure your public keys are also available.

##### C. Verify GPG Key Import

You can verify the keys were successfully imported with:

```bash
gpg --list-secret-keys
gpg --list-keys
```

This should list your private and public keys on the new machine.

#### 3. **Transfer the Password Store**

Next, copy your `~/.password-store` directory from the USB drive to the new computer.

1. Navigate to the USB drive where the `.password-store` is located:
   ```bash
   cd /mnt/usb
   ```

2. Copy the `.password-store` directory to your home directory on the new machine:
   ```bash
   cp -r .password-store ~/
   ```

3. Verify that the `.password-store` was copied correctly by listing its contents:
   ```bash
   ls ~/.password-store
   ```

#### 4. **Install `pass` (if necessary)**

On the new machine, you need to make sure that `pass` is installed to manage your passwords. Install it with the following command (if it's not already installed):

```bash
sudo apt install pass  # For Debian/Ubuntu-based systems
# or
sudo dnf install pass  # For Fedora-based systems
```

#### 5. **Reconfigure `pass` to Use Your GPG Key**

If you have more than one GPG key, or if `pass` is not working as expected, you may need to configure it to use the correct GPG key:

1. Check which GPG key is being used by `pass`:
   ```bash
   cat ~/.password-store/.gpg-id
   ```

2. If necessary, edit `.gpg-id` to match the correct GPG key:
   ```bash
   nano ~/.password-store/.gpg-id
   ```
   Ensure that it contains the correct GPG key ID (you can get this from `gpg --list-keys`).

3. After setting the correct GPG ID, you should now be able to use `pass` as usual:
   ```bash
   pass ls
   ```

#### 6. **Securely Delete the GPG Keys from the USB Drive (Optional)**

If you no longer need the GPG keys stored on the USB drive, and for security reasons, you may want to securely delete them:

```bash
shred -u /mnt/usb/secret-keys.gpg
```

Make sure that you don't need the keys on the USB drive before running this command.

#### 7. **Unmount the USB Drive**

Once the transfer is complete, unmount the USB drive:

```bash
sudo umount /mnt/usb
```

### Conclusion

You have successfully transferred your GPG keys and password store from your USB drive to your new Linux computer. Now, you should be able to manage your passwords with `pass` on your new system. If you need further assistance with any part of the process, feel free to ask!
