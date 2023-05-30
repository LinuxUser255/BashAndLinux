#!/bin/bash

read -p 'Enter file name to encrypt: '  FILE

# edit/type your gpg key email id between the <>
gpg --encrypt --sign --armor -r <yourgpgkey@emailid.com> ${FILE}
