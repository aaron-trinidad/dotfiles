local wezterm = require("wezterm")
local config = {}

config.default_prog = { "zsh" }

config.font = wezterm.font("IosevkaTerm NF")
config.font_size = 14.0

config.window_background_opacity = 0.95

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
	foreground = "#f3f6f9",
	background = "#06080f",

	cursor_bg = "#e0c15a",
	cursor_fg = "#06080f",
	cursor_border = "#e0c15a",

	selection_fg = "#f3f6f9",
	selection_bg = "#263356",

	ansi = {
		"#06080f",
		"#cb7c94",
		"#b7cc85",
		"#ffe066",
		"#7fb4ca",
		"#ff8dd7",
		"#7aa89f",
		"#f3f6f9",
	},

	brights = {
		"#8a8fa3",
		"#de8fa8",
		"#d1e8a9",
		"#fff7b1",
		"#a3d4d5",
		"#ffaeea",
		"#7fb4ca",
		"#f3f6f9",
	},
}

return config
