vim.pack.add({
	{ src = "https://github.com/saghen/blink.cmp", version = vim.version.range("*") },
})

require("blink.cmp").setup({
	keymap = {
		preset = "none",
		["<C-Space>"] = { "show", "show_documentation", "hide_documentation" },
		["<C-j>"] = { "select_next", "fallback" },
		["<C-k>"] = { "select_prev", "fallback" },
		["<CR>"] = { "accept", "fallback" },
	},
	sources = {
		default = { "lsp", "path", "buffer" },
	},
	completion = {
		documentation = { auto_show = true },
	},
})
