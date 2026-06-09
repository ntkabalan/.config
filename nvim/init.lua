vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("config.options")
require("config.keymaps")
require("config.autocmds")

require("plugins.gitsigns")
require("plugins.harpoon")
require("plugins.tmux-navigation")
require("plugins.conform")
require("plugins.telescope")
require("plugins.treesitter")
require("plugins.mason")
require("plugins.blink-cmp")
require("plugins.lsp")
require("plugins.indent-blankline")
require("plugins.vim-fugitive")
