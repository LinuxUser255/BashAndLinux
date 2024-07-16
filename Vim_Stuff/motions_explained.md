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

<br>

```
Go to Regular mode = esc(remaped to CAPS Lock)
ESC (remaped to CAPS LOCK) to go into Normal mode.

i = insert
v = visual
r = replace
```
<br>

- ## Basic Moving around
```
Moving up down left and right

j = down
k = up
h = left
l =  right
```

<br>

- ### Horizontal line movements faster shortcuts
```
b = back one word at a time
w = forward one word at a time
e = jump forward faster
```
<br>

- ### Vertical movements
```
CTRL + u for up = jumps up half a page
CTRL + d for down = scrolls down half a page
SHIFT + G (cap G) jumps to the very bottom of the page
gg = jump to very top of page
gj = places you at the first line.
```

<br>

- ### Relative line jumping
```
hit the numer of lines to move up, then press j to jump down that number of lines or k to jump up that number of lines.

d + 3 + j = puts in delete mode, instructs 3 to move, j says move down

and to do this up, hit k instead of j
```
<br>

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
<br>

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

- #### Copy-paste using Visual Mode + y / p
```
Highlight this line by pressing shift v
then press y to yank, (copy the text)
then press p to paste the text. It will paste one line below
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

<br>

- ### Example of horizontal editing between curly braces `{ }`
- ### Give this a try. The instructions are im the comments `//` in the pseudo code below

```js
// To jump to the opening parenthesis
// put your cursor on the begining of the line that says `function()`
// then press `f(` to jup to/on the `(`
// `f` plus any character,will jump to the first occurance of that character.
function foo() {
    for (let i = 0; i < 10; i++) {
        console.log("Iteration", i + 1);
        console.log("Iteration", i + 1);
    }
}

foo();
```
<br>

- ### More Vim motions using  the Shift and `{ }` keys
```
SHIFT + } = jumps down between paragraphs and or blocks of code.
SHIFT + { = jumps up between paragraphs
```
<br>

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
<br>

```js
// you can also practice cut and pasting lines
// Copy a line and paste it one line below without using visual mode:
// go into Normalmode, and rest the cursor on any character in the line/sentence.
// And yank/copy the text by pressing
// y + p
function foo() {
    for (let i = 0; i < 10; i++) {
        console.log("Iteration", i + 1);
        console.log("Iteration", i + 1);
    }
}

foo();
```


<br>

- ### Using visual line mode to invert two lines
- ### This is a key remap found in my [nvim config keymaps.lua](https://github.com/LinuxUser255/nvim/blob/main/lua/config/keymaps.lua)
- ### Go into `visual line mode`, and press `shift j` to swap the selected line down, and `shift k` will swap the line up
```lua
-- Move an entite line or lines up or down.
-- when highlighting a line, press shift + j or k
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
```

<br>


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
<br>

- ### Special character selection:
```
{slgjlskfgjlfgj} {123}} [sdlkjfh] <F12><F12><F12> (sadf()) ${UID}+
```
<br>

## This one is really powerful, and a big time-saver too.
## [The norm command: Univerally edit files without editing each line manually](https://www.youtube.com/watch?v=hraHAZ1-RaM&list=PL-p5XmQHB_JSTaEPygu1DZjuFfb704Uv7)

<br>

## More to check out:
- [NeoVim's main site and documentation](https://neovim.io/)
- [Oh My Zsh: Cool stuff for the Zsh shell](https://ohmyz.sh/)
- [Kickstart.nvim: A launch point for your personal nvim configuration](https://github.com/nvim-lua/kickstart.nvim)
- [My NeoVim config](https://github.com/LinuxUser255/nvim)

<br>

### Tired of Vim Tutor?

**Then try [Vim-Be-Good](https://github.com/ThePrimeagen/vim-be-good)**

**A NeoVim plugin to help you master vim motions and improve your speed!**




