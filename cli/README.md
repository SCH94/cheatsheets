# CLI Cheat Sheet

 ## syntax for CLI command.

    $ ls -l foo/   

    # '$' :- prompt, 'ls' :- command, '-l' :- option, 'foo/' :- argument. 

 ## echo :- display line of text

     $ echo "Hello World!"

       Hello World!

 ## pwd :- Print working directory

    $ pwd[option]

 ## cd :- change working directory

    $ cd foo
    $ cd ..   #  to move one directory up

 ## ls :- shows list of files and folders in directory

    $ls
    $ls -l  # -l :- long list
    $ls -a  # -a :- all files including hidden
    $ls -h  # -h :- size in human readable size.

 ## man :- displays manual of the command.

    $ man ls  # shows manual for ls

    $ man cURL # shows manual for cURL

 ## mkdir :- make empty directory.

     $ mkdir foo
     $ mkdir -p foo/foobar

 ## touch :- create empty file.

     $ touch foo.txt

 ## cat :- shows the content of files

    $ cat foo.txt

 ## rm :- remove files 

    $ rm foo.txt
    $ rm -r foo

 ## mv :- move a file or rename a file

    $ mv foo.txt foo/
    $ mv foo.txt bar.txt

 ## cp :- copy files 

    $ cp foo.txt foo/bar/
    $ cp -r foo foo/bar
    $ cp *.txt foo/

 ## ln :- creates association between files and folders.

    $ln a.txt b.txt   # a.txt source file, b.txt targeted file

    $ln -s src trgt

 ## Redirect (>) :- redirect output

    $echo "Hello" > hello.txt  redirects the output of echo to hello.txt

 ## Append (>>) :- appends output

    $echo "hello world" >> hello.txt appends the redirected output of echo in hello.txt  
   
 ## Difference :- comparison of files  
   
    $diff log.txt log1.txt   
    
 ## WildCards(*)  
   
    *a :- file end with a
    a* :- file start with a
    a*a:- file start and end with a
    *a*:- file having name a
   
 ## cURL :- utility allows us to interact with url's  
   
    $curl -OL cdn.arulvats.tk/sonnets.txt 
   
 ## which :- used to see if the given program is available at the command line  
   
    $which curl
    output: /usr/bin/curl
    output: (empty) if not available
   
 ## whereis :- used to find the location of program
   
    $whereis curl
    output: /usr/bin/curl
   
 ## bang(!) :- to run previous command  
   
    $echo "hello friend"
    $!!
    echo "hello freind"
    hello freind
    $!204
    command at 204 location in history will run
   
 ## History :- check the history of commands used  
   
    $history
   
 ## Reverse-in-search(^r) :- search previously used command
   
    press ctrl(^) + r
    (reverse-in-search): now just search the command by entering spelling of command

 ## sort :- sort in alphabetical manner

    $sort capitals.txt | cat >> sortedcapitals.txt
     
    sort sorts the content of files in alphabetical manner, |  redirects the output of command at left side to reight side.

 ## Head :- inspect the beginning of file.

    $head hnt.txt  # shows the first 10 lines that are at the begging of file

    $head -n 2 hnt.txt # -n number of lines to show

 ## Tail :- inspect the ending of file.

    $tail hnt.txt # shows last 10 lines
    $tail -f logs  # -f shows the file that is actively changing
   
 ## Word counts :- counts lines, words bytes
   
    $wc sonnets.txt
    output: 2620 17670 95635 sonnets.txt
    lines: 2620, words: 17670, bytes: 95635
   
 ## Less :- inspect the file 

     $less log.txt

      ^f :- move page forward
      ^b :- move page backward
      /  :- serach
      n  :- show next instance
      N  :- show previous instance
      g  :- move to end of file
      G  :- move to beginning of file 
      q  :- quit.
      
 ## Grep :- inspect file content  
   
    $grep rose sonnets.txt
    $grep -i rose sonnets.txt | wc
    $grep -in rose sonnets.txt
    $grep -r sesq text_files
   
 ## Find :- usefull for finding files  
   
    $find . -size +10M "*.wav"
    $find . -name "*.txt"
  
 ## XDG-Open :- opens argument using default program
   
    $xdg-open foo.pdf
   
 ## top :- which process consuming most resources
   
    $top
   
 ## ps :- find the process on system  
   
    $ps aux | grep firefox
   
 ## Kill :- kills the process
   
    $kill -15 12241
    $pkill -15 -f firefox
  
 ## Shortcuts :-

      ^a :- begining of line.
      ^e :- end of line
      ^u :- clears to beginning
      ^l :- clear
      ^d :- exit
      ^r :- reverse search for commands.
      tab :- auto completes the file name or command
