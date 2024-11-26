return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local function is_deno_project()
			return vim.fn.filereadable(vim.fn.getcwd() .. "/deno.json") == 1
		end

		local js_formatter

		if is_deno_project() then
			js_formatter = "deno_fmt"
		else
			js_formatter = "prettier"
		end

		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				go = { "gofmt" },
				html = { js_formatter },
				javascript = { js_formatter },
				javascriptreact = { js_formatter },
				json = { js_formatter },
				lua = { "stylua" },
				markdown = { js_formatter },
				python = { "isort", "black" },
				rust = { "rustfmt" },
				typescript = { js_formatter },
				typescriptreact = { js_formatter },
				vue = { js_formatter },
			},
		})

		vim.keymap.set("n", "<leader>fm", conform.format)
	end,
}
