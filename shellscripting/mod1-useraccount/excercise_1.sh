#!/bin/bash

# check if script is running as root

if [[ "${UID}" -ne 0 ]]
then
  echo "${id -un} is not a root user"
  echo 'Please run with sudo or as root.'
  exit 1
fi

# ask for username

read -p 'Enter username: ' USERNAME

# ask for  fullname

read -p 'Enter full name: ' COMMENT

# ask for password

read -p 'Enter password: ' PASSWORD

# create account

useradd -c "${COMMENT}" -m "${USERNAME}"

# if not created display exit code

if [[ "${?}" -ne 0 ]]
then 
  echo "--[ERROR]--: Could not create account"
  echo "exit code: ${?}"
  exit 1
fi

# set password

echo ${PASSWORD} | passwd --stdin ${USERNAME}

# display exit code

if [[ "${?}" -ne 0 ]]
then 
  echo "--[ERROR]--: Could not set password"
  echo "exit code: ${?}"
  exit 1
fi

# force user to change password

passwd -e ${USERNAME}

# Display information
echo
echo "username: ${USERNAME}"
echo
echo "password: ${PASSWORD}"
echo
echo "host: $(hostname)" 
exit 0