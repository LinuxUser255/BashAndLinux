#!/bin/bash

# Steps 
# Run this script in the same directory as the one the iso you downloaded.
# 1. Import signing keys.
# 2. verify signatures  
# 2. verify sha Sums

# Artix home page: https://artixlinux.org/
# Download: https://artixlinux.org/download.php

# 1. Retrieve All Artix devs gpg keys fom github
wget https://raw.githubusercontent.com/artix-linux/artix-keyring/master/artix.gpg

# Individual Artix devs keys: 
# https://github.com/artix-linux/artix-keyring/tree/master/master
# Marcus von Ditfurth PGP Key ID:0xED587B6247A4152D
# wget -O artoo.asc https://raw.githubusercontent.com/artix-linux/artix-keyring/master/master/artoo.asc
# Chris Cromer: PGP Key:0x97BEEEC2
# wget -O cromer.asc https://raw.githubusercontent.com/artix-linux/artix-keyring/master/master/cromer.asc
# Oscar Campos. damnwidget.asc PGP Key:0x9CBAAAC6F28497FC
# wget -O damnwidget.asc  https://raw.githubusercontent.com/artix-linux/artix-keyring/master/master/damnwidget.asc
# Christos Nouskas nous.asc PGP Key:0xEA690BC73A4F1094
# wget -O nous.asc  https://github.com/artix-linux/artix-keyring/blob/master/master/nous.asc

# 2. verify signatures: edit the signature file and iso to match what you downloaded
gpg --auto-key-retrieve --verify  artix-base-runit-20230605-x86_64.iso.sig artix-base-runit-20230605-x86_64.iso
 
# 3. Calculate and compare the shasum from the website, against the calculated shasum in the cmd line
echo 'f83568fbd55e64c2a2d13852bd7f6e454cbd23808f4c110631fb2bd1209693b8  artix-base-runit-20230605-x86_64.iso' > 256-listed-sum.txt

# calculated sum
sha256sum artix-base-runit-20230605-x86_64.iso > 256-calculated-sum.txt

# compare the two hase values 
diff 256-listed-sum.txt 256-calculated-sum.txt 

echo '' 
echo 'If no error message was displayed, then, the .iso and signature are verified and hash values match.' 
echo 'You may now flash the .iso to a USB drive, and complete the installation process'
echo ''
