local wezterm = require("wezterm")
local config = {}

-- theme
-- config.color_scheme = "Gruvbox Material (Gogh)"
config.color_scheme = "rose-pine"
config.colors = {
	-- gruvbox
	-- cursor_bg = "#d4be98",
	-- cursor_fg = "#282828",

	-- rose-pine
	cursor_bg = "#f2e9e1",
	cursor_fg = "#26233a",
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
