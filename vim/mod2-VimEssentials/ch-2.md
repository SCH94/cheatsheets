# Deleting text and 'thinking in vim'
  -> The simplest of the deletion commands is lowercase x at your current cursor position.
  -> capital X deletes the character right before or to the left of your cursor. 
  -> delete a word, D w.
  -> operation{motion} -> dw -> d = delete operation, w= the word motion
  -> dl -> deletes character at right
  -> dj -> deletes current line along with next line
  -> dk -> deletes current line and above line
  -> d0 -> deletes the left line from current position
  -> d$ -> deletes the right line from current position
  -> D -> delete whole line, from current position.
  -> dd -> delete whole line
  -> 3dd-> delete three lines, from current position.

  -> [count]operation{motion} 	-> 5dw
  				-> 5 = the count
				-> dw the command
  -> 3w -> move three words forward
  -> 3b -> move three words backwords
  -> 2d3w -> 2 times delete the 3w motion
  -> . -> repeats previous command -> press dd then press . to repeat
  -> ! -> force the action like q!, toggle vim setting, execute external commands 

