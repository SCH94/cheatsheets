Register types
-------------

* Unnamed
* Numbered
* Named

## Registers

* Unnamed register = ""
* Numbered registers= "0  "1 ... "9
* "" holds text from d,c,s,x and y operations
* "0 holds last last text yanked(y)
* "1 holds last text deleted(d) or changed(c)
* Numbered registers shift with each d or c.

press yy to yank a line then
    
    :reg<ENTER>

to past the "0 content  
    
    "0-shift-p

* black hole register = "_ 
  * used to delete text without affecting the normal registers

to put content in bblack hole register
    
    "_dd
    :reg<ENTER>

## Named register

Named registers from a to z

yank a line into named register

    "ayy

to append in a register

    "Ayy

to see content on perticular register

    :reg a <ENTER>

## repeating with registers

[count][register]operator

[register][count]operator
