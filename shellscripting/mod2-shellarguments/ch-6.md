# Positional Parameters, Arguments, for Loops, Special Parameters
  ## random password generation for each user specified on cli
  ## display the user typedon cli
    parameter:- variables used inside the shell script
    Argument:- data passed into the shell script
    arguments becomes the value stored in parameter
    positional parameter: $0 $1 $2
    $1 stores the value of first argument passed at the script
    
    $ vim script.sh
    echo "Executed: ${0}"

    $ .script.sh

    $ man bash
    /PATH

    $ which head
    /usr/bin/head

    $sudo vim /usr/local/bin/head
    echo "hello this is head test"
    
    $ which -a head

    $ head
    hello this is head test
    
    $ /usr/bin/head -n 5

    linux keeps hash to store locations of commands
    after deleting /usr/local/bin/head,and we run head we will get no such file or directory

    $ hash -r  --> to reset hash

    $man basename
    strip directory and suffix from filenames.

    $basename /vagrant/script.sh
    script.sh

    $man dirname
    strips last component from file name.

    $ dirname /vagrant/script.sh
    /vagrant

  ## display path and filename of the script
    
    echo "path($(dirname ${0})) for script $(basename $0)"

    $ man bash
    /special parameters

  ## argument they passed

    NUM_PAR="${#}"
    echo "parameter passed: ${NUM_PAR}"

    $ ./script.sh hello there

  ## check at least one argument is supplied

    if [[ "NUM_PAR" -lt 1]]
    then
      echo "Usage: ${0} USER_NAME [USER_NAME]..."  ---> anything in [] is optional
      exit 1
    fi

    echo ${?} --> exit status for last command ran.

  ## loops

    $ help for
      for [NAME in WORDS]; do COMMANDS; done

      for X in list
      do
        echo "Hi, ${x}"
      done

    $ help bash
    /speacial parameters
    '$@' ----> $1 $2 $3
    "$*" ----> $1c$2C$3c
    
  ## generate password for each parameter

    for USERN in "${@}"
    do
      PASWD=$(date +%s%N${RANDOM}${RANDOM} | sha256sum | head -c 20)
      echo "${USERN}: ${PASWD}"
    done




