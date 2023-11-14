# NeoVim and Vim Motions

<br>

## - Using NVChad: The documentation:
[Using NVchad - Link ](https://docs.rockylinux.org/books/nvchad/nvchad_ui/using_nvchad/)

<br>

## - NeoVim tutorials
[Video demos from ThePrimeagen's Vim as your editor playlist](https://youtube.com/playlist?list=PLm323Lc7iSW_wuxqmKx_xxNtJC_hJbQ7R)

[Video demos from from Luke Smith's Vim playlist](https://youtube.com/playlist?list=PL-p5XmQHB_JSTaEPygu1DZjuFfb704Uv7)

<br>

## How to Remap your Esc and Caps Lock
- This is very worthwhile, and is common for many Vim users. 
- This makes changing between visual, insert and normal mode much easier, faster and effiecent.
- Insted of reaching to the upper left of your key board to hit escape, now all you need to do is tap the caps lock key with - your left pinky to set the mode you want. Thus, keeping your hands on the home row.

- I learned this watching one of Luke Smith's totorials. A way to quickly  remap them is  to run the following bash script.
https://github.com/LukeSmithxyz/voidrice/blob/master/.local/bin/remaps

**How to Remap you Esc and Caps Lock:**
<br>
**Place this Bash script in `/usr/bin` and name it remap.**

```
#!/bin/bash

# This script is called on startup to remap keys.
# Decrease key repeat delay to 300ms and increase key repeat rate to 50/sec
xset r rate 300 80

# https://youtu.be/oSSkJ4yq4UA
# I want to map the caps lock to the escape key
setxkbmap -option "caps:escape" 

# When caps lock is pressed only once, treat it as escape.
#killall xcape 2>/dev/null ; xcape -e 'Caps_Lock=Escape'

# Turn off caps lock if on since there is no longer a key for it.
xset -q | grep "Caps Lock:\s*on" && xdotool key Caps_Lock

```


## - Vim/NeoVim motions, how-to + tips and tricks.
[Video demo of some vim motions from ThePrimeagen's vim-be-good](https://youtu.be/0ZU9A9J1H08?si=EzWNUA352SiddzEk)
### Changing modes
```
Go to Regular mode = esc(remaped to CAPS Lock)
ESC (remaped to CAPS LOCK) to go into Normal mode.

i = insert
v = visual
r = replace
```

## - Basic Moving around
```
Moving up down left and right

j = down
k = up
h = left
l =  right
```

### - Horizontal line movements faster shortcuts
```
b = back one word at a time
w = forward one word at a time
e = jump forward faster
```

### - Vertical movements
```
CTRL + u for up = jumps up half a page
CTRL + d for down = scrolls down half a page
SHIFT + G (cap G) jumps to the very bottom of the page
gg = jump to very top of page
gj = places you at the first line.
```

### - Relative line jumping
```
hit the numer of lines to move up, then press j to jump down that number of lines or k to jump up that number of lines.

d + 3 + j = puts in delete mode, instructs 3 to move, j says move down

and to do this up, hit k instead of j
```

### - Combining motions and editing
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

## - Practice:
**Copy-Paste the text below into a neovim, or vim document, and practice yank, paste, visual mode and more**

#### Yank and paste.  yy to yank line, p to paste line below, P above

```
yank this line paste below (yyp)
```

#### - Visual Mode
```
Highlight part of this line by pressing v, then navigate around
escape to leave visual mode
```

#### - Visual Line Mode
```
Highlight this line by pressing V, then navigate around
escape to leave visual mode
```

#### - Visual Mode + y / p
```
Highlight this line by pressing V, then press y
press p
```

```
Highlight this point by pressing v, press wy 
press p 
```

### - Undo changes you have made:
```
enter normal mode and tap the u key, untill you get where you want.
```

### - Jumping around while editing
```
SHIFT + I jump to begining of line in insert mode.
SHIFT + A jump to end of line in insert mode.

$ = jumps to end of line but before last char in in normal mode
A = jumps to very end of line into insert mode
0 = Jumps to begining of the line
_ = jumps to beging of line

```

### - Example of editing between curly braces { }
```
func main() {
	line1
	line2
	line3
}


Copy a line and paste it one line below without using visual mode:
go into Normalmode, and rest the cursor on any character in the line/sentence.
And yank/copy the text by pressing
yy + p
```

### - More Vim motions using  the Shift and { } keys
```
SHIFT + } = jumps down between paragraphs and or blocks of code.
SHIFT + { = jumps up between paragraphs

jump to a matching character:
put the cursor on the specific char, and press %
```

### - Formating text
```
Using g and q
If you are unable to scroll, or move up and down one line at a time, hit gq

If you need to format some text, or a paragraph and make it more reader friendly,
just highlight the text, then press gq

Example:
have your cursor on the first line, press Ctrl + v to enter visual line mode,
then hit the j key to select the paragraph, the hit g + q
```

### - Special character selection:
```
{slgjlskfgjlfgj} {123}} [sdlkjfh] <F12><F12><F12> (sadf()) ${UID}+
```

## [The norm command: Univerally edit files without editing each line manually](https://www.youtube.com/watch?v=hraHAZ1-RaM&list=PL-p5XmQHB_JSTaEPygu1DZjuFfb704Uv7)


## - More to check out:
- NeoVim's main site and documentation: https://neovim.io/
- NvChad. An incredible plugin and them setter: https://nvchad.com/
- Oh My Zsh: Cool stuff for the Zsh shell: https://ohmyz.sh/

```
Tired of Vim Tutor?
Then try Vim Be Good
```
- https://github.com/ThePrimeagen/vim-be-good



