local STYLE_NAME = "solarized-osaka"
local TAB_BAR_BG_COLOR = "#191b28"

local function template(str, vars)
    return (str:gsub("%${(.-)}", function(key)
        return vars[key] or (key == "_style_name" and STYLE_NAME or "${" .. key .. "}")
    end))
end

local M = {}

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
author = "craftzdog"
name = "${_style_name}"]],
		colors
	)
	return wezterm
end

return M
