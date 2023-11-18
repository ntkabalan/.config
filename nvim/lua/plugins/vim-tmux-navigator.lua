return {
	"alexghergh/nvim-tmux-navigation",
	config = function()
		local nvim_tmux_nav = require("nvim-tmux-navigation")

		nvim_tmux_nav.setup({
			disable_when_zoomed = true,
			keybindings = {
				left = "<C-h>",
				down = "<C-j>",
				up = "<C-k>",
				right = "<C-l>",
				last_active = "<C-\\>",
			},
		})

		-- override netrw keybindings
		vim.api.nvim_create_autocmd("filetype", {
			pattern = "netrw",
    		callback = function()
				vim.keymap.set("n", "<C-h>", nvim_tmux_nav.NvimTmuxNavigateLeft, { remap = true, buffer = true })
				vim.keymap.set("n", "<C-j>", nvim_tmux_nav.NvimTmuxNavigateDown, { remap = true, buffer = true })
				vim.keymap.set("n", "<C-k>", nvim_tmux_nav.NvimTmuxNavigateUp, { remap = true, buffer = true })
				vim.keymap.set("n", "<C-l>", nvim_tmux_nav.NvimTmuxNavigateRight, { remap = true, buffer = true })
			end,
		})
	end,
}
