# How to verify the integrity of a NodeJS download 

- Download the .tar.xz file here:
```
https://nodejs.org/en/
```

- Get the signing keys:
```
git clone https://github.com/nodejs/release-keys.git
```

- cd into the directory and run the cli.sh script to import all node dev signing keys
```
./cli.sh import
```

- Retrieve the latest shasums
```
curl -O https://nodejs.org/dist/latest/SHASUMS256.txt
```

- curl the latest shasums .sig
```
curl -O https://nodejs.org/dist/latest/SHASUMS256.txt.sig
```

- Then gpg verify them
```
gpg --verify SHASUMS256.txt.sig SHASUMS256.txt
```

- Successfull response
```
linux@debian$ ~/Downloads/nodejsDownloads  

gpg --verify SHASUMS256.txt.sig SHASUMS256.txt
gpg: Signature made Thu 02 Feb 2023 11:13:39 AM EST
gpg:                using RSA key 108F52B48DB57BB0CC439B2997B01419BD92F80A
gpg: Good signature from "Ruy Adorno <ruyadorno@hotmail.com>" [unknown]
gpg: WARNING: This key is not certified with a trusted signature!
gpg:          There is no indication that the signature belongs to the owner.
Primary key fingerprint: 108F 52B4 8DB5 7BB0 CC43  9B29 97B0 1419 BD92 F80A
```


- And for good measure, generate the sha256sum of the tar file and compare it tho the sha256sum in the SHASUMS256.txt.sig fileby outputing the generated sum in a separate file and using the diff command to compare the two

```
sha256sum node-v18.14.0-linux-x64.tar.xz > node-v18.14.0-linux-x64.tar.xz.256sum
```

- Then compare with diff

```
diff node-v18.14.0-linux-x64.tar.xz.256sum nodesum256asc.txt
```
- No output generated, therefore it's legit.


