# Chapter-1
  ## naming, permissions, variables, builtins

    $vim $HOME/luser-1.sh    
    #!/bin/bash

    # -> sharp
    ! -> bang
    #! -> shebang

  ## displaying text
        
    echo 'Hello'
  
  ## changing permission for luser-1.sh

    $ chmod 755 $HOME/luser-1.sh

    r -> 4
    w -> 2
    x -> 1

  ## executing script

    $ ./luser-1.sh
    $ sh luser-1.sh
    $ $HOME/luser-1.sh

  ## type of command
    
    $ type echo

    see all instance of echo

    $ type -a echo  --> if builtin command, you can use help command with it

    $ /usr/bin/echo 'hello'

    $ help echo
    $ man uptime
  
  ## Assigning a variable
    
    WORD='script'
    _WORD='bash'
    no space between word and =

    3WORD -> not a valid variable

  ## Display value of variable

    echo "$WORD"

  ## single quotes prevents the expansion of variables.

    echo '$WORD'
    echo "this is bash $WORD"

  ## ALternative method to display variable

    echo "this is bash ${WORD}"

  ## Append text to variable

    echo "${WORD}ing is fun"

    ENDING='ed'

  ## combining two variables

    echo "This is ${WORD}${ENDING}

  ## Re-assinging value of variable

    ENGING='ch'
  


    


