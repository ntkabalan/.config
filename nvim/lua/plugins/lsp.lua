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
			{ "L3MON4D3/LuaSnip" },
		},
		config = function()
			-- configure the autocomplete settings
			local lsp_zero = require("lsp-zero")
			lsp_zero.extend_cmp()

			-- configure cmp
			local cmp = require("cmp")
			local cmp_action = lsp_zero.cmp_action()
			local cmp_select = { behavior = cmp.SelectBehavior.Select }

			cmp.setup({
				formatting = lsp_zero.cmp_format(),
				mapping = cmp.mapping.preset.insert({
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-j>"] = cmp.mapping.select_next_item(cmp_select),
					["<C-k>"] = cmp.mapping.select_prev_item(cmp_select),
					["<C-f>"] = cmp_action.luasnip_jump_forward(),
					["<C-b>"] = cmp_action.luasnip_jump_backward(),
					["<Enter>"] = cmp.mapping.confirm({
						behavior = cmp.ConfirmBehavior.Replace,
						select = true,
					}),
				}),
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

            require("lspconfig").sourcekit.setup({
                cmd = { "xcrun", "sourcekit-lsp" },
                filetypes = { "swift" },
                -- root_dir = require("lspconfig").util.root_pattern("Package.swift"),
                root_dir = require("lspconfig").util.root_pattern("*"),
            })
		end,
	},
}
