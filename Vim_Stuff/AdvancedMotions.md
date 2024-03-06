# Advanced Vim/Neovim Motions


## Practice advanced motions on this document. Just follow instructions
### How to use this md file:
**!! _Copy the raw markdown version of this doc, opent it in Vim, and use it for practice_ !!**


### Change
`c` is a powerful motion.  You use it just like `d` but at the end of the
motion you are ejected from `NORMAL` and into `INSERT`.

So if you wished to delete a word and then type in a new word, `c` is a great
habit to form.

Lets see the difference

// dd this line
// cc this line


### Horizontal Movement
learn about: `_`, `0`, `$`, `D`, `C`, `S`, `f`, `,`, `;`, `t`, `F`, and `T`

- `_`, Under Score: go to begining of the line, and goes to first non-whitespace char lands you in normal mode
- `0` Zero goes all the way to beginning of the line:
- `^` Carret does this too
- `$`, Dollar jumps to EOL:
- `D`, deletes everything past the cursor to the left. like using backspace in insert mode also, if you had something like:
  `foobar fooBar fooBar`, by placing the cursor at on the first letter of the second word, then you delete all following chars

### Try it out:
`foobar foobar fooBar fooBar fooBar fooBar`

- `C`, deletes one past the cursor to the left. but lands in insert mode

`foobar foobar fooBar fooBar fooBar fooBar`

- `S`, deletes the whole line, respects indenting, and go into insert mode.

- `s`, deletes single char, then goes into insert mode

- `f`, jumps to first occurance of specified letter
      example: Jump to the capital B in fooBar. the 2nd word below, in the middle, the middle second one
      in norm: fB, this jumps to the first occurance of capital B on that line
      foobar foobar foobar
And, using semicolin
- `;`, will jump to the next capital B
- `,`, comma to jump backwards
- `t`, jumps to the char, but not on or past
- `F`, does wat lower t does but moves in in revese
    foobar foobar foobar

- `T` so placing the cursou on the b in the last occurance of fooBar,
them type FB, will jump to the immediate previous occourance of capital B
so, that's the cap B in the second word, then, ; and , does the same jump between, but in reverse

### !!!!! ---- Super cool & useful ------ !!!!!
To delete the foobar of an if statement,one way you can do is just `dt)`. 
jumped up until the closing parentheses and closed everything
```js
// place cursor on t , then press dt shift 9 - thats closing parenth
// also can do the same but use ct, lands you in insert mode
if (true, true) {
    foobar fooBar fooBar
}
```
```js
// do it again dt)
if (true, true) {
    foobar fooBar fooBar
}
```

### More like above:
```js
// can be used on multiple params&args and commas
// delete the middle occourance of true: df space
if (true, true, true) {
    foobar fooBar fooBar
}
```


// can be used on multiple params&args and commas
// delete the middle occourance of true: df space
if (true, true, true) {
    foobar fooBar fooBar
}


// How would you move around on the line with "foobar"
if (true) {
    foobar fooBar fooBar
}




// How would you move around on the line with "contents"
if (true) {
    contents conTenTs contenTS
}


### Vertical Movement
#### Core movement
Rely on relative jumps.  Get good at them.

If you get NeoVim, try VimBeGood
<https://github.com/ThePrimeagen/vim-be-good>

#### { and }
We know about search.  That is a vertical movement, but its really specific.

Let's look at  `{` and `}`
 `{` and `}` used to jump to from top and bottom of blocks of code
 
Place `{` on the first line, and press closing curlly brace `}`, and now your at the end of the code block

ContiguousCode
ContiguousCode
    ContiguousCode
    ContiguousCode
        ContiguousCode
    ContiguousCode
ContiguousCode

ContiguousCode
ContiguousCode
    ContiguousCode
    ContiguousCode
        ContiguousCode
    ContiguousCode
ContiguousCode


#### Ctrl+u/d
So lets do another type of navigation.
(more notes/exercised below)

Try pressing `<C-d>`
(that's Ctrl + d) (it will scroll down half page at a time)
.

.
.

.

.

.

.

.

.

.

.

.

.

.

.

.

.

.

.

.
.



#### [m / ]m and [M / ]M
This will move by "function".  It works pretty well in c languages.

Move your cusor to this line and press `]m`.  Try moving back and forth and try
the uppercase version as well.

if (foo) {
    some content
    some content
    some content
    some content
    function bar() {
        some other content
        some other content
        some other content
        some other content
    }
    function baz() {
        other content
        other content
        other content
        other content
    }
}

##### Benefits?

#### %
Ok,.... soo this isn't a pure vertical motion.  It actually is a pair jumper

if (true) {
    content
    const a = [
        content,
        content,
        content,
    ]

    "content"

    content
    content
}

Lets combine it with a motion.  Delete the `const a =...` statement.

### Get zany...
Lets look at the following statement, what are some ways you can delete the
contents of the if statement?

if (true) {
    line1
    line2
    line3
    line4
    line5
}

One possibiliy is: `f{V%D`.  That is very neat. `d4j` is ok.
Relative jump.


So lets try again..

if (true) {
    line1
    // Some distance
    line2
    line3

    line4
    line5
}

First, place your cursor _in_ the if statement.  Where ever you want.  Type `di{`

i = inside


.
.
use `<C-d>` to go down...
.
.
.
.
.
.
.
.
.
.
.
.
.
.
.
.
.

// TODO: asdf
so lets try again. try `da{`

if (true) {
    line1
    // Some distance
    line2
    line3

    line4
    line5
}


#### Try it again

if (true) {
    line1
    // Some distance
    line2
    line3

    line4
    line5
}

.
.
.
.
.
.
.
.
.
.

the answer. `va{Vd`

#### Use advanced moves
redo the previous exercise except copy from one if statement and override
the next if statement.  How would you go about doing this?

if (true) {
    line1
    // Some distance
    line2
    line3

    line4
    line5
}

if (true) {
    replace_me_1
    // Some distance
    replace_me_2
    replace_me_3

    replace_me_4
    replace_me_5
}
