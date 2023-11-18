-- lazy.nvim setup
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- set space bar as leader key and termguicolors as true
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.opt.termguicolors = true

-- lazy plugins
require("lazy").setup("plugins")

-- theme 
require("theme")

-- vim options
require("options.options")

-- keybindings
require("remap.remap")
