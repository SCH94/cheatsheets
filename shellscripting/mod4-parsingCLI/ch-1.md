# Case Statements
### case statement perfect for making decision based on value of given variable
  $ type -a case

  ### demostrate case statement
    if [[ "${1}" == 'start' ]]
    then
      echo "starting"
    elif [[ "${1}" == 'stop' ]]
    then
      echo "Stoping"
    elif [[ "${1}" = 'status' ]]
    then
      echo 'status:'
    else
      echo "supply valid option" >&2
      exit 1
    fi

    case "${1}" in
      start)
        echo 'starting'
        ;;
        # ;; to end the code block
      stop)
        echo "stoping"
        ;;
      status|state|--status|--state) # status OR state
        echo 'status'
        ;;
      *)
        echo "supply valid option" >&2
        exit 1
        ;;
    esac

    $ man bash
    /parrent matching

    $ help case

  ### spacing and style
    
    case statement is basis of most init script

    $ /etc/init.d/sshd status
    $ /etc/init.d/sshd stop

    patern were intended two spaces or tab

    case "${1}" in
      start) echo 'starting' ;;
      stop) echo "stoping" ;;
      status|state|--status|--state) echo 'status' ;;
      *)
        echo "supply valid option" >&2
        exit 1
        ;;
    esac
