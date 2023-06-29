# What I had to do to install [Tabnine](https://github.com/codota/tabnine-nvim) in NeoVim on my Debian machine

### First let's look at the directory structure of my ` ~/.config/nvim `


```
 linux@debian  VimChad~/.config/nvim  tree
.
├── after
│   └── plugin
│       ├── cloak.lua
│       ├── colors.lua
│       ├── fugitive.lua
│       ├── harpoon.lua
│       ├── lsp.lua
│       ├── refactoring.lua
│       ├── tabnine.lua
│       ├── telescope.lua
│       ├── treesitter.lua
│       ├── trouble.lua
│       ├── undotree.lua
│       └── zenmode.lua
├── init.lua
├── lua
│   └── theprimeagen
│       ├── init.lua
│       ├── packer.lua
│       ├── remap.lua
│       └── set.lua
└── plugin
    └── packer_compiled.lua

```

- in `~/.config/nvim/lua/theprimeagen/packer.lua`

- I placed  `use('codota/tabnine-nvim')`
  in the code block that begain with  `use({"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"})`

- Then I `:w` and `:so % `  (saved and sourced the file)

- Then in  `~/.config/nvim/init.lua`
 I copy pasted the code block from tabnine's README.md on github.


```
require('tabnine').setup({
  disable_auto_comment=true,
  accept_keymap="<Tab>",
  dismiss_keymap = "<C-]>",
  debounce_ms = 800,
  suggestion_color = {gui = "#808080", cterm = 244},
  exclude_filetypes = {"TelescopePrompt"}
})

```

- I also had to create a `tabnine.lua` file and placed it in:
`~/.config/nvim/after/plugin/tabnine.lua`

- Contents of `tabnine.lua`

```
local config = require("tabnine.config")
local auto_commands = require("tabnine.auto_commands")
local user_commands = require("tabnine.user_commands")
local keymaps = require("tabnine.keymaps")

local M = {}

function M.setup(o)
	config.set_config(o)

	keymaps.setup()

	user_commands.setup()

	auto_commands.setup()
end

return M
```

- Activate Tabnine from `~/.config/nvim/init.lua`
Open `init.lua` and execute the command `:TabnineHub`.

- In summarry, the installation process was Not as straightforward as directed on Tabnine's github page.
https://github.com/codota/tabnine-nvim

*Installaing Tabnine on Manjaro was very easy, as it was in the AUR*, so all I had to do was:
`sudo pacman -S tabnine` 

but not so easy on Debian ` ¯\_(ツ)_/¯ `
