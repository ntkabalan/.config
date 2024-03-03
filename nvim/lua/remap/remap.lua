-- return to project view
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- move selection up or down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- keep cursor centered while jumping half-pages
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- keep cursor centered while jumping between search results
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- paste over text without losing buffer
vim.keymap.set("x", "<leader>p", '"_dP')

-- copy to system clipboard
vim.keymap.set("v", "<leader>y", '"+y')

-- briefly highlight yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
    group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})

-- find and replace current word
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>//gI<Left><Left><Left>]])

-- vertical splits
vim.keymap.set({ "n", "v" }, "<leader>vs", ":vs<CR><C-w>l")

-- horizontal splits
vim.keymap.set({ "n", "v" }, "<leader>hs", ":sp<CR><C-w>j")

-- close split
vim.keymap.set({ "n", "v" }, "<leader>xs", "<C-w>q")

-- run tmux-sessionizer
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww ~/.config/bin/tmux-sessionizer<CR>")

-- netrw shortcuts
vim.api.nvim_create_autocmd("filetype", {
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
