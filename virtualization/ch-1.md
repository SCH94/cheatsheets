Install windows VM on ubuntu server
-----------

* sudo useradd vagrant
* sudo passwd vagrant
* sudo su - vagrant
* vim .bashrc
* add path :/bin:/sbin
* source ~/.bashrc

### Installimng cockpit

    $ yum install -y cockpit
    $ yum install -y cockpit-machines
    $ systemctl start cockpit
    $ systemctl enable cockpit
    $ hostname -I
    
Note the ip address and visit:

    https://ip:9090

* login with user
* select virtualmachines
* create virtual machines

### Adding rule in firewalld

    # firewall-cmd --add-service cockpit
    # firewall-cmd --add-service cockpit --perm
    # firewall-cmd --reload
