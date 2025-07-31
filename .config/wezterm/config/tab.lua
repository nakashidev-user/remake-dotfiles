-- local palette = require("colors.solarized-osaka").palette -- 新しく追加: カラーパレットを読み込む

local M = {}

function M.apply_to_config(config)
	config.enable_tab_bar = true
	config.show_tabs_in_tab_bar = true
	config.hide_tab_bar_if_only_one_tab = true
	config.tab_bar_at_bottom = false
	config.show_new_tab_button_in_tab_bar = false

	-- タブバーの詳細カスタマイズは将来的にsolarized-osakaパレットを使用して実装予定
end

return M
