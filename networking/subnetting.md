subnetting from CIDR notations
------------------------------

192.168.60.55/20

* network id: ?
* broadcast id: ?
* usable ips: ?
* subnet mask: ?

understand what does /20 means, that represents how many bits are turned on within my subnet.

first create a simple chart:

|128|64|32|16|8|4|2|1|
|:--|:--|:--|:--|:--|:--|:--|:--|

when 20 bits tunred on:

11111111.11111111.11110000.0000

all the 1 turned on(11111111) is equivalent to turning on and adding from 128,64,32...1 which is 255

|1|1|1|1|1|1|1|1|.|1|1|1|1|1|1|1|1|.|1|1|1|1|0|0|0|0|.|0|0|0|0|0|0|0|0|
||||
|128|64|32|16|8|4|2|1|128|64|32|16|8|4|2|1|128|64|32|16|0|0|0|0|0|0|0|0|0|0|0|0|
    

therefor subnet mask for

    11111111.11111111.11110000.00000000
    255.255.240.0


