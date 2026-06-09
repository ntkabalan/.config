vim.pack.add({
	{ src = "https://github.com/neovim/nvim-lspconfig" },
})

vim.lsp.config("*", {
	capabilities = require("blink.cmp").get_lsp_capabilities(),
})

vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			runtime = { version = "LuaJIT" },
			diagnostics = { globals = { "vim" } },
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
				checkThirdParty = false,
			},
			telemetry = { enable = false },
		},
	},
})

vim.lsp.config("volar", {
	filetypes = { "vue" },
	init_options = {
		vue = { hybridMode = false },
		typescript = {
			tsdk = vim.fn.getcwd() .. "/node_modules/typescript/lib",
		},
	},
})

vim.lsp.config("denols", {
	root_markers = { "deno.json", "deno.jsonc" },
})

vim.lsp.config("vtsls", {
	root_markers = { "package.json" },
	workspace_required = true,
})

vim.lsp.enable({ "lua_ls", "volar", "denols", "vtsls" })

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
	callback = function(ev)
		local opts = { buffer = ev.buf }
		vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
		vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
		vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
		vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
	end,
})
