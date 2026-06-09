vim.pack.add({
	{ src = "https://github.com/nvim-lua/plenary.nvim" },
	{ src = "https://github.com/ThePrimeagen/harpoon", version = "harpoon2" },
})

local harpoon = require("harpoon")

harpoon:setup()

vim.keymap.set("n", "<leader>a", function()
	harpoon:list():add()
end)

vim.keymap.set("n", "<leader>e", function()
	harpoon.ui:toggle_quick_menu(harpoon:list())
end)

vim.keymap.set("n", "<C-P>", function()
	harpoon:list():prev()
end)

vim.keymap.set("n", "<C-N>", function()
	harpoon:list():next()
end)
