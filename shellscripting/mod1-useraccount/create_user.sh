#!/bin/bash

# check if user is root

UUID=$(id -u)

if [[ "${UUID}" -ne 0 ]]
then
  echo "user is not root"
  exit 1
fi

# ask for username
read -p 'Enter username: ' USERN

# ask for real name
read -p 'Enter full name: ' FNAME
# generate password and create account
PASWD=$(date +%s%N${RANDOM}${RANDOM} | sha256sum | head -c 10)

#useradd -c "${FNAME}" -p "${PASWD}" -m ${USERN}
useradd -c "${FNAME}" -m ${USERN}

# set password

echo "${PASWD}" | passwd --stdin ${USERN}

if [[ "${?}" -ne 0 ]]
then
        echo "User could not be created"
        echo "EXIT_CODE: ${?}"
        exit 1
fi

# force user to change password
passwd -e ${USERNAME}
# show created user

echo "#============================#"
echo
echo "user: ${USERN}"
echo
echo "Password: ${PASWD}"
echo
echo "#============================#"
