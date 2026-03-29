local wezterm = require("wezterm")
local config = {}

config.default_prog = { "zsh" }

config.font = wezterm.font("IosevkaTerm Nerd Font")
config.font_size = 14.0

config.window_background_opacity = 0.91

config.window_padding = {
	top = 0,
	right = 0,
	left = 0,
	bottom = 0,
}

config.enable_scroll_bar = false
config.hide_tab_bar_if_only_one_tab = true

config.default_cursor_style = "SteadyBlock"
config.cursor_blink_rate = 500
config.cursor_blink_ease_in = "Constant"
config.cursor_blink_ease_out = "Constant"

-- TERMINAL
config.term = "xterm-256color"
config.enable_csi_u_key_encoding = true

-- Undercurl support
config.underline_thickness = 2
config.underline_position = -2

-- Scrollback
config.scrollback_lines = 10000

-- Performance
config.max_fps = 240

-- Image support
config.enable_kitty_graphics = true

-- Input handling
config.use_dead_keys = false
config.send_composed_key_when_left_alt_is_pressed = false
config.send_composed_key_when_right_alt_is_pressed = false

-- THEME
config.colors = {
	foreground = "#dcd7ba",
	background = "#1f1f28",

	cursor_bg = "#c8c093",
	cursor_fg = "#1f1f28",
	cursor_border = "#c8c093",

	selection_fg = "#dcd7ba",
	selection_bg = "#2d4f67",

	ansi = {
		"#1f1f28", -- black
		"#c34043", -- red
		"#76946a", -- green
		"#c0a36e", -- yellow
		"#7e9cd8", -- blue
		"#957fb8", -- magenta
		"#6a9589", -- cyan
		"#dcd7ba", -- white
	},

	brights = {
		"#727169", -- bright black
		"#e82424", -- bright red
		"#98bb6c", -- bright green
		"#e6c384", -- bright yellow
		"#7fb4ca", -- bright blue
		"#938aa9", -- bright magenta
		"#7aa89f", -- bright cyan
		"#ffffff", -- bright white
	},
}

return config
