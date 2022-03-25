# Random Data, Cryptographic Hash Functions, Text and String Manipulation.

  ## generate list of random passwords
    
    $man bash
    search random --> random variable

    $ echo "${RANDOM}"

  ## Random number as passwd
    
    PASSWORD="${RANDOM}"
    echo "${PASSWORD}"

    chmod 755 script.sh

    $ !v --> execute most recent command that started with giveb string. this is called event designator.this will takke us directly to script editing.

  ## Three random numnbers together

    PASSWORD="${RANDOM}${RANDOM}${RANDOM}"
    echo "${PASSWORD}"

    $ !.

  ## using current date as the basis for generating random data

    $ man date
    search format

    $ date +%s

    PASSWORD=$(date +%s)
    echo "${PASSWORD}"

    $ !m
  
  ## use nanoseconds to act as randomization

    $ date +%s%N

    PASSWORD=$(date +%s%N)
    echo "${PASSWORD}"

  ## checksums, cryptographic hash functions

    checksum --> numeric value computed for block of data that is relitively unique, used to check integrity of data of files.

    cat sha1sum.txt
    
    $ find *.iso
    $ sha1sum bodhi.iso
    f615b5d1b6fd2f3f7298b2bd2a8363de0a811796 *bodhi-6.0.0-64-apppack.iso

    $ sha256sum bodhi-6.0.0-64-apppack.iso
    a610ec78c3819cca23d153e1a6e0635d662d439601f9d764d5c780f1cd485f51 *bodhi-6.0.0-64-apppack.iso

    $ ls -l /usr/bin/*sum

    $ date +%s | sha256sum

    $ type -a head

    PASSWORD=$(date +%s%N | sha256sum | head -c 32)
    echo "${PASSWORD}"
    
  ## even better password

    PASSWORD=$(date +%s%N${RANDOM}${RANDOM} | sha256sum | head -c 48)
    echo "${PASSWORD}"

  ## append special characters to password
    
    $ SV='!@#$%^&*()_-+='
    $ echo "${SV}" | shuf

    $ man shuf --> generate random permutation
<<<<<<< HEAD

=======
>>>>>>> devops
    $ man fold --> wrap each input line to fit in specified width

    $ echo "${SV}" | fold -b 1
    $ echo "${SV}" | fold -w 1 | shuf | head -c 1

    SPEACIAL_CHARATER=$(echo '!@#$%^&*()_-+=' | fold -w 1 | shuf | head -c 1)
    echo "${PASSWORD}${SPECIAL_CHARACTER}"





    