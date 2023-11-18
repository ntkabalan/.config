-- set colorscheme
local name = "rose-pine"

-- if theme is not installed, set habamax as default
local theme_ok = pcall(vim.cmd.colorscheme, name)
if not theme_ok then
	vim.cmd.colorscheme("habamax")
	return vim.notify("\nFailed to load colorscheme " .. name .. "\nUse habamax instead", vim.log.levels.ERROR)
end
