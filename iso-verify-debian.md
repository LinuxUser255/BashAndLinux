# How to use gpg to verify a Debian iso 


 ![](https://futures.commons.gc.cuny.edu/files/2014/11/debian-logo-horizontal-580x164.gif)
  <p align="right">(<a href="#readme-top">back to top</a>)</p>

  
## [-----> !! DOWNLOAD CURRENT DEBIAN .iso IMAGES HERE !! <-----](https://cdimage.debian.org/debian-cd/current-live/amd64/iso-hybrid/)
  
  
  ### Quick instructions on how to verify your Debian iso.* 
  ---
 

### Import signing keys.
```bash
gpg --keyserver keyring.debian.org --recv DA87E80D6294BE9B

gpg --keyserver keyring.debian.org --recv 988021A964E6EA7D

gpg --keyserver keyring.debian.org --recv 42468F4009EA8AC3

gpg --verify SHA512SUMS.sign SHA512SUMS.txt
```
### Successfull output:
```
gpg --verify SHA512SUMS.sign SHA512SUMS.txt
gpg: Signature made Sat 10 Sep 2022 07:01:01 PM EDT
gpg:                using RSA key DF9B9C49EAA9298432589D76DA87E80D6294BE9B
gpg: checking the trustdb
gpg: marginals needed: 3  completes needed: 1  trust model: pgp
gpg: depth: 0  valid:   3  signed:   0  trust: 0-, 0q, 0n, 0m, 0f, 3u
gpg: Good signature from "Debian CD signing key <debian-cd@lists.debian.org>" [ultimate]
```
### Confirm shasums (be sure to edit the distro version below to match the one you downloaded)
```
sha512sum -c SHA512SUMS.txt 2>/dev/null | grep debian-live-11.5.0-amd64-kde+nonfree.iso
```
**https://danilodellaquila.com/en/blog/how-to-verify-authenticity-of-downloaded-debian-iso-images**

