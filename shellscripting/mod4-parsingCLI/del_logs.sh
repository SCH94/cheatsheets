#!/bin/bash

# this script deletes the application logs

# Getting the application name
FILEDIR="/var/log/${1}"

# check if user is root
UUID=$(id -u)

if [[ "UUID" -ne 0 ]]
then
  echo "$(id -un) is not a root user" >&2
  exit 1
fi

# checking if parameter are given
if [[ "${#}" -lt 1 ]]
then
  echo "USAGE: ${0} [PROGRAM_NAME]" >&2
  exit 1
fi

# deleting the logs
rm -r ${FILEDIR}/*

if [[ "${?}" -ne 0 ]]
then
  echo "Something went wrong" >&2
  exit 1
fi

echo
echo "Logs Deleted"
echo
exit 0
