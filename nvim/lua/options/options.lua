-- line numbers
vim.opt.nu = true
vim.opt.relativenumber = true

-- default indenting
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

-- highlight cursor
vim.opt.cursorline = true

-- line wrap
vim.opt.wrap = false

-- automatic backups
vim.opt.swapfile = false
vim.opt.backup = false

-- search
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- colors
vim.opt.termguicolors = true

-- scrolling
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

-- statusline
vim.opt.laststatus = 3

-- cursor
vim.opt.guicursor = ""

-- misc
vim.opt.updatetime = 50
vim.opt.colorcolumn = ""
