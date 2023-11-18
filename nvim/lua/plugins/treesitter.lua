return {
	"nvim-treesitter/nvim-treesitter",
	build = function()
		require("nvim-treesitter.install").update({ with_sync = true })()
	end,
	config = function()
		require("nvim-treesitter.configs").setup({
			-- list of parser names to install by default
			ensure_installed = {
				-- required
				"c",
				"lua",
				"vim",
				"vimdoc",
				"query",

				-- additional parsers
				"javascript",
				"typescript",
				"python",
			},

			-- install parsers synchronously (only applied to `ensure_installed`)
			sync_install = false,

			-- auto-indentation is an experimental feature, and works better with some languages than others
			indent = {
				enable = true,
				disable = { "go" },
			},

			-- automatically install missing parsers when entering buffer
			-- recommendation: set to false if you don't have `tree-sitter` CLI installed locally
			auto_install = true,

			highlight = {
				enable = true,

				-- setting this to true will run `:h syntax` and tree-sitter at the same time.
				-- set this to `true` if you depend on 'syntax' being enabled (like for indentation).
				-- using this option may slow down your editor, and you may see some duplicate highlights.
				-- instead of true it can also be a list of languages
				additional_vim_regex_highlighting = false,
			},
		})
	end,
}
