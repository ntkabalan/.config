vim.pack.add({
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
})

require("nvim-treesitter").install({
	"c",
	"lua",
	"vim",
	"vimdoc",
	"query",
	"javascript",
	"typescript",
	"python",
})

vim.api.nvim_create_autocmd("FileType", {
	group = vim.api.nvim_create_augroup("treesitter-start", { clear = true }),
	callback = function()
		if pcall(vim.treesitter.start) then
			vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
		end
	end,
})

vim.api.nvim_create_autocmd("PackChanged", {
	callback = function(ev)
		if ev.data.spec.name == "nvim-treesitter" and ev.data.kind ~= "delete" then
			require("nvim-treesitter").update()
		end
	end,
})

-- shim master-branch API for plugins that haven't migrated to main
-- (e.g., telescope previewers call parsers.ft_to_lang and configs.is_enabled)
do
	local parsers = require("nvim-treesitter.parsers")
	parsers.ft_to_lang = function(ft)
		return vim.treesitter.language.get_lang(ft) or ft
	end
	parsers.get_parser = function(bufnr, lang)
		if not lang or not pcall(vim.treesitter.language.add, lang) then
			return nil
		end
		return vim.treesitter.get_parser(bufnr, lang)
	end

	package.loaded["nvim-treesitter.configs"] = {
		is_enabled = function(_, lang)
			return lang ~= nil and pcall(vim.treesitter.language.add, lang)
		end,
		get_module = function()
			return { additional_vim_regex_highlighting = false }
		end,
	}
end
