local STYLE_NAME = "solarized-osaka"
local TAB_BAR_BG_COLOR = "#191b28"

--- テンプレート文字列内の変数を置換する関数
--- @param str string テンプレート文字列
--- @param vars table 置換変数のテーブル
--- @return string 置換後の文字列
local function template(str, vars)
    local allowed_keys = {
        "fg", "bg", "blue700", "black", "red", "green", "yellow", "blue", "magenta", "cyan", "base0",
        "base03", "base02", "tab_bar_background", "_style_name"
    }
    local function is_valid_key(key)
        for _, allowed_key in ipairs(allowed_keys) do
            if key == allowed_key then
                return true
            end
        end
        return false
    end
    return (str:gsub("%${(.-)}", function(key)
        if is_valid_key(key) then
            return vars[key] or (key == "_style_name" and STYLE_NAME or "${" .. key .. "}")
        else
            return "${" .. key .. "}"
        end
    end))
end

local M = {}

--- @class ColorScheme
--- @field fg string The foreground color
--- @field bg string The background color
--- @field blue700 string The selection background color
--- @field black string The ANSI black color
--- @field red string The ANSI red color
--- @field green string The ANSI green color
--- @field yellow string The ANSI yellow color
--- @field blue string The ANSI blue color
--- @field magenta string The ANSI magenta color
--- @field cyan string The ANSI cyan color
--- @field base0 string The ANSI base0 color
--- @field base03 string The inactive tab edge color
--- @field base02 string The inactive tab foreground color
--- @field tab_bar_background string The tab bar background color
--- @field _style_name string The style name (internal use)

--- @param colors ColorScheme
function M.generate(colors)
	local wezterm = template(
		[[
[colors]
foreground = "${fg}"
background = "${bg}"
cursor_bg = "${fg}"
cursor_border = "${fg}"
cursor_fg = "${bg}"
selection_bg = "${blue700}"
selection_fg = "${fg}"

ansi = ["${black}", "${red}", "${green}", "${yellow}", "${blue}", "${magenta}", "${cyan}", "${base0}"]
brights = ["${bg}", "${red}", "${green}", "${yellow}", "${blue}", "${magenta}", "${cyan}", "${fg}"]

[colors.tab_bar]
inactive_tab_edge = "${base03}"
background = "${tab_bar_background}"

[colors.tab_bar.active_tab]
fg_color = "${blue}"
bg_color = "${bg}"

[colors.tab_bar.inactive_tab]
bg_color = "${base03}"
fg_color = "${base02}"

[colors.tab_bar.inactive_tab_hover]
bg_color = "${base03}"
fg_color = "${blue}"

[colors.tab_bar.new_tab_hover]
fg_color = "${base03}"
bg_color = "${blue}"

[colors.tab_bar.new_tab]
fg_color = "${blue}"
bg_color = "${tab_bar_background}"

[metadata]
aliases = []
author = "nakashidev-user"
name = "${_style_name}"]],
		colors
	)
	return wezterm
end

return M
