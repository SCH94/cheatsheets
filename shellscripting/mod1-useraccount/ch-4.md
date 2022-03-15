# Reading standard input(stdin), creating accounts, username conventions, more quoting

  ## create account on localsystem
  ## promted for username and password

  ## Ask for username

    $type -a read
    $ help read | less
    read -> read line from stdin and split into fields
         -> three types of input and output : stdin
                                            : stdout
                                            : stderr 
    
    read -p 'Enter the username: ' USER_NAME
  ## Ask real name

    read -p 'Enter the name of the person: ' COMMENT

  ## Ask password
    
    read -p 'Enter the password for the account: ' PASSWORD
  
  ## create user
    $man useradd
    search configuration, to see how to change behaviour of this tool
    $cat /etc/login.defs
    
    useradd -c "${COMMENT}" -m ${USER_NAME}

  ## set password for user

    $man passwd

    echo ${PASSWORD} | passwd --stdin ${USER_NAME}

  ## force password change for user on first login

    passwd -e ${USER_NAME}


