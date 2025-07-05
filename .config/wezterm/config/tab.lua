-- local wezterm = require("wezterm")
--
-- local M = {}
--
-- function M.apply_to_config(config)
-- 	config.enable_tab_bar = true -- すでに設定されているので、あえて追加
-- 	config.show_tabs_in_tab_bar = true
-- 	config.hide_tab_bar_if_only_one_tab = true
-- 	config.tab_bar_at_bottom = false
-- 	config.show_new_tab_button_in_tab_bar = false
--
-- 	-- タブバーの透過 (settings.lua と重複していたので、こちらに集約)
-- 	config.window_frame = {
-- 		inactive_titlebar_bg = "none",
-- 		active_titlebar_bg = "none",
-- 	}
-- 	config.window_background_gradient = {
-- 		colors = { "#000305" },
-- 	}
--
-- 	-- タブの色の設定
-- 	local scheme = wezterm.get_builtin_color_schemes()["nord"]
-- 	config.colors = {
-- 		tab_bar = {
-- 			background = scheme.background,
-- 			new_tab = { bg_color = "#003847", fg_color = scheme.ansi[8], intensity = "Bold" },
-- 			new_tab_hover = { bg_color = scheme.ansi[1], fg_color = scheme.brights[8], intensity = "Bold" },
-- 			active_tab = { bg_color = "#003847", fg_color = "#A9B1B1" },
-- 			inactive_tab = { bg_color = "#001920", fg_color = "#A9B1B1" },
-- 			inactive_tab_hover = { bg_color = scheme.ansi[1], fg_color = "#A9B1B1" },
-- 			inactive_tab_edge = "none", -- タブ同士の境界線を非表示
-- 		},
-- 	}
-- end
--
-- return M
--
local palette = require("colors.solarized-osaka").palette -- 新しく追加: カラーパレットを読み込む

local M = {}

function M.apply_to_config(config)
	config.enable_tab_bar = true
	config.show_tabs_in_tab_bar = true
	config.hide_tab_bar_if_only_one_tab = true
	config.tab_bar_at_bottom = false
	config.show_new_tab_button_in_tab_bar = false

	-- タブバーの透過
	config.window_frame = {
		inactive_titlebar_bg = "none",
		active_titlebar_bg = "none",
	}
	-- タブバーの背景色をパレットから指定
	config.window_background_gradient = {
		colors = { palette.base05 }, -- #000305 の代わりに palette.base04 を使用
	}

	-- タブの色の設定
	-- ここで wezterm.get_builtin_color_schemes()["nord"] は不要になります。
	-- 代わりに独自に定義した palette を使用します。
	config.colors = {
		tab_bar = {
			background = palette.base04, -- pallete.base04
			new_tab = { bg_color = palette.base03, fg_color = palette.base0, intensity = "Bold" }, -- palette.base03, palette.base0
			new_tab_hover = { bg_color = palette.blue700, fg_color = palette.base3, intensity = "Bold" }, -- palette.blue700, palette.base3 (適当な色を選んでください)
			active_tab = { bg_color = palette.base03, fg_color = palette.base1 }, -- palette.base03, palette.base1
			inactive_tab = { bg_color = palette.base04, fg_color = palette.base1 }, -- palette.base04, palette.base1
			inactive_tab_hover = { bg_color = palette.blue700, fg_color = palette.base1 }, -- palette.blue700, palette.base1 (適当な色を選んでください)
			inactive_tab_edge = "none", -- タブ同士の境界線を非表示
		},
	}
end

return M
