#!/bin/bash

# this script shows and removes the application logs

# check if user is root
UUID=$(id -u)

if [[ "UUID" -ne 0 ]]
then
  echo "$(id -un) is not a root user" >&2
  echo "USAGE: sudo ${0}" >&2
  exit 1
fi

# show the size of logs
echo "size|location" | column -t -s "|"; du -lh /var/log/ 

if [[ "${?}" -ne 0 ]]
then
  echo "Something went wrong" >&2
  exit 1
fi

# Getting the application name
read -p "Enter the dir name for which you want to remove the logs: " PNAME
FILEDIR="/var/log/${PNAME}"

# checking if folder and files exsist
if [[ ! -d "${FILEDIR}" ]]
then
  echo "${PNAME} could not be found at location $(dirname ${FILEDIR})" >&2
  exit 1
fi

if [[ ! -n "$(ls -A ${FILEDIR}/ 2> /dev/null)" ]]
then
  echo "Could not find files at ${FILEDIR}" >&2
  echo "Size of ${PNAME} logs folder: $(du -lh /var/log/${PNAME}/ | awk '{ print $1 }')" >&2
  exit 1
fi

# deleting files
rm -r ${FILEDIR}/* &> /dev/null

if [[ "${?}" -ne 0 ]]
then
  echo "${PNAME} delete failed..." >&2
  exit 1
fi

echo
echo "${PNAME} Logs Deleted"
echo
exit 0