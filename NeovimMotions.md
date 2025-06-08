
# 🧠 **Vim Motions & Editing Cheat Sheet**

_Complete from Beginner to Advanced — With Python-friendly usage_

---

## 🔰 **Basics – Cursor Movement**

|Command|Action|
|---|---|
|`h`|Left|
|`l`|Right|
|`j`|Down|
|`k`|Up|
|`0`|Beginning of line|
|`^`|First non-blank character of line|
|`$`|End of line|
|`w`|Next word|
|`W`|Next WORD (ignores punctuation)|
|`b`|Back to beginning of word|
|`B`|Back to beginning of WORD|
|`e`|End of word|
|`E`|End of WORD|
|`gg`|Top of file|
|`G`|Bottom of file|
|`:n`|Go to line `n`|
|`H`, `M`, `L`|Top, Middle, Bottom of screen|

---

## ✂️ **Editing Text**

|Command|Action|
|---|---|
|`i`|Insert before cursor|
|`I`|Insert at beginning of line|
|`a`|Append after cursor|
|`A`|Append at end of line|
|`o`|Open new line below|
|`O`|Open new line above|
|`x`|Delete character under cursor|
|`X`|Delete character before cursor|
|`r<char>`|Replace character|
|`R`|Replace mode (overwrite)|

---

## ✏️ **Delete / Change / Copy (Yank)**

|Command|Action|
|---|---|
|`d{motion}`|Delete by motion (e.g. `dw`, `d$`, `d0`)|
|`dd`|Delete line|
|`D`|Delete to end of line|
|`c{motion}`|Change by motion (delete + insert)|
|`cc`|Change whole line|
|`C`|Change to end of line|
|`y{motion}`|Yank by motion|
|`yy`|Yank whole line|
|`p`|Paste after cursor|
|`P`|Paste before cursor|

---

## 🔁 **Undo / Redo**

|Command|Action|
|---|---|
|`u`|Undo|
|`U`|Undo entire line|
|`Ctrl-r`|Redo|

---

## 📋 **Visual Mode (Text Selection)**

|Command|Action|
|---|---|
|`v`|Visual mode (character-wise)|
|`V`|Visual line mode|
|`Ctrl-v`|Visual block mode|
|`gv`|Re-select last selection|
|`>` / `<`|Indent / Unindent selection|
|`y`, `d`, `c`|Yank / Delete / Change selection|

---

## 🔍 **Search & Navigation**

|Command|Action|
|---|---|
|`/word`|Search forward for "word"|
|`?word`|Search backward|
|`n`|Repeat search (same direction)|
|`N`|Repeat search (opposite direction)|
|`*` / `#`|Search word under cursor forward/backward|
|`%`|Jump to matching `()`, `{}`, or `[]`|

---

## 📄 **Working with Files & Buffers**

|Command|Action|
|---|---|
|`:w`|Save|
|`:q`|Quit|
|`:wq` or `ZZ`|Save and quit|
|`:q!`|Quit without saving|
|`:e filename.py`|Open file|
|`:split` / `:vsplit`|Split window (horizontal/vertical)|
|`Ctrl-w w`|Cycle windows|
|`:bn` / `:bp`|Next/Previous buffer|
|`:bd`|Close buffer|

---

## ⚙️ **Indentation (Python-Friendly)**

|Command|Action|
|---|---|
|`>>` / `<<`|Indent / Unindent line|
|`=`|Auto-indent with motion (`=G`, `=}`)|
|`gg=G`|Auto-indent the whole file|
|`vip`|Select Python function body|
|`=ip`|Auto-indent Python function body|

---

## 🔄 **Macros & Repeating**

|Command|Action|
|---|---|
|`q{a-z}`|Start recording macro in register `a`–`z`|
|`q`|Stop recording|
|`@a`|Run macro in register `a`|
|`@@`|Repeat last macro|

---

## 🔗 **Advanced Motions**

|Command|Action|
|---|---|
|`f<char>` / `F<char>`|Find next/prev char on line|
|`t<char>` / `T<char>`|Until next/prev char|
|`;` / `,`|Repeat last `f`, `F`, `t`, `T`|
|`/{pattern}`|Search with regex|
|`:g/pattern/d`|Delete all lines matching pattern|
|`:v/pattern/d`|Delete lines that do **not** match|

---

## 🔌 **Useful Plugins for Vim Motion Mastery**

- 🌀 **vim-sneak**: Better motion across lines with `s<char><char>`
    
- 🧩 **vim-surround**: Add/change/delete surrounding characters like `()` or `""`
    
- 🛠 **vim-commentary** or **NERDCommenter**: Comment/uncomment blocks easily
    
- 🪄 **targets.vim**: Smarter text objects (like around/matching quotes/brackets)
    
- 🔎 **fzf.vim** or **telescope.nvim**: Fuzzy finding + file navigation
    

---

## 🐍 Python-Specific Tips

|Command|Action|
|---|---|
|`vip`|Visual Inner Paragraph — great for function bodies|
|`ci"` / `ci'` / `ci(`|Change inside quotes/parentheses|
|`:!black %`|Format the current file with Black|
|`:%s/\s\+$//e`|Remove trailing whitespace (Python style!)|

