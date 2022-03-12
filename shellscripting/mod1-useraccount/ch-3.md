# Exit statuses, Return codes, String test conditionals, special variables
  
  Exit status -> if given command succeded or failed.
  
  #!/bin/bash
  ## display the uid and user.
  ## display if user is vagrant or not
  
  ## display uid

    echo "the uid is ${UID}"

  ## only display if uid not equal 1000
  
    DRY -> dont repeat yourself

    UID_T='1000'
    
    if [["${UID}" -ne "${UID_T}" ]]
    then
        echo "Your uid does not match"
        exit 1    --> stop the execution of script, exit status 0 if complete script executes successfully to the bottom of script, any other number if not executes completely.
    fi
  
    $ man useradd
  search for exit values in useradd manual.

  ## display username

    USR=$(id -un)

  ## username command succeded
    $? --> special variable,  hold the exit status of most recently command executed.

    if [[ "${?}" -ne 0 ]]
    then
        echo "failed to execute command"
        exit 1
    fi
    echo "Your username is ${USER_NAME}"

  ## string test conditional

    USR=$(id -un)

    if [[ "${USER_NAME}" = "${USR}" ]]
    then
        echo "matched"
    fi

  = --> used depending of context, for variables used as assignment however when we are doing test inside [[]] then its a test operator comparing

  == -> string to the right is used as pattern and pattern matching is performed.

  ## test for !=(not equal) for the string.

    if [[ "${USER_NAME}" != "${USR}" ]]
    then
        echo "NOT matched"
        exit 1
    fi
    exit 0

  exit 0   --> script completed successfully we we dont use exit 0 at end of script then the most recently runned command exit code will be used.