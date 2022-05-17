Release & Renew DHCP lease
---

    ifconfig

    inet addr 10.0.0.16

10.0.0.16 is local ip address on local network

release eth0

    sudo dhclient -r <INTERFACE>

    sudo dhclient -r eth0

after running above command you will no longer have inet address

    ifconfig

however you will have ipv6 address

Renew back the ip address

    sudo dhclient eth0
