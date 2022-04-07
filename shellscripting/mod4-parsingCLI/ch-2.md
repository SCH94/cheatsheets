# Functions
    Functions -> group of comands
    use code at multiple places in your script
    DRY -> do not repeat yourself
    break code in to smaller parts

    $ help function

    log() {
        echo 'You called a log function'
    }

    log

    function test {
        echo 'You called a test function'
    }

    test
  #### local is local variable that exsist inside the function and not available outside the function
  #### $@ expands to all the positional parameters starting from one.
    log() {
        local MESSAGE="${@}"
        if [[ "${VERBOSE}" = 'true']]
        then
            echo "${MESSAGE}"
        fi
    }

    log 'hello'
    VERBOSE='true'
    log 'this is fun'

    log() {
        local VERBOSE="${1}"
        shift
        local MESSAGE="${@}"
        if [[ "${VERBOSE}" = 'true']]
        then
            echo "${MESSAGE}"
        fi
    }

    VERBOSITY='true'
    log "${VERBOSITY}" 'hello'
    log "${VERBOSITY}" 'This is fun'

  #### if we differentiating information messages, normal messages,critical messages, then passing log level would make sense because it can change through out the script

  ### handle the main concern of using global variables within functions, which is that a function might actually change the value of that global variable.

    log() {
        local MESSAGE='${@}'
        if [[ "${VERBOSE}" = 'true' ]]
        then
            echo "${MESSAGE}"
        fi
    }

    readonly VERBOSE='true'
    log 'hello'
    log 'This is fun'

  #### readonly -> makes variable unchangeable i.e constant variable.

  ### sending messages to system logs
   #### we will use comand line utility called logger

    $ type -a logger
    
    $ logger "hello"
    $ logger -t "bros" "hello"

   #### we can send the logs to remote servers.

    log() {
        # this sends message to syslog and to standard out if verbose is true.
        local MESSAGE='${@}'
        if [[ "${VERBOSE}" = 'true' ]]
        then
            echo "${MESSAGE}"
        fi
        logger -t "${0}" "${MESSAGE}"
    }

    readonly VERBOSE='true'
    log 'hello'
    log 'This is fun'

    $ sudo tail /var/log/messages

  ### script to update several files and make a backup

    backup_files() {
        # this function creates a back up of files. Returns non zero status on error.

        local FILE="${1}"

        # make sure if file exsist
        if [[ -f "${FILE}"]]
        then
          local BACKUP_FILE="/var/tmp/$(basename ${FILE}).$(date +%F-%N)"
          log "Backing up ${FILE} at ${BACKUP_FILE}"

          # the exit status of function will be exit status of cp command
          cp -p ${FILE} ${BACKUP_FILE}
        else
          # file does not exist so return non zero status
          return 1
        fi
    }

    backup_file '/etc/passwd'

    type -a backup_file

    files at /tmp deleted after 10 days
    files at /var/tmp/ deleted after 30 days

