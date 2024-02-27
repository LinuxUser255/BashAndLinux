#!/usr/bin/env bash

# to lazy to type git clone
echo ''
read -p 'Enter the Github repo to clone: ' REPO

git clone "${REPO}"
echo ''
