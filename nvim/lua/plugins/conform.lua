return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				go = { "gofmt" },
				html = { "prettier" },
				javascript = { "prettier" },
				javascriptreact = { "prettier" },
				json = { "prettier" },
				lua = { "stylua" },
				markdown = { "prettier" },
				python = { "isort", "black" },
				rust = { "rustfmt" },
				typescript = { "prettier" },
				typescriptreact = { "prettier" },
				vue = { "prettier" },
			},
		})

		vim.keymap.set("n", "<leader>fm", conform.format)
	end,
}
