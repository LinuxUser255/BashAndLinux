# A complete list of **`netrw` keybindings** you can use while browsing files in **Neovim's built-in file explorer**.
## These commands work when you're inside the netrw buffer (file tree view).

---

# 📁 `netrw` Cheat Sheet – Neovim File Explorer

> Use these keys while the **netrw window is open** (e.g., after `:Ex`, `:Explore`, `:Lex`, or `:Sex`).

---

## 🛠 File and Directory Operations

| Key  | Description                                    |
| ---- | ---------------------------------------------- |
| `%`  | **Create a new file** in the current directory |
| `d`  | **Create a new directory**                     |
| `D`  | **Delete** the selected file or directory      |
| `R`  | **Rename** the selected file or directory      |
| `m`  | **Mark** a file for batch operations           |
| `u`  | **Unmark** a marked file                       |
| `U`  | **Unmark all** marked files                    |
| `mt` | Mark a file as **target** for move/copy        |

---

## 📦 File Movement and Copying

| Key  | Description                                          |
| ---- | ---------------------------------------------------- |
| `mc` | **Copy** marked files to the target directory (`mt`) |
| `mm` | **Move** marked files to the target directory        |
| `mf` | Mark all files in the directory                      |
| `mx` | Mark and execute a shell command on the file         |

---

## 📂 Navigation

| Key           | Description                                              |
| ------------- | -------------------------------------------------------- |
| `<CR>` or `o` | **Open** the selected file/directory                     |
| `-`           | Go **up one directory** level                            |
| `P`           | Go to the **previous directory**                         |
| `gh`          | Toggle **hidden files** (dotfiles)                       |
| `~`           | Go to your **home directory**                            |
| `C`           | Change to the **current directory**                      |
| `cd`          | Set Vim's working dir to current netrw dir               |
| `gb`          | Go **back** in directory history                         |
| `gf`          | Go to **file under cursor**                              |
| `gx`          | **Open with system default** (e.g., browser for `.html`) |

---

## 👁️ Viewing and Sorting

| Key | Description                                             |
| --- | ------------------------------------------------------- |
| `i` | Cycle **view style** (thin, long list, wide list, tree) |
| `s` | Cycle **sort style** (name, time, size)                 |
| `r` | **Refresh** directory listing                           |
| `x` | **Execute** the file if it's executable                 |
| `q` | **Close** the netrw window                              |

---

## ⚙️ Miscellaneous

| Key           | Description                                 |
| ------------- | ------------------------------------------- |
| `I`           | Toggle **banner** (header at the top)       |
| `a`           | Toggle between **show all** and normal view |
| `v`           | Open file in **vertical split**             |
| `t`           | Open file in **new tab**                    |
| `p`           | Open file in **preview window**             |
| `o`           | Open file in **horizontal split**           |
| `:help netrw` | Launch the **full help** for netrw          |

---

## 🧠 Tips

* Start netrw with:

  * `:Ex` (file explorer in current window)
  * `:Sex` (split explorer)
  * `:Vex` (vertical split explorer)
* If you want a tree-like view, set:

  ```vim
  let g:netrw_liststyle = 3
  ```
* To hide the banner:

  ```vim
  let g:netrw_banner = 0
  ```

---

Yes! In Neovim (and Vim), you can **run shell commands directly** using the `:!` command.

---

## ✅ To Execute a Shell Script from Neovim

Assuming you're editing a shell script file (like `myscript.sh`):

```vim
:!bash %
```

### 🔍 Breakdown:

* `:!` – Run a shell command
* `bash` – Invokes the Bash shell (can be `sh`, `zsh`, etc.)
* `%` – Represents the **current file name**

---

## 🔁 Common Examples

| Command         | Description                                            |
| --------------- | ------------------------------------------------------ |
| `:!./%`         | Run current script **if it’s executable** (`chmod +x`) |
| `:!sh %`        | Run with `sh`                                          |
| `:!bash %`      | Run with `bash`                                        |
| `:!sudo bash %` | Run script with sudo                                   |
| `:!clear`       | Clear terminal output (useful before/after a run)      |

---

## 🧠 Pro Tip: Map a Key to Run Your Script

You can map a key (like `<F5>`) to run the current shell script:

### Add this to your `init.vim` or `init.lua`:

```vim
" For init.vim (VimScript)
nnoremap <F5> :w<CR>:!bash %<CR>
```

```lua
-- For init.lua (Lua)
vim.keymap.set('n', '<F5>', ':w<CR>:!bash %<CR>')
```

This will:

1. Save the file (`:w`)
2. Execute it using `bash %`

---



