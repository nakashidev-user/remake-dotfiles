local wezterm = require("wezterm")

local M = {}

function M.apply_to_config(config)
	config.detect_password_input = true
	config.color_scheme = "Solarized Dark - Patched"
	config.use_ime = true
	config.term = "xterm-256color"
	config.initial_cols = 120
	config.initial_rows = 28
	config.window_background_opacity = 0.95
	config.default_cursor_style = "BlinkingBar"
	config.font = wezterm.font_with_fallback({
		-- "0xProto Nerd Font Mono",
		-- "Moralerspace Krypton",
		-- "Moralerspace Argon",
		"Moralerspace Neon",
		-- "Moralerspace Radon",
		-- "monospace",
		-- "Press Start 2P",
		-- "Monocraft Nerd Font",
		-- "FiraCode Nerd Font",
		-- "Hack Nerd Font Mono",
		-- "Monaco",
		-- "Menlo",
		-- "Terminess Nerd Font Mono",
	})
	config.harfbuzz_features = { "calt=0", "clig=0", "liga=0" }
	config.font_size = 17.0
	config.window_background_gradient = {
		colors = { "#000305" }, -- 背景グラデーション用の色（将来的にはpalette.base04を使用予定）
	}

	config.window_decorations = "RESIZE"
	config.window_frame = {
		inactive_titlebar_bg = "none",
		active_titlebar_bg = "none",
	}
	config.window_padding = {
		left = 0,
		right = 0,
		top = 0,
		bottom = 0,
	}
	config.window_close_confirmation = "NeverPrompt"
	config.cursor_blink_rate = 600
	config.cursor_blink_ease_out = "Linear"

	config.audible_bell = "SystemBeep"
	config.leader = { key = "w", mods = "CTRL", timeout_milliseconds = 2000 }
end

return M
