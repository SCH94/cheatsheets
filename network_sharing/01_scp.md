File sharing overview
---
__To copy a file over from local host to a remote host__

```
$ scp myfile.txt username@remotehost.com:/remote/directory

$ scp -i private_key.pem myfile.txt username@remotehost.com:/remote/directory
```
__To copy over a directory from your local host to a remote host__

```
$ scp -r mydir username@remotehost.com:/remote/directory

$ scp -i private_key.pem -r mydir username@remotehost.com:/remote/directory
```
__To copy a file from a remote host to your local host__

```
$ scp username@remotehost.com:/remote/directory/myfile.txt /local/directory
```

