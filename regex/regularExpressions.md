Regular Expressions
---
* referred as regex/regexp
* provides concise and flexible means for matching strings and text

### Quick Guide
```
^ matches the beginning of a line
$ matches the end of the line
. matches any character
\s matches whitespace
\S matches any non-whitespace character
* repeats a character zero or more times
*? repeats a character zero or more times (non greedy)
+ repeats character one or more time
+? repeats character one or more time (non-greedy)
[aeiou] matches single character in the listed set
[^xyz] matches a single character not ib the listed set
[a-z0-9] the set of characters can include a range
( indicated where string character is to start
) indicates where the string character is to end
```
### Regular Expression Module
```
import re # regex module for python

re.search() # to see if string matches a regex, similar to find()

re.findall() # extract portion of string that matches regex, similar to find() and slicing: var[5:10]
```
### using re.search() like find()

| Python Function                   | Regex Function                      |
|-----------------------------------|-------------------------------------|
| hand = open('mbox-short.txt')     | import re                           |
| for line in hand:                 | hand = open('mbox-short.txt')       |
|     line = line.rstrip()          | for line in hand:                   |
|     if line.find('From:') >=0:    |     line = line.rstrip()            |
|         print(line)               |     if re.search('From:', line) :   |
|                                   |         print(line)                 |
| hand = open('mbox-short.txt')     | import re                           |
| for line in hand:                 | hand = open('mbox-short.txt')       |
|     line = line.rstrip()          | for line in hand:                   |
|     if line.startswith('From:'):  |     line = line.rstrip()            |
|         print(line)               |     if re.search('^From:', line) :  |
|                                   |         print(line)                 |

### Wild-card Characters
* The dor character matches any character
* if we add the asterisk character,character is " any number of times"

```
Expression: ^X.*:

^ matches the start of the line
X matches itself
. matches any character
* many times

some character modify the preceding character like *

the above expression says: "look for line that starts with x and then has zero or more characters followed by colon"

example-text:

X-steve: cmo
X-dsp-prag: cro
X-plane is behind schedule: three weeks

when we apply the regular expression on above example text, all three will be returned

X-steve:
X-dsp-prag:
X-Plane is behind schedule: three weeks

However, we dont require the third line(X-Plane), so we will fine tune it.
````
### Fine-Tuning your match
* depending upon how clean your data is and the purpose of your application, you may want to narrow your match down a bit

```
^X-\S+:

^X- says first two characters of the line must be X-
\S means non white space character
+ one or more times

output of this expression will be:
X-steve:
X-dsp-prag:
```
