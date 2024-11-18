return {
	-- helpers for setting up the neovim lsp client
	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v3.x",
		lazy = true,
		config = false,
		init = function()
			vim.g.lsp_zero_extend_cmp = 0
			vim.g.lsp_zero_extend_lspconfig = 0
		end,
	},

	-- language server manager
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = true,
	},

	-- autocomplete
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			{ "saadparwaiz1/cmp_luasnip" },
			{ "L3MON4D3/LuaSnip" },
			{ "rafamadriz/friendly-snippets" },
		},
		config = function()
			-- configure the autocomplete settings
			local lsp_zero = require("lsp-zero")
			lsp_zero.extend_cmp()

			-- configure cmp
			local cmp = require("cmp")
			local cmp_action = lsp_zero.cmp_action()
			local cmp_select = { behavior = cmp.SelectBehavior.Select }

			require("luasnip.loaders.from_vscode").lazy_load()

			cmp.setup({
				formatting = lsp_zero.cmp_format(),
				mapping = cmp.mapping.preset.insert({
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-j>"] = cmp.mapping.select_next_item(cmp_select),
					["<C-k>"] = cmp.mapping.select_prev_item(cmp_select),
					["<C-n>"] = cmp_action.luasnip_jump_forward(),
					["<C-p>"] = cmp_action.luasnip_jump_backward(),
					["<Enter>"] = cmp.mapping.confirm({
						select = true,
					}),
				}),
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},
				sources = {
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
					{ name = "buffer" },
				},
			})
		end,
	},

	-- lsp config
	{
		"neovim/nvim-lspconfig",
		cmd = { "LspInfo", "LspInstall", "LspStart" },
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "williamboman/mason-lspconfig.nvim" },
		},
		config = function()
			local lsp_zero = require("lsp-zero")
			lsp_zero.extend_lspconfig()

			lsp_zero.on_attach(function(_, bufnr)
				-- set up keymaps
				lsp_zero.default_keymaps({ buffer = bufnr })
				vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)
				vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename)
				vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float)
				vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help)
			end)

			require("mason-lspconfig").setup({
				ensure_installed = {},
				handlers = {
					lsp_zero.default_setup,
					lua_ls = function()
						-- configure lua language server for neovim
						local lua_opts = lsp_zero.nvim_lua_ls()
						require("lspconfig").lua_ls.setup(lua_opts)
					end,
				},
			})

			local lspconfig = require("lspconfig")

			-- configuration to get the vue language server working
			-- context here: https://github.com/williamboman/mason-lspconfig.nvim/issues/371
			lspconfig.volar.setup({
				filetypes = {
					"vue",
				},
				init_options = {
					vue = {
						hybridMode = false,
					},
					typescript = {
						tsdk = vim.fn.getcwd() .. "/node_modules/typescript/lib",
					},
				},
			})

			lspconfig.denols.setup({
				root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc"),
			})

			lspconfig.tsserver.setup({
				root_dir = lspconfig.util.root_pattern("package.json"),
				single_file_support = false,
			})
		end,
	},
}
