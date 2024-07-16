# Vim motions practice

## How to use:

**The four mark down files here are meant to be opened in Vim, or NeoVim.
Read the prompts/instructions, and try out the vim motions described.
Some of these you may be familiar with, and others may be new. Either way,
these exercises will boost your productivity and workflow while using Vim**

**Easiest way to download:**
`curl -LO` the raw files in a directory you'd like to use them.

<br>

**Motions Explained**
```bash
curl -LO https://raw.githubusercontent.com/LinuxUser255/BashAndLinux/main/Vim_Stuff/motions_explained.md
```
<br>


- **Vim motions 1**
```bash
curl -LO https://raw.githubusercontent.com/LinuxUser255/BashAndLinux/main/Vim_Stuff/vim-motions-01.md

```
<br>

- **Vim motions 2**
```bash
curl -LO https://raw.githubusercontent.com/LinuxUser255/BashAndLinux/main/Vim_Stuff/vim-motions-02.md
```
<br>

- **Vim motions 3**
```bash
curl -LO https://raw.githubusercontent.com/LinuxUser255/BashAndLinux/main/Vim_Stuff/vim-motions-02.md
```
<br>

- **AdvancedMotions**
```bash
curl -LO https://raw.githubusercontent.com/LinuxUser255/BashAndLinux/main/Vim_Stuff/AdvancedMotions.md
```
<br>

## Extra fun way to practice Vim motions:

## [VimBeGood plugin for NeoVim](https://github.com/ThePrimeagen/vim-be-good)
**Only woks in neovim**
**It's like a video game on the command line**
All you gotta do is create a file in your plugins directory named `vim-be-good.lua`
And put this lua code in it, this is the plugin install format for the
lazy plugin manager:
```lua
return {
    "theprimeagen/vim-be-good",

    dependencies = {
        "nvim-lua/plenary.nvim"
    },

    config = function()
    end
}
```
**Link to the vim-be-good repo**
https://github.com/ThePrimeagen/vim-be-good

## Enjoy!
