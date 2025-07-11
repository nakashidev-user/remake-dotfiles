local wezterm = require("wezterm")
local act = wezterm.action

local M = {}

function M.apply_to_config(config)
	config.keys = {
		{ key = "-", mods = "CTRL", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
		{ key = "=", mods = "CTRL", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
		{ key = "H", mods = "SHIFT|CTRL", action = act.AdjustPaneSize({ "Left", 5 }) },
		{ key = "L", mods = "SHIFT|CTRL", action = act.AdjustPaneSize({ "Right", 5 }) },
		{ key = "J", mods = "SHIFT|CTRL", action = act.AdjustPaneSize({ "Down", 5 }) },
		{ key = "K", mods = "SHIFT|CTRL", action = act.AdjustPaneSize({ "Up", 5 }) },
		{ key = "O", mods = "SHIFT|CTRL", action = act.TogglePaneZoomState },
		{ key = "t", mods = "CMD", action = act.SpawnCommandInNewTab({ cwd = "~" }) },
		{
			key = "s",
			mods = "CTRL",
			action = act.ShowLauncherArgs({ flags = "WORKSPACES", title = "Select workspace" }),
		},
		{ key = "o", mods = "CMD", action = act.ToggleFullScreen },
		{ key = "[", mods = "CTRL", action = act.ActivateCopyMode },
		{ key = "c", mods = "SUPER", action = act.CopyTo("Clipboard") },
		{ key = "v", mods = "SUPER", action = act.PasteFrom("Clipboard") },
		{
			key = "O",
			mods = "SHIFT|CTRL",
			action = act.ActivateKeyTable({
				name = "leader_w_pane_nav",
				timeout_milliseconds = 1500,
			}),
		},
	}

	config.key_tables = {
		leader_w_pane_nav = {
			{
				key = "h",
				mods = "NONE",
				action = act.ActivatePaneDirection("Left"),
			},
			{
				key = "l",
				mods = "NONE",
				action = act.ActivatePaneDirection("Right"),
			},
			{
				key = "j",
				mods = "NONE",
				action = act.ActivatePaneDirection("Down"),
			},
			{
				key = "k",
				mods = "NONE",
				action = act.ActivatePaneDirection("Up"),
			},
			{
				key = "Escape",
				mods = "NONE",
				action = act.PopKeyTable,
			},
		},
	}
end

return M
