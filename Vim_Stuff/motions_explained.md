# NeoVim and Vim Motions

<br>

- ## NeoVim tutorials
[Video demos from ThePrimeagen's Vim as your editor playlist](https://youtube.com/playlist?list=PLm323Lc7iSW_wuxqmKx_xxNtJC_hJbQ7R)

[Video demos from from Luke Smith's Vim playlist](https://youtube.com/playlist?list=PL-p5XmQHB_JSTaEPygu1DZjuFfb704Uv7)

<br>

## Vim/NeoVim motions, how-to + tips and tricks.
[Video demo of some vim motions from ThePrimeagen's vim-be-good](https://youtu.be/0ZU9A9J1H08?si=EzWNUA352SiddzEk)

## To use this file, copy the raw text into a mark down file, and follow the instructions and prompts
- ### Changing modes
```
Go to Regular mode = esc(remaped to CAPS Lock)
ESC (remaped to CAPS LOCK) to go into Normal mode.

i = insert
v = visual
r = replace
```

- ## Basic Moving around
```
Moving up down left and right

j = down
k = up
h = left
l =  right
```

- ### Horizontal line movements faster shortcuts
```
b = back one word at a time
w = forward one word at a time
e = jump forward faster
```

- ### Vertical movements
```
CTRL + u for up = jumps up half a page
CTRL + d for down = scrolls down half a page
SHIFT + G (cap G) jumps to the very bottom of the page
gg = jump to very top of page
gj = places you at the first line.
```

- ### Relative line jumping
```
hit the numer of lines to move up, then press j to jump down that number of lines or k to jump up that number of lines.

d + 3 + j = puts in delete mode, instructs 3 to move, j says move down

and to do this up, hit k instead of j
```

- ### Combining motions and editing
```
x = deletes what ever character on which the cursor is sitting.
d = delete a word and tapping d twice deletes an entire line
u = to undo what ever u just did

Also,
To delete characters inside a set of parentheses,  (), place the cursor on a character inside the ( ) then press ct closing parenthese: 
ct )

that deletes everything inside the parenthese, and puts you in insert mode.

SHIFT + f deletes the rest of the line and puts you in insert mode.
d = delete a word and tapping d multiple times detetes whole words and lines.
SHIFT + v to higlight the whole first line, then move down or jump to the end of the paragraph. 

Hitting c will cut the text, and to paste it somewhere else
go into normal mode, scrll to where you want to paste it, and while in normal mode, tap p.
yy will yank, (copy the highlighted text, and x deletes it)

To delete everything between curly braces, { }, setting within a block of code, just go to the top line, place your cursor on the opening curly brace, {,  then hit di{    ( that's di curly brace).
then p to paste it some where else if you want.

To gradualy highlight words, hit go into vis mode, then tap w to highlight words to the right, and b to go back
```

- ## Practice:
**Copy-Paste the text below into a neovim, or vim document, and practice yank, paste, visual mode and more**

#### Yank and paste.  yy to yank line, p to paste line below, P above

```
yank this line paste below by pressing yp , or yyp
```

- #### Visual Line Mode
```
Highlight this line by pressing V, then navigate around
escape to leave visual mode
```

- #### Visual Mode + y / p
```
Highlight this line by pressing V, then press y
press p
```

```
Highlight this point by pressing v, press wy 
press p 
```

- ### Undo changes you have made:
```
enter normal mode and tap the u key, untill you get where you want.
```

- ### Jumping around while editing
```
SHIFT + I jump to begining of line in insert mode.
SHIFT + A jump to end of line in insert mode.

$ = jumps to end of line but before last char in in normal mode
A = jumps to very end of line into insert mode
0 = Jumps to begining of the line
_ = jumps to beging of line

```

- ### Example of editing between curly braces { }

```js
// Copy a line and paste it one line below without using visual mode:
// go into Normalmode, and rest the cursor on any character in the line/sentence.
// And yank/copy the text by pressing
// y + p
function foo() {
    for (let i = 0; i < 10; i++) {
        console.log("Iteration", i + 1);
    }
}

foo();
```

- ### More Vim motions using  the Shift and { } keys
```
SHIFT + } = jumps down between paragraphs and or blocks of code.
SHIFT + { = jumps up between paragraphs
```
```js
// jump to a matching character:
// put the cursor on the specific char, and press %
function foo() {
    for (let i = 0; i < 10; i++) {
        console.log("Iteration", i + 1);
        console.log("Iteration", i + 1);
    }
}

foo();
```

- ### Formating text
  
```
Using g and q
If you are unable to scroll, or move up and down one line at a time, hit **gq**

If you need to format some text, or a paragraph and make it more reader friendly,
just highlight the text, then press gq

Example:
Press Ctrl + v to enter visual line mode, then hit **gq**

Format this extra long line of Lorem ipsum text into a paragraph by following the instructions above.
```
```
"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
```

- ### Special character selection:
```
{slgjlskfgjlfgj} {123}} [sdlkjfh] <F12><F12><F12> (sadf()) ${UID}+
```

## [The norm command: Univerally edit files without editing each line manually](https://www.youtube.com/watch?v=hraHAZ1-RaM&list=PL-p5XmQHB_JSTaEPygu1DZjuFfb704Uv7)


## More to check out:
- [NeoVim's main site and documentation](https://neovim.io/)
- [Oh My Zsh: Cool stuff for the Zsh shell](https://ohmyz.sh/)
- [Kickstart.nvim: A launch point for your personal nvim configuration](https://github.com/nvim-lua/kickstart.nvim)

<br>

Tired of Vim Tutor?
**Then try [Vim-Be-Good](https://github.com/ThePrimeagen/vim-be-good)**
A NeoVim plugin to help you master vim motions and improve your speed!




