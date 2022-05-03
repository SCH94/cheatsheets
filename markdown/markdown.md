Italics and Bold:  
  
**Italic(_):** 

```  
  Writing in Markdown is _not_ that hard!
```
> Writing in Markdown is _not_ that hard!
  
**Bold():**

```  
  I **will** complete these lessons!
```
> I **will** complete these lessons!
    
**Emphasized:**  
```  
  I *will* complete these lessons!  
```
> I *will* complete these lessons!  
        
**Strikethrough :**  
```  
  ~~Strikethrough~~  
```  
> ~~Strikethrough~~  
        
**Horizontal rules: ** 

`--- (three hyphens)`  
`*** (three asterisks)`  
`___ (three underscores)`      
      
**Headers:**
  
    #Header one(biggest)
    ##Header two
    ###Header three
    ####Header four
    #####Header five
    ######Header six(smaller)
      
Links:
  
Inline links:
```          
    [Visit GitHub!](www.github.com)
    [You're **really, really** going to want to see this.](www.dailykitten.com)
```
>[Visit GitHub!](www.github.com)
>[You're **really, really** going to want to see this.](www.dailykitten.com)
      
make links within headings:
```
    ####The Latest News from [the BBC](www.bbc.com/news)
```
> ####The Latest News from [the BBC](www.bbc.com/news)
          
reference link:
      
An advantage of the reference link style is that multiple links to the same place 
only need to be updated once.

Reference links don't appear in the rendered Markdown. 

You define them by providing the same tag name wrapped in brackets, 
followed by a colon, followed by the link. 
```      
  "Here's [a link to something else][another place].
   Here's [yet another link][another-link].
   And now back to [the first link][another place].
   [another place]: www.github.com
   [another-link]: www.google.com"
``` 
  "Here's [a link to something else][another place].
   Here's [yet another link][another-link].
   And now back to [the first link][another place].
   [another place]: www.github.com
   [another-link]: www.google.com"
  
Images:
      
inline image link:
```        
![Benjamin Bannekat](https://octodex.github.com/images/bannekat.png)
```
>![Benjamin Bannekat](https://octodex.github.com/images/bannekat.png)
         
reference:
```          
![Black cat][Black]
 ![Orange cat][Orange]
 [Black]: https://upload.wikimedia.org/wikipedia/commons/a/a3/81_INF_DIV_SSI.jpg
 [Orange]: http://icons.iconarchive.com/icons/google/noto-emoji-animals-nature/256/22221-cat-icon.png
```
![Black cat][Black]
 ![Orange cat][Orange]
 [Black]: https://upload.wikimedia.org/wikipedia/commons/a/a3/81_INF_DIV_SSI.jpg
 [Orange]: http://icons.iconarchive.com/icons/google/noto-emoji-animals-nature/256/22221-cat-icon.png
          
Blockquotes(>):
```  
    >"Her eyes had called him and his soul had leaped at the call. 
    To live, to err, to fall, to triumph, to recreate life out of life!"
``` 
>"Her eyes had called him and his soul had leaped at the call. 
 To live, to err, to fall, to triumph, to recreate life out of life!"
        
multiple paragraphs:
```          
>Once upon a time and a very good time it was there was a moocow coming 
 down along the road and this moocow that was coming down along the road met a nicens little boy named baby tuckoo...
>
>His father told him that story: his father looked at him through a glass: he had a hairy face.
>
>He was baby tuckoo. The moocow came down the road where Betty Byrne lived: she sold lemon platt.
```
>Once upon a time and a very good time it was there was a moocow coming 
 down along the road and this moocow that was coming down along the road met a nicens little boy named baby tuckoo...
>
>His father told him that story: his father looked at him through a glass: he had a hairy face.
>
>He was baby tuckoo. The moocow came down the road where Betty Byrne lived: she sold lemon platt.
          
Lists:
      
unordered list:
```
    * Milk
    * Eggs
    * Salmon
    * Butter
```
* Milk
* Eggs
* Salmon
* Butter
      
ordered list:
```  
    1. Crack three eggs over a bowl
    2. Pour a gallon of milk into the bowl
    3. Rub the salmon vigorously with butter
    4. Drop the salmon into the egg-milk bowl
```
1. Crack three eggs over a bowl
2. Pour a gallon of milk into the bowl
3. Rub the salmon vigorously with butter
4. Drop the salmon into the egg-milk bowl
             
sub-lists:
```      
    * Tintin
     * A reporter
     * Has poofy orange hair
     * Friends with the world's most awesome dog
    * Haddock
     * A sea captain
     * Has a fantastic beard
     * Loves whiskey
      * Possibly also scotch?
```
* Tintin
  * A reporter
  * Has poofy orange hair
  * Friends with the world's most awesome dog
* Haddock
  * A sea captain
  * Has a fantastic beard
  * Loves whiskey
    * Possibly also scotch?
                  
Paragraphs:
  
hard break:
    
>Do I contradict myself?

 Very well then I contradict myself,

(I am large, I contain multitudes.)
         
soft break:
Each dot ( · ) represents a spacebar on the keyboard.
two dot- press spacebar 2 times.  
          
>Do I contradict myself?··
 Very well then I contradict myself,··
 (I am large, I contain multitudes.)
           
Code and Syntax Highlighting:  
Inline code:  
```
    ``
      test code
    ``
```     
``
   test code
``

three backticks (```):  
```
    ```
    var foo = 'bar';

    function baz(s) {
    return foo + ':' + s;
    }
    ```
```

```
var foo = 'bar';

function baz(s) {
return foo + ':' + s;
}
```    
Indentation:

header

__header2

____body

where (_) is space 

**Table**
```
|standard|vim|
|----|----|
|cut|delete|
|copy|yank|
|paste|put|
```
|standard|vim|
|----|----|
|cut|delete|
|copy|yank|
|paste|put|


    
