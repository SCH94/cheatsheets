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

address 10.0.0.

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

using DHCP for interface em1

```
DEVICE="em1"
NM_CONTROLLED="yes"
ONBOOT=yes
USERCTL=no
TYPE=Ethernet
BOOTPROTO=dhcp
DEFROUTE=yes
IPV4_FAILURE_FATAL=yes
IPV6INIT=no
NAME="System em1"
UUID=5fb06bd0-0bb0-7ffb-45f1-d6edd65f3e03
HWADDR=08:00:27:16:C3:33
PEERDNS=yes
PEERROUTES=yes
```

using static ip for interface em1

```
DEVICE="em1"
NM_CONTROLLED="yes"
ONBOOT=yes
USERCTL=no
TYPE=Ethernet
BOOTPROTO=none
DEFROUTE=yes
IPV4_FAILURE_FATAL=yes
IPV6INIT=no
NAME="System em1"
UUID=5fb06bd0-0bb0-7ffb-45f1-d6edd65f3e03
HWADDR=08:00:27:16:C3:33
IPADDR=192.168.1.101
NETMASK=255.255.255.0
BROADCAST=192.168.1.255
PEERDNS=yes
PEERROUTES=yes
```

The following configuration parameters are typically used in interface configuration files:

```
BOOTPROTO
How the interface obtains its IP address:

bootp
Bootstrap Protocol (BOOTP).

dhcp
Dynamic Host Configuration Protocol (DHCP).

none
Statically configured IP address.

BROADCAST
IPv4 broadcast address.

DEFROUTE
Whether this interface is the default route.

DEVICE
Name of the physical network interface device (or a PPP logical device).

GATEWAYN
IPv4 gateway address for the interface. As an interface can be associated with several combinations of IP address, network mask prefix length, and gateway address, these are numbered starting from 0.

HWADDR
Media access control (MAC) address of an Ethernet device.

IPADDRN
IPv4 address of the interface.

IPV4_FAILURE_FATAL
Whether the device is disabled if IPv4 configuration fails.

IPV6_DEFAULTGW
IPv6 gateway address for the interface. For example: IPV6_DEFAULTGW=2001:0daa::2%em1.

IPV6_FAILURE_FATAL
Whether the device is disabled if IPv6 configuration fails.

IPV6ADDR
IPv6 address of the interface in CIDR notation, including the network mask prefix length. For example: IPV6ADDR="2001:0db8:1e11:115b::1/32"

IPV6INIT
Whether to enable IPv6 for the interface.

MASTER
Specifies the name of the primary bonded interface, of which this interface is backup.

NAME
Name of the interface as displayed in the Network Connections GUI.

NETWORK
IPV4 address of the network.

NM_CONTROLLED
Whether the network interface device is controlled by the network management daemon, NetworkManager.

ONBOOT
Whether the interface is activated at boot time.

PEERDNS
Whether the /etc/resolv.conf file used for DNS resolution contains information obtained from the DHCP server.

PEERROUTES
Whether the information for the routing table entry that defines the default gateway for the interface is obtained from the DHCP server.

PREFIXN
Length of the IPv4 network mask prefix for the interface.

SLAVE
Specifies that this interface is a backup of a bonded interface.

TYPE
Interface type.

USERCTL
Whether users other than root can control the state of this interface.

UUID
Universally unique identifier for the network interface device.
```

#### About network interface names

* Ethernet interface emN, where N is number starting from 1
* network interfaces pSpP, where S is slot number, P is port number
* virtual interface pSpP_V, S is slot number, P is port number, V is virtual interface number

__check if biosdevname is set to 0 or 1, the network interface names will change based on it value__
