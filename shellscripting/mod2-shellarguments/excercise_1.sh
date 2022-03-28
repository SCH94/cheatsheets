#!/bin/bash

# check if user is root
UUID=$(id -u)

if [[ "${UUID}" -ne 0 ]]
then 
  echo "$(id -un) is not a root user." 
  exit 1
fi
# check if atleast one parameters are provided, usage statement
ARGS="${#}"

if [[ "${ARGS}" -lt 1 ]]
then
  echo "USAGE: ${0} [USER_NAME] [COMMENT]"
  exit 1
fi
# generate a password
PASWD=$(date +%s%N${RANDOM}${RANDOM} | sha256sum | head -c 10)

# create account
useradd -c "${2}" -m "${1}"

# check if account created successfully
if [[ "${?}" -ne 0 ]]
then
  echo "Could not create account"
  echo "EXIT_CODE: ${?}"
  exit 1
fi

# set password
echo "${PASWD}" | passwd --stdin "${1}"
# passwd --stdin "${1}" < "${PASWD}"

# check if password set successfully
if [[ "${?}" -ne 0 ]]
then
  echo "Could not set password"
  echo "EXIT_CODE: ${?}"
  exit 1
fi

# Force password change on first login
passwd -e "${1}"
# display credentials
echo "#==========================#"
echo "#   USERNAME: ${1}         #"
echo "#                          #"
echo "#   PASSWORD: ${PASWD}     #"
echo "#==========================#"
