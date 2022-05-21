Remote Synchronization
---

Rsync is very similar to scp, but it does have a major difference. Rsync uses a special algorithm that checks in advanced if there is already data that you are copying to and will only copy over the differences. For example, let's say that you were copying over a file and your network got interrupted, therefore your copy stopped midway. Instead of re-copying everything from the beginning, rsync will only copy over the parts that didn't get copied.

It also verifies the integrity of a file you are copying over with checksums. These small optimizations allow greater file transfer flexibility and makes rsync ideal for directory synchronization remotely and locally, data backups, large data transfers and more.

some commonly used rsync options:
- z: compression for easier transfer, great for slow connections
- v: verbose output
- r: recursive
- h: human readable output

__Copy/sync files on the same host__
```
$ rsync -zvr /my/local/directory/one /my/local/directory/two
```

__Copy/sync files to a remote host from a local host__
```
$ rsync username@remotehost.com:/remote/directory /local/directory
```

__Copy/sync files to local host from a remote host__
```
$ rsync /local/directory username@remotehost.com:/remote/directory
```
