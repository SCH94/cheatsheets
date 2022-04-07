#!/bin/bash

# this script will backup website files and mysql database. Return non-zero status on error

log() {
    # this sends message to syslog and to standard out.
    local MESSAGE="${@}"
    echo "${MESSAGE}"
    logger -t "${0}" "${MESSAge}"
}

check_status() {
    local STATUS="${@}"
    if [[ "${STATUS}" -eq 0 ]]
    then
        log "Backup completed"
        log "Backup file location: ${BACKUP_FILE}"
        log "Size of backup: $(du -lh ${BACKUP_FILE})"
        log "NOTE: backup will be deleted after 30 days."
    else
        log "Backup failed"
    fi
}

backup_files() {
    # this script will back up files.
    local FILE="${1}"

    # check if file exsist
    if [[ -d "${FILE}" ]]
    then
      BACKUP_FILE="/var/tmp"
      local BNAME="$(basename ${FILE}).$(date +%F-%N)"
      log "Backing up ${FILE} at ${BACKUP_FILE}"
      log "Backup started..."
      # compressing the files
      #tar -czvf "${BNAME}.tar.gz" "${FILE}" > "${BACKUP_FILE}" &> /dev/null
      tar -czvf "${BACKUP_FILE}/${BNAME}.tar.gz" "${FILE}"
      check_status "${?}"
    else
      return 1
    fi
}

backup_sql() {
    # this function will backup mysql database
    BACKUP_FILE="/var/tmp/mysql_.$(date +F-%N)"
    log "Backing up mysql database ${3}"
    mysqldump -u ${1} --password=${2} ${3} | gzip > "${BACKUP_FILE}.gz"
    check_status "${?}"
}

# testing if user is root
UUUID=$(id -u)
if [[ "${UUUID}" -ne 0 ]]
then
  log "$(id -un) is not a root user."
  log "Please use sudo"
  exit 1
fi

# check if user provided parameters
if [[ "${#}" -lt 1 ]]
then
  log "USAGE: ${0} [website_directory] [mysql_user] [mysql_password] [database_name]"
  exit 1
fi

read -p "Enter 1 for website backup \n 2 for mysql backup: " CHOICE

case "$CHOICE" in
1) backup_files "${1}" ;;
2) backup_sql "${2}" "${3}" "${4}" ;;
*) 
  log "Enter Valid Option."
  exit 1
esac