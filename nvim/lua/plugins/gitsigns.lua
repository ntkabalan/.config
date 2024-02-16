return {
	"lewis6991/gitsigns.nvim",
	event = { "BufReadPost", "BufNewFile" },
	config = function()
		require("gitsigns").setup({
            _extmark_signs = false,
			attach_to_untracked = false,
		})

		local opts = { noremap = true, silent = true }
		vim.keymap.set("n", "<leader>hr", ":Gitsigns reset_hunk<cr>", opts)
		vim.keymap.set("n", "<leader>hp", ":Gitsigns preview_hunk<cr>", opts)
        vim.keymap.set("n", "]c", ":Gitsigns next_hunk<cr>", opts)
        vim.keymap.set("n", "[c", ":Gitsigns prev_hunk<cr>", opts)
	end,
}
