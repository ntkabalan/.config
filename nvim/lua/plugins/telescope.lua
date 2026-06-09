-- build fzf-native's C matcher on install/update
vim.api.nvim_create_autocmd("PackChanged", {
	callback = function(ev)
		if ev.data.spec.name == "telescope-fzf-native.nvim" and ev.data.kind ~= "delete" then
			vim.system({ "make" }, { cwd = ev.data.path }):wait()
		end
	end,
})

vim.pack.add({
	{ src = "https://github.com/nvim-lua/plenary.nvim" },
	{ src = "https://github.com/nvim-telescope/telescope.nvim", version = "0.1.8" },
	{ src = "https://github.com/nvim-telescope/telescope-fzf-native.nvim" },
})

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
		preview = {
			-- nvim-treesitter main branch breaks telescope's treesitter previewer.
			-- regex highlighter (vim syntax) is used instead.
			treesitter = false,
		},
	},
	pickers = {
		find_files = {
			hidden = true,
			theme = "dropdown",
			file_ignore_patterns = { ".git/", "node_modules/" },
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

-- pcall in case the .so hasn't built yet on first launch; restart fixes it
pcall(require("telescope").load_extension, "fzf")

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
