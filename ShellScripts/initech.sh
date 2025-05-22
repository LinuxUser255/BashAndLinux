#!/bin/bash

# WELCOME TO INITECH!
# This script creates a new user on the local system.

# Make sure the script is being executed with sudo privileges.
if [[ "${UID}" -ne 0 ]]
then
   echo 'Please run with sudo or as root.'
   exit 1
fi

# Get the username (login).
read -p 'Enter the username to create: ' USER_NAME

# Get the real name (contents for the description field).
read -p 'Enter the name of the person that will be using this account: ' COMMENT

# Get the password.
read -p 'Enter the user's password: ' PASSWORD

# Create the account.
useradd -c "${COMMENT}" -m ${USER_NAME}

echo 'Welcome to INITECH!'

# Check to see if the useradd command succeeded.
if [[ "${?}" -ne 0 ]];
then
  echo 'The account could not be created.'
elif [[ "${?}" -eq 0 ]];
 then
   echo 'Welcome to INITECH!'
  exit 1

fi

# Set the password.
echo "${USER_NAME}" 

