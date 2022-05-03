Cut Copy Paste
--------------

* move text around a file.
* duplicate text
* make an in-file backup.
* reuse the same text.

```
d and x cut text, not just delete it.

cut=delete and save into a register

Register is a clipboard-like storage location
```

cut line

    dd

dd place the cut text into vim unnamed/default register.  

put line after your cursor

    p

the text is placed on the line below, where your cursor is.

put line before the cursor

    P

the text is placed on the line above, where your cursor is

cut the character

    x 

put the character

    p or P

cut the line from position of cursor towards right

    d$

put the line before the position of cursor

    P


