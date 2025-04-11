

---

# 📂 **Netrw Cheat Sheet for Neovim**

> ✅ Launch with: `:Ex` or `:Explore` (opens in the current window)  
> 🪟 Use `:Sex` for a horizontal split, or `:Vex` for a vertical split  
> 📁 Navigates from the current buffer's path by default

---

## 🔄 **Opening and Navigating**

| Command | Action |
|--------|--------|
| `:Ex`, `:Explore` | Open Netrw in current window |
| `:Sex`, `:Vex` | Open in horizontal or vertical split |
| `<CR>` | Open file or enter directory |
| `-` | Go up to parent directory |
| `~` | Go to home directory |
| `u` | Go up to previous directory (like undo dir change) |
| `U` | Go forward (redo directory change) |
| `gh` | Toggle hidden files |
| `C` | Change root to current directory |
| `o` | Open file in new horizontal split |
| `v` | Open file in new vertical split |
| `t` | Open file in new tab |
| `P` | Preview file without closing Netrw |

---

## 📄 **File and Directory Operations**

| Command | Action |
|--------|--------|
| `%` | Create a new file |
| `d` | Create a new directory |
| `D` | Delete selected file or directory |
| `R` | Rename file or directory |
| `m` | Mark/unmark file (for batch operations) |
| `mf` | Mark a file |
| `mu` | Unmark a file |
| `mc` | Copy marked files |
| `mm` | Move marked files |
| `md` | Delete marked files |
| `:!<cmd>` | Run shell command from inside Netrw |

---

## ⚙️ **Sorting & Display**

| Command | Action |
|--------|--------|
| `i` | Cycle between thin, long, wide listing modes |
| `s` | Sort files (name, time, size) |
| `r` | Reverse sorting order |
| `qf` | Quick open with `gf` (go to file under cursor) |
| `gx` | Open file/URL with system opener (`xdg-open`, `open`, etc.) |

---

## 🧩 **Tips & Customization**

**To set Netrw as your default file explorer (if not already):**
```vim
let g:loaded_netrwPlugin = 1
```

**Customize Netrw behavior:**
```vim
" Open Netrw to the directory of the current file
autocmd VimEnter * if argc() == 0 | :Explore | endif

" Hide banner
let g:netrw_banner = 0

" Open splits below and to the right
let g:netrw_browse_split = 4

" Enable tree-style listing
let g:netrw_liststyle = 3

" Set window size for Netrw
let g:netrw_winsize = 25
```

---

## 🐍 **Python Project Tip**
Use `:Ex` from within a Python file to quickly jump to other modules or scripts in the same project directory. Combine with `vip` and macros for fast edits.

---
