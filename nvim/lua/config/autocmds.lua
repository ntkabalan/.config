-- briefly highlight yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
	group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
	callback = function()
		vim.hl.on_yank()
	end,
})

-- netrw shortcuts
vim.api.nvim_create_autocmd("FileType", {
	pattern = "netrw",
	callback = function()
		-- create a new file with a
		vim.keymap.set("n", "a", "%", { remap = true, buffer = true })

		-- rename a file with r
		vim.keymap.set("n", "r", "R", { remap = true, buffer = true })

		-- move into a directory with control-alt-l
		vim.keymap.set("n", "<C-A-l>", "<CR>", { remap = true, buffer = true })

		-- move up a directory with control-alt-h
		vim.keymap.set("n", "<C-A-h>", "-", { remap = true, buffer = true })
	end,
})
