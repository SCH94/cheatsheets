# Search, Find, Replace Part - I
---
* searching forward, press f{char}, -> fb, 
* press ; to repeat forward, press , to repeat backwards/opposite direction.
* searching backward, press F{char} -> Fb
* till commands -> if uou want to position cursor one position before given character, press t{char}
    * ti -> cursor position before i
    * Ti
* press /{word} then press n for forward, N for backward
* is / incsearch (increment search)
    * :se is?
    * if output is incsearch that means its enabled
* hls / hlsearch (highlight search)
    * :se hls!
    * :nohls (temp disable hls)
* /and ->  replace word, press n then press . to repeat previous command
* reverse search ?and
* search the next occurance of current word where cursor is, press *
    * asterix meant for entire word
* search previous occurance of current word where cursor is press #
* press d /{word}
