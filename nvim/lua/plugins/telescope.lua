return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local actions = require("telescope.actions")

		require("telescope").setup({
			defaults = {
				mappings = {
					i = {
						["<C-j>"] = actions.move_selection_next,
						["<C-k>"] = actions.move_selection_previous,
						["<esc>"] = actions.close,
					},
				},
			},
			pickers = {
				find_files = {
					hidden = true,
					theme = "dropdown",
					file_ignore_patterns = { ".git/" },
				},
				live_grep = {
					additional_args = function()
						return { "--hidden" }
					end,
					theme = "dropdown",
				},
				buffers = {
					theme = "dropdown",
				},
				help_tags = {
					theme = "dropdown",
				},
			},
		})

		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
		vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
		vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
		vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
		vim.keymap.set("n", "<leader>f/", function()
			local themes = require("telescope.themes")

			builtin.current_buffer_fuzzy_find(themes.get_dropdown({
				previewer = false,
			}))
		end, {})
	end,
}
