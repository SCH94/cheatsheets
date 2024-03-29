Install oracle linux server using LVM
-------------------------------

    +--------+     +--------+    +-------+    +-------+
    |        | --> | volume |--> |       |--> |       |
    |physical|     |        |    |logical|    | file  |
    | volume |     |  group |    |volume |    | system|
    |        |     |        |    |       |    |       |
    +---+----+     +--------+    +-------+    +-------+
                       :       
                       |         +-------+    +-------+
                       +-------> |       |--> |       |
		                 |logical|    | file  |
				 |volume |    | system|
				 |       |    |       |
				 +-------+    +-------+

* select partition disk > then select manual > select harddisk partition
  select yes for new partition table.

* select configure the logic volume > select yes > create volume group  

* display configuration details

* create logical volume > select volume group > logical volume name >  set size   * create logical vome for root
  * create logical volume for home and so on

* display configuration details

* select the partition > press enter > select ext4 > mount point /
* select partition > press enter > select swap area

## comands to get info on LVM

list block devices

    lsblk

display info about physical volume

    sudo pvdisplay

display info about volume group

    sudo vgdisplay

display info about logical volume

    sudo lvdisplay

filesystem information

    cat /etc/fstab

## expanding filesystem

add a new new disk to virtualbox

now list block devices

    lsblk

you will see new attached device sdb

now turn the attavhed device to physical volume

    sudo pvcreate /dev/sdb

the above command will wipe the device then creates a pv

    sudo pvdisplay

currently /dev/sdb is not part of volume group so

    vgextend {vg_name} /dev/sdb

    vgdisplay

see free PE, thats the amount of space we can use/use to extend size of lv

extending lv by 5GB

    lvextend -L +5G {you filesystem}  # use df -h to see your filesystem 
    lvextend -L +5G /dev/mapper/vg_lvm-root

resize the filesystem so it can use the space just alloted to it

    resize2fs /dev/mapper/vg_lvm-root

## setting up LVM manually

Grow the logical volume with ALL of the available space, without specifying a particular size

    lvextend --resizefs -l +100%FREE /dev/mapper/vg_lvm-root

    pvcreate /dev/sdc

    vgcreate vg_extra /dev/sdc

    vgdisplay
    
    lvcreate vg_extra -L 5G -n lv_logs

    lvdisplay

    mkfs.ext4 /dev/mapper/vg_extra-lv_logs
    
    mkdir /mnt/extra/logs

    mount /dev/mapper/vg_extra-lv_logs /mnt/extra/logs

finding block id

    blkid /dev/mapper/vg_extra-lv_logs

    cp /etc/fstab /etc/fstab.bak

    nano /etc/fstab

Add a line to the fstab to mount the volume, similar to this

    UUID=<BLOCK ID FOR LOGICAL VOLUME> /mnt/extra/logs ext4 defaults 0 2

    umount /mnt/extra/logs

test your fstab

    mount -a

Snapshots
---

```
lvcreate -L 5G -n snaps vg_extra

mkfs.ext4 /dev/mapper/vg_extra-snaps

mkdir -p /mnt/snaps

vim /etc/fstab

/dev/mapper/vg_extra-snaps /mnt/snaps ext4 defaults 0 2

mount -a

cd /mnt/extra/logs

touch file{1..10}.log 
```
__ Creating a snapshot __
```
syntax:

lvcreate /dev/mapper/<SOURCE VOLUMEGROUP NAME> -L 1G -s -n snapshot_name

-s: snapshot

-n: name

```
```
lvcreate /dev/mapper/vg_extra-logs -L 1G -s -n logs_snapshot

```

to see snapshots:

```
lvs
```

snapshots will have origin which we can see using lvs

Now suppose we have accidently deleted the log files, however we have snapshot of logs

__ Mounting snapshot __

```
mkdir /mnt/snaps

mount /dev/mapper/vg_extra-<snapshoy-name> /mnt/snaps

df -h

```

__ Restoring data from snapshot __

unmount the partition you want to recover

```
umount /mnt/extra/logs
```

Restore snapshot

```
lvconvert --merge /dev/mapper/snapshot_name
```

deactivate to fresh it

```
lvchange -an /dev/mapper/vg_extra-lv_web
```

activate:

```
lvchange -ay /dev/mapper/vg_extra-lv_web
```

