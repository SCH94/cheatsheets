Inserting Changing Replacing Joining
---

Insert mode:

*   insert mode press i
*   cursor jump to first character in line and goes in insert mode, press SHIFT-i
*   Append text after thecurrent cursor position, press a
*   Appennd to the end of line, press SHIFT-a
*   New line below cursor and place you in insert mode press o
*   New line above the cursor and place in insert mode, press SHIFT-o
*   create a line of asterisks:
 *   press 80i, type *
 *   this will create a 80 asterisks
*   create 5 lines that begins with '#'
 *   press 5o, type #
 *   this might be a quick way to create a comment section
*   create 4 lines that begins with "10.11.12."
 *   press 4o, type 10.11.12.

Replace mode:

*   replace mode press SHIFT-r
*   what ever we will type, will replace the existing text
*   replace only one character, press r
 *   you will only be able to replace one character, after replace it will automaticaly moves to normal mode

Change command:

*   press cw, then type your content
*   change and save it to a named register
 *   press "acw
 *   this will store the deleted word into "a register
 *   press :reg a <enter>
*   replace all the text on the line starting at the word car, so to do this just position the cursor at car 
 *   press c$ or SHIFT-c
* press cc, to change the entire line

