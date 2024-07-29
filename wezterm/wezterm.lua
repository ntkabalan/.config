local wezterm = require("wezterm")
local config = {}

-- theme
-- config.color_scheme = "Gruvbox Material (Gogh)"
-- config.color_scheme = "rose-pine"
-- config.colors = {
-- 	-- gruvbox
-- 	cursor_bg = "#d4be98",
-- 	cursor_fg = "#282828",
--
-- 	-- rose-pine
-- 	cursor_bg = "#f2e9e1",
-- 	cursor_fg = "#26233a",
-- }

config.colors = {
	foreground = "#e7e9f1",
	background = "#14161b",
	cursor_bg = "#d4be98",
	cursor_fg = "#1e1e1e",
	-- selection_bg = "#404040",
	-- selection_fg = "#d4be98",
	ansi = {
		"#1e1e1e", -- black
		"#f7768e", -- red
		"#bfffcd", -- green
		"#e0af68", -- yellow
		"#7aa2f7", -- blue
		"#adedb9", -- magenta
		"#a1d5f7", -- cyan
		"#a9b1d6", -- white
	},
	brights = {
		"#414868", -- bright black
		"#f7768e", -- bright red
		"#bfffcd", -- bright green
		"#e0af68", -- bright yellow
		"#7aa2f7", -- bright blue
		"#adedb9", -- bright magenta
		"#a1d5f7", -- bright cyan
		"#c0caf5", -- bright white
	},
}

config.font = wezterm.font("Menlo")
config.cursor_blink_rate = 0

-- tabs
config.hide_tab_bar_if_only_one_tab = true

-- hide title bar
config.window_decorations = "RESIZE"

-- keep window size consistent when changing font size
config.adjust_window_size_when_changing_font_size = false

-- disable ligatures
config.harfbuzz_features = { "calt=0", "clig=0", "liga=0" }

-- disable error sounds
config.audible_bell = "Disabled"

-- keybindings
config.keys = {
	-- make option + left/right arrow keys jump to previous/next word respectively
	{ key = "LeftArrow", mods = "OPT", action = wezterm.action({ SendString = "\x1bb" }) },
	{ key = "RightArrow", mods = "OPT", action = wezterm.action({ SendString = "\x1bf" }) },
}

return config
