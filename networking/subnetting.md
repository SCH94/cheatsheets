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
|:--|:--|:--|:--|:--|:--|:--|:--|:--|:--|:--|:--|:--|:--|:--|:--|:--|:--|:--|:--|:--|:--|:--|:--|:--|:--|:--|:--|:--|:--|:--|:--|:--|:--|:--
|128|64|32|16|8|4|2|1|.|128|64|32|16|8|4|2|1|.|128|64|32|16|0|0|0|0|.|0|0|0|0|0|0|0|0|
    

therefor subnet mask for

    11111111.11111111.11110000.00000000
    255.255.240.0

the first 8 bits and second 8 bits all are on, third 8 bits 4 buts are on and 4 are off, and last 8 bits all are off.so the third 8 bits will be our focus.

|Network id:|192|168|x|0|
|:--|:--|:--|:--|:--|
|Broadcast id:|192|168|x|255|

converting 60 to binary: 

|128|64|32|16|8|4|2|1|
|:--|:--|:--|:--|:--|:--|:--|:--|

* can i take 60 out of 128, no, so 0
* can i take 64 out of 60, no, so 0
* can i take 32 out of 60, yes, so 1, remainder 28
* can i take 16 out of 28, yes, so 1, remainder 12
* can i take 8 out of 12, yes, so 1, remainder 4
* can i take 4 out of 4, yes, so 1, remainder 0

binary for 60

||0|0|1|1|1|1|0|0|
|:--|:--|:--|:--|:--|:--|:--|:--|:--|
|X|1|1|1|1|0|0|0|0|
|=|0|0|1|1|0|0|0|0|

now we  have to convert 00110000 to decimal:

|128|64|32|16|8|4|2|1|
|:--|:--|:--|:--|:--|:--|:--|:--|
|0|0|1|1|0|0|0|0|

32 + 16 = 48

therefore

|Network id:|192|168|48|0|
|:--|:--|:--|:--|:--|

now we have to figure out x in broadcast id:

|Broadcast id:|192|168|x|255|
|:--|:--|:--|:--|:--|

we can figure out this x by looking at magic number, its the last bit turned on whatever that is, is the increment and how many they go up by so in this cast the 4th one

|1|1|1|1|0|0|0|0|
|:--|:--|:--|:--|:--|
||||this one|||||

