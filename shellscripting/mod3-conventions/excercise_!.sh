#!/bin/bash

# check if the user is root user
UUID=$(id -u)
if [[ "${UUID}" -ne 0 ]]
then
  echo "$(id -un) is not a root user" >&2
  echo "Exit_code: ${?}" >&2
  exit 1
fi

# check if parameters are passed
if [[ "${#}" -lt 1]]
then
    echo "USAGE: ${0} [USERNAME] [COMMENT]..." >&2
    exit 1
fi

# generate password
PASWD=$(date +%s%N${RANDOM}${RANDOM} | sha256sum | head -c 10)

# username
USERN="${1}"
# comment
# shift every thing down by one ${1} ${2}, ${2} will shift therefor parameters will be now only ${2}
shift
COMMENT="${@}"

# create account
useradd -c "${COMMENT}" -m "${USERN}" &> /dev/null
if [[ "${?}" -ne 0 ]]
then 
  echo "something went wrong." >&2
  echo "EXIT_CODE: ${?}" >&2
  exit 1
fi

# reset password
echo "${PASWD}" | passwd --stdin "${USERN}"
if [[ "${?}" -ne 0 ]]
then
    echo "Password could not be set" >&2
    echo "EXIT_CODE: ${?}" >&2
    exit 1
fi

passwd -e ${USERN} &> /dev/null
# desplay user info

echo "+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+"
echo "USER: ${USERN}"
echo "PASSWORD: ${PASWD}"
echo "Host: ${HOSTNAME}"
echo "+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+"
echo "Script completed"
echo "EXIT_CODE: ${?}"
exit 0