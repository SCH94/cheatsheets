# Advanced Standard Input, Standard Output, and Standard Error - Part I

  ### I/O Redirection
    stdin,stdout,stderr
  
  ### Redirect STDOUT to a file

    FILE="/tmp/data"
    head -n 1 /etc/passwd > ${FILE}

  ### REdisrect STDIN to a program
    
    read LINE < ${FILE}
    echo "${LINE}"
    
    echo "pasd" > password
    passwd --stdin einstein < password

  ### Redirect STDOUT to a file, overwriting the file
    
    head -n 3 /etc/passwd > ${FILE}
    echo
    echo "COntent of ${FILE}:
    cat ${FILE}

  ### Appending STDOUT to a file.

    echo "${RANDOM}${RANDOM}" >> PASWD
    echo "${RANDOM}${RANDOM}" >> PASWD
    echo
    echo "Contents of $FILE:
    cat ${PASWD}



