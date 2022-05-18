Static ip configuration & adapter reset
---

In ubuntu desktop network is managed by

    network-manager

In ubuntu server network is managed by interfaces-files located at

   cat /etc/network/interfaces 

you can see here that I have a static, IP address specified for the network.Now this is very common.    

This is how most servers are going to be set.
They're not going to use D.H.C.P 

if you want to use dhcp for eth0:

```

    vim /etc/network/interfaces

    auto lo
    
    iface lo inet loopback

    auto eth0

    iface eth0 inet dhcp
```

if you want static ip on interface eth0


```
    vim /etc/network/interfaces

    auth lo

    iface lo inet loopback

    auth eth0

    iface eth0 inet static

        address 10.0.0.16

	netmask 255.255.255.0

	gateway 10.0.0.1

    auth enp0s3

    iface enp0s3 inet static

        address 192.168.1.17

	netmask 255.255.255.0

	gateway 192.168.1.1

```

    sudo ifdown eth0

    ifconfig

    sudo ifup eth0

    ping -c 5 google.com

setting interface in oracle linux/RHEL
---

#### Network interface names

```
# cd /etc/sysconfig/network-scripts
# ls ifcfg-*
ifcfg-em1  ifcfg-em2  ifcfg-lo
```

