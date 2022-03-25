# The while Loop, Infinite Loops, Shifting, Sleeping
  ## use shift and while loop
  
  ## display first three parameters
    echo
    echo "Parameter 1: ${1}"
    echo "Parameter 2: ${2}"
    echo "Parameter 3: ${3}"
    echo
    
    $ type -a while

    while COMMANDS; do  COMMANDS; done

    executes as long as the final commands has an exit status of zero
    
    X=7
    while [[ "${x}" -ge 1 ]]
    do
      echo "value of x: ${x}"
      X--
      # x-- is same as x=x-1.
    done
    
    $ type -a true
    returns exit status of zero

    $ type -a sleep
    delay for a specified amount of time.

    $ sleep 1s

    while [[ true ]]; do echo "${RANDOM}"; done

    press ctr(^) + c ---> sends interept status to command

    $ type -a shift
    shift positional parameters
    rename the positional parameter $N+1,$N+2... to $1, $2
    if N is not given, it is assumend 1


  ## loop through all positional parameters
    
    while [[ "${#}" -gt 0 ]]
    do
      echo "Numnber of parameters: ${#}"
      echo " Parameter 1: ${1}"
      echo " Parameter 2: ${2}"
      echo " Parameter 3: ${3}"
      echo
      shift
    done