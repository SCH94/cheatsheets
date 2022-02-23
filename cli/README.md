# CLI Cheat Sheet

 ## syntax for CLI command.

    $ ls -l foo/   

    # '$' :- prompt, 'ls' :- command, '-l' :- option, 'foo/' :- argument. 

 ## echo :- display line of text

     $ echo "Hello World!"

       Hello World!

 ## pwd :- Print Present working directory
 By default, pwd will list the “logical” path of your current directory. This means it will treat symlinked paths (see Section 1.4.3) as if they were the actual paths.  For example, my development directory doesn’t exist under my home folder, /Users/sch; instead it is symlinked to a folder inside of /Users/sch/Dropbox.

    $ pwd[option]

 ## cd :- change working directory

    $ cd foo
    $ cd ..   #  to move one directory up

 ## ls :- shows list of files and folders in directory

    $ls
    $ls -l  # -l :- list out the names of the files and directories as well as give more detailed information about them.
    $ls -a  # -a :- all files including hidden
    $ls -h  # -h :- size in human readable size.by default its in bytes.
    $ls -s  # -s :- sort by file size, instead of the default sorting by name.
    $ls -t  # -t :- sort by last modified time
    $ls -r  # -r :- reverse sort 
    $ls /home/sch # :- list the files and directories inside of the /usr/sch directory, without having to leave the current directory

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

 ## ln :- creates association from files and folders to another.By default hard link
 hard links they only work on the current file system, don not work for directories.

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
    $curl -o wordpress.zip https://wordpress.org/latest.zip  
    $curl -CO  https://wordpress.org/latest.zip  
   
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
    $grep -i rose sonnets.txt | wc # -i insensitive search
    $grep -in rose sonnets.txt # -n displays line number
    $grep -r sesq text_files
    $grep "r..y" README.md # all words that have r followed by any two characters, then followed by the letter y like ruby, rary.
    $grep -c world\'s sonnets.txt # counts the occurence for the word worlds in sonnets.txt
    $grep -A 5 -i rose sonnets.txt # also shows next five lines after the rose word is found
    $grep -B 5 -i rose sonnets.txt # also shows next five lines before the rose word is found
    
   
 ## Find :- usefull for finding files  
   
    $find . -size +10M "*.wav"
    $find . -name "*.txt"
    $find . -name \*.txt # same as $find . -name "*.txt"
    $find . -path \*session\*
    $find . -path "*session*" # same as $find . -path \*session\*
    $find . -path \*session\* -type f # look exclusively for files whose path contains session
    $find . -path \*session\* -type d # look exclusively for directories whose path contains session
    $find . -path \*session\* -type f -name \*mem\* # only files whose path name contains session and whose file name contains mem. this was AND query
    $find . \( -name \*.gemspec -or -name \*.jpg \) -type f # OR query
    $find . \( -name \*.gemspec -or -name \*.jpg \) -type f # find file and delete them and print them
  
 ## XDG-Open :- opens argument using default program
   
    $xdg-open foo.pdf
   
 ## top :- which process consuming most resources
   
    $top
   
 ## ps :- find the process on system  
   
    $ps aux | grep firefox
   
 ## Kill :- kills the process
   
    $kill -15 12241
    $pkill -15 -f firefox
 ## vim: code editor
    i :- insert mode
    o :- open line below and enter insert mode
    d :- delete line
    / :- search
    u :- undo
    y :- yank(copy)
    j :- move one line below
    k :- move one line above
    $ :- move to end of line
    > :- indent
    < :- unindent 
  
 ## Shortcuts :-

      ^a :- begining of line.
      ^e :- end of line
      ^u :- clears to beginning
      ^l :- clear
      ^d :- exit
      ^r :- reverse search for commands.
      tab :- auto completes the file name or command
