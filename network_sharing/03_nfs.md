Network File SHaringf
---

NFS allows a server to share directories and files with one or more clients overthe network.

steps:
- Install NFS using yum
- Create test directory and files
- Modify the NFS exports file `/etc/exports`
- test using a computer running oracle linux 8

__Install NFS__
```
$ yum install -y nfs-utils nfs-utils-lib
```

__Create test directory & files__
```
$ mkdir -p /public/data

$ cd /public/data

$ touch nfs{1..3}
```

__Modify the NFS exports file__

This is the file that configures the shares

we have to populate it with the directories we want to export/share

```
$ vim /etc/exports

```
Add:

Directory   ip(permission)
- ro: read only
- rw: read write

```
/public *(ro,sync)
```

- `*`: meaning every one 

__Enable NFS__
```
$ systemctl status rpcbind

$ service rpcbind status

$ systemctl start nfs

$ chkconfig nfs on

$ showmount -e
```
__On client machine__
```
$ yum install -y nfs*

$ mkdir -p /mnt/nfs

$ mount ip-of-nfs-server:/public /mnt/nfs

$ ls /mnt/nfs
```
__OLDER VERSION OF NFS REQUIRE RPC, NEW VERSIONS DOES NOT REQUIRE RPC__
