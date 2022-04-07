# Parsing Command Line Options with getopts, Part 2

  NUM=$(( 1 % 2 ))
  echo "${NUM}"

  NUM=$(( 6 / 4 ))
  echo "${NUM}"
  -> 1
  bash does not work with float, so we require bc
  
  $ type -a bc
  $ yum install -y bc
  $ echo '6 / 4' | bc -la
  -> 1.500000

  $ A=5
  $ B=5
  $ TOT=$(( A + B ))

  $ INC=5
  $ $(( INC++ ))
  $ $(( NUM += 5 ))

### Other ways to do math operations

  $ type -a let
  let NUM='2+3'
  echo ${NUM}

  $ type -a expr
  $ expr 1 + 1
  $ NUM=$(expr 1 + 1 )
  

  usage() {
    echo 'USAGE: ${0} [-vs] [-l LENGTH]' >&2
    echo 'Generate random password'
    echo ' -l LENGTH specift the password length'
    echo ' -v        Increase verbosity'
    echo ' -s        Append special character to password'
    exit 1
  }

  log() {
    local MESSAGE='$@'
    if [[ "${VERBOSE}" = 'true']]
    then
      echo "${MESSAGE}"
    fi
  }

  LENGTH=20

  while getopts vsl: OPTION
  do
    case ${OPTION} in
    v) 
      VERBOSE='true'
       log "verbose mode on'
       ;;
    l)
       LENGTH="${OPTARG}"
       ;;
    s)
       USE_SPECIAL='true'
       ;;
    ?)
       usage
       ;;
    esac
  done
  
  echo "Number of args: ${#}"
  echo "All args: ${@}"
  echo "arg 1: ${1}"
  echo "arg 2: ${2}"

  once the arguments are processed, they should be removed as a positional parameter.
  getopts doesn't do this for us, but it gives us a way to do it.
  in Getopts, there a variable named Optind, and it stores the position of the next command line argument
  following the options in that variable.

  ### Inspecting OPTIND
  echo "OPTIND: ${OPTIND}"
  
  ### remove the options while leaving the remaining options
  shift "$(( OPTIND - 1 ))"
  echo "OPTIND: ${OPTIND}"

  if [[ "${#}" -gt 0 ]]
  then
    usage
  fi

  log "generating password"
  PASSWORD=$(date +%s%N${RANDOM}${RANDOM} | sha256sum | head -c ${LENGTH})

  if [[ "${USE_SPECIAL}" = 'true']]
  then
    log "selecting random special character"
    SPECIALC=$(echo '!@#$%^&*()_+~=' | fold -w1 | shuf)
    PASSWORD=${PASSWORD}${SPECIALC}
  fi

  log 'Done'
  log 'Password generated'
  echo "${PASSWORD}"

  
  