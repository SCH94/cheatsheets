# special variables, psuedocode, command substitution, if statement
  
  ## Display uid and username of user executing the script
    
    psuedocode:- think about steps you need to take to accomplish your goal, write them in plane english as comment and then write the shell command for it.

  ## display uid
    
    echo "Your UID is ${UID}"

    $type -a id
    $id -u
    
    $man bash

    UID and EUID will only be different when there is set uid on script
 
  ## display username
    UNM=$(id -un)   --> store output of command in variable, command inside () will be executed first and output will be stored in variable
    
    echo "Your USER is ${USER}"
    
    UNM=`id -un`  --> ` is called tick, work exactly like $().

    $id -un
    $whoami

  ## display if user is root user
    
    if [[ "${UID}" -eq 0 ]]
    then
        echo 'You are root'
    else
        echo 'You are not root'
    fi
    
    $type -a if

    if [[ "${UID}" -eq 0 ]]; then echo 'you are root'; fi

    $type -a [[
    $help [[
    
    [[expression]] --> returns 0 or 1, depending upon expression.

    $type -a test
    $help test -> all the test we can do, like if file exists, string operators, arithmatic tests etc.

    $type -a [


    
    


 