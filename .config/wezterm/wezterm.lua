local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- 各設定ファイルを読み込み、configに適用します
require("config.setting").apply_to_config(config)
require("config.tab").apply_to_config(config)
require("config.keybinding").apply_to_config(config)
return config
