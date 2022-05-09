Tar
----

### Tar options

* c – create a archive file.
* x – extract a archive file.
* v – show the progress of archive file.
* f – filename of archive file.
* t – viewing content of archive file.
* j – filter archive through bzip2.
* z – filter archive through gzip.
* r – append or update files or directories to existing archive file.
* W – Verify a archive file.
* wildcards – Specify patters in unix tar command.

### creating tar archive

    tar -cvf archive.tar /dir/to/files/

* c – Creates a new .tar archive file.
* v – Verbosely show the .tar file progress.
* f – File name type of the archive file.

### create compressed tar.gz archive

    tar -czvf archive.tar.gz /dir/to/files/

* c: Create an archive.
* z: Compress the archive with gzip.
* v: makes tar talk a lot. Verbose output shows you all the files being archived and much.
* f: Allows you to specify the filename of the archive.

### compress even more

    tar -cjvf archive.tar.gz /dir/to/files/

### unTAR archive

    tar -xvf archive.tar -C /dir/to/extract/

### extract tar.gz

    tar -xvzf archivee.tar.gz

### List Archive File Contents

    tar -tvf archive.tar
    tar -ztvf archive.tar.gz
    tar -jtvf archive.tar.bz2
    tar -Jtvf archive.tar.xz

### extract single file

    tar --extract --file=archive.tar file1.txt

### extract multiple files

    tar -xvf Archive.tar "file 1" "file 2"

### Extract group of files

    tar -xvf Archive.tar --wildcards *.txt'

### add files of directory to TAR

    tar -rvf Archive.tar xyz.txt  #add file
    tar -rvf Archive.tar php      # add directory
