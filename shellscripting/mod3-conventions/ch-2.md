# Advanced Standard Input, Standard Output, and Standard Error - Part II

  ### File descriptors
    FD 0 --> stdin
    FD 1 --> stdout
    FD 2 --> stderr

    read X < /etc/os-release
    echo ${X}

    explicit way of doing above thing

    read X 0< /etc/os-release
    echo ${X}

    echo "${UID}" > uid
    echo "${UID}" 1> uid

    head -n 1 /etc/passwd /etc/hosts /fakefile
    stdout and stderr both generated here

    head -n 1 /etc/passwd /etc/hosts /fakefile > head.out
    stdout stored in file and stderr shown on screen

    head -n 1 /etc/passwd /etc/hosts /fakefile 2> head.err
    stderr stored in file and stdout shown on screen

    head -n 1 /etc/passwd /etc/hosts /fakefile > head.out 2>> head.err
    redirect stdout and stderr in different files

    head -n 1 /etc/passwd /etc/hosts /fakefile > head.out 2>&1
    both stdout and stderr in same file, 2>&1 redirst err as stdout

    head -n 1 /etc/passwd /etc/hosts /fakefile &> head.out
    both stdout and stderr in same file,

    head -n 1 /etc/passwd /etc/hosts /fakefile | cat -n   --> -n tells line
    stderr wont be passes throug pipe

    head -n 1 /etc/passwd /etc/hosts /fakefile 2>&1 | cat -n 
    stdout and stderr both will be passed through pipe

    head -n 1 /etc/passwd /etc/hosts /fakefile |& cat -n
    same as above

  ### Redirect stdin using FD 0
    
    read LINE 0< ${FILE}
    echo
    echo "${LINE}"

  ### Redirect stdout using FD 1

    head -n 3 /etc/passwd 1> ${FILE}
    echo
    echo "${FILE}"
    cat -n "{FILE}"

  ### Redirect stderr using FD 2

    ERR_FILE="/tmp/data.err"
    head -n 3 /etc/passwd /fakefile 2> ${ERR_FILE}

  ### Redirect stdout and stderr to a file

    head -n 3 /etc/passwd /fakefile &> ${FILE}
  
  ### Redirect stdout and stderr through pipe

    head -n 3 .etc/passwd /fake |& cat -n

  ### send output to std err

    echo "Errrrr" >&2

    ./script.sh 2> err

  ### /dev/null

    head -n 3 /etc/passwd /fake > /dev/null
    stderr on screen, stdout redirects to null

    head -n 3 /etc/passwd /fake 2> /dev/null
    stdout on screen, stderr redirects to null

    head -n 3 /etc/passwd /fake &> /dev/null
    stdout and stderr redirects to null

  ### clean up

    rm ${FILE} ${ERR_FILE} &> /dev/null