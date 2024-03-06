# Advanced Vim/Neovim Motions


## Practice advanced motions on this document. Just follow instructions


### Change
`c` is a powerful motion.  You use it just like `d` but at the end of the
motion you are ejected from `NORMAL` and into `INSERT`.

So if you wished to delete a word and then type in a new word, `c` is a great
habit to form.

Lets see the difference

// dd this line
// cc this line


### Horizontal Movement
Lets learn about!: `_`, `0`, `$`, `D`, `C`, `S`, `f`, `,`, `;`, `t`, `F`, and `T`

// How would we move around on the line with "contents"
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
