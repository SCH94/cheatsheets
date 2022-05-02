# Getting help
    type :help or :h then press enter.

screen gets divided into two portions
upper portion: help window
lower portion: content of original file

to exit out of help

    :q<ENTER>

you can get help for specific command by typing
    :help <COMMAND>
    :help dd<ENTER>

```
NOTE: if you come accross information enclosed in brackets in vim documentation, know that its optional

["x]dd Delete [count] lines [into register x] linewise

brackets are optional, if we strip out brackets then we are left with Delete lines linewise.
```
get help on a given subject
    :help {subject}
    :help count<ENTER>
    :help linewise<ENTER>
    :h linewise<ENTER>

go back to previous section in help
  press ctrl-0
this will bring us to dd page

jump forward press
  ctrl-i
this will bring us back to count page.

another way to get help, you place the cursor on the word like linewise then press
  ctrl-]

if you wwant to keep the help window open, while editing or navigating through your file or vice versa type
  ctrl-w-ctrl-w or HOLD ctrl press w twice

if you want to switch back to help window
  HOLD ctrl press w twice

if you  are not quite sure what the entire command is you can use command line completion
  :h :q then press ctrl-d
vim will list all the commands that starts with :q
or you can press tab key, and it will cycle through all the available options.

  :h :q<TAB>

reverse the options
  :h :q<SHIFT-TAB>

:set wildmenu!
:set nowildmeni
