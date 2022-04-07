# Parsing Command Line Options with getopts, Part 1
  In this lesson, you'll learn how to process command line options using the shell built in getopts.
  If you want your Shell scripts to behave like other Lennix executables, you're going to want to allow
  users to specify options that change the behavior of your scripts.
  
  $ type -a getops

  $ help getops
  Getopts is used by shell procedures to parse positional parameters as options.
  You'll need to use getups in a while Loop getups returns zero as long as it finds an option to process.
  Otherwise, it returns one which will cost the while loop to exit.
  
  #### user can add password length with -l and special characters with -s
  #### verbose mode can be enabled with -v


  usage() {
    echo 'USAGE: ${0} [-vs] [-l LENGTH]' >&2
    echo 'Generate random password.'
    echo '  -l LENGTH specify the password length.'
    echo '  -v        Increase Verbosity'
    echo '  -s        Append special character to password'
    exit 1
  }

  log() {  
    local MESSAGE="${@}"
    if [[ "${VERBOSE}" = 'true' ]]
    then
      echo "${MESSAGE}"
    fi
  }
  #### set default value for password length
  LENGTH=48

  while getopts vl:s OPTION
  do
    case ${OPTION} in
      v)
        VERBOSR='true'
        log 'Verbose mode on.'
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


  When an option requires an argument, getopts places that argument into the shell variable opt arge here, we're signing that arguments value to the link variable.

  log "Generating password"

  PASSWORD=$(date +%s%N${RANDOM}${RANDOM} | sha256sum | head -c ${LENGTH})

  # append special character

  if [["${USE_SPECIAL}" = 'true' ]]
  then
    log "Selecting a random special character"
    SPECIAL_C=$(echo '!@#$%^&*()_+=' | fold -w1 | shuf | head -c 1)
    PASSWORD="${PASSWORD}${SPECIAL_C}"
  fi

  log "Done."
  log "Generated password:"
  echo "${PASSWORD}"