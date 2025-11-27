local wezterm = require("wezterm")
local act = wezterm.action

local M = {}

function M.apply_to_config(config)
	config.keys = {
		{ key = "-", mods = "CTRL", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
		{ key = "=", mods = "CTRL", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
		{ key = "h", mods = "CTRL", action = act.ActivatePaneDirection("Left") },
		{ key = "j", mods = "CTRL", action = act.ActivatePaneDirection("Down") },
		{ key = "k", mods = "CTRL", action = act.ActivatePaneDirection("Up") },
		{ key = "l", mods = "CTRL", action = act.ActivatePaneDirection("Right") },
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
		{ key = "c", mods = "SUPER", action = act.CopyTo("Clipboard") },
		{ key = "v", mods = "SUPER", action = act.PasteFrom("Clipboard") },

		{
			-- CTRL+wでペイン操作のリーダーキーを起動（vimライクな操作感の向上）
			key = "w",
			mods = "LEADER",
			action = act.ActivateKeyTable({
				name = "leader_w_pane_nav",
				timeout_milliseconds = 1500,
			}),
		},
		{
			-- CTRL+sを無効化（保存操作の誤動作防止とvim/tmuxとの競合回避）
			key = "s",
			mods = "CTRL",
			action = act.DisableDefaultAssignment,
		},
		{
			key = "Enter",
			mods = "SHIFT",
			action = act.SendKey({ key = "\n" }),
		},
		{ key = "[", mods = "LEADER", action = act.ActivateCopyMode },
		{
			key = "z",
			mods = "LEADER",
			action = act.TogglePaneZoomState,
		},
		{
			key = "s",
			mods = "LEADER",
			action = act.ShowLauncherArgs({ flags = "WORKSPACES", title = "Select workspace" }),
		},
		{
			-- Rename workspace
			mods = "LEADER",
			key = "$",
			action = act.PromptInputLine({
				description = "(wezterm) Set workspace title:",
				action = wezterm.action_callback(function(win, pane, line)
					if line then
						wezterm.mux.rename_workspace(wezterm.mux.get_active_workspace(), line)
					end
				end),
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
				key = "z",
				mods = "NONE",
				action = act.TogglePaneZoomState,
			},
			{
				key = "Escape",
				mods = "NONE",
				action = act.PopKeyTable,
			},
		},
		copy_mode = {
			-- 移動
			{ key = "h", mods = "NONE", action = act.CopyMode("MoveLeft") },
			{ key = "j", mods = "NONE", action = act.CopyMode("MoveDown") },
			{ key = "k", mods = "NONE", action = act.CopyMode("MoveUp") },
			{ key = "l", mods = "NONE", action = act.CopyMode("MoveRight") },
			-- 最初と最後に移動
			{ key = "^", mods = "NONE", action = act.CopyMode("MoveToStartOfLineContent") },
			{ key = "$", mods = "NONE", action = act.CopyMode("MoveToEndOfLineContent") },
			-- 左端に移動
			{ key = "0", mods = "NONE", action = act.CopyMode("MoveToStartOfLine") },
			{ key = "o", mods = "NONE", action = act.CopyMode("MoveToSelectionOtherEnd") },
			{ key = "O", mods = "NONE", action = act.CopyMode("MoveToSelectionOtherEndHoriz") },
			--
			{ key = ";", mods = "NONE", action = act.CopyMode("JumpAgain") },
			-- 単語ごと移動
			{ key = "w", mods = "NONE", action = act.CopyMode("MoveForwardWord") },
			{ key = "b", mods = "NONE", action = act.CopyMode("MoveBackwardWord") },
			{ key = "e", mods = "NONE", action = act.CopyMode("MoveForwardWordEnd") },
			-- ジャンプ機能 t f
			{ key = "t", mods = "NONE", action = act.CopyMode({ JumpForward = { prev_char = true } }) },
			{ key = "f", mods = "NONE", action = act.CopyMode({ JumpForward = { prev_char = false } }) },
			{ key = "T", mods = "NONE", action = act.CopyMode({ JumpBackward = { prev_char = true } }) },
			{ key = "F", mods = "NONE", action = act.CopyMode({ JumpBackward = { prev_char = false } }) },
			-- 一番下へ
			{ key = "G", mods = "NONE", action = act.CopyMode("MoveToScrollbackBottom") },
			-- 一番上へ
			{ key = "g", mods = "NONE", action = act.CopyMode("MoveToScrollbackTop") },
			-- viweport
			{ key = "H", mods = "NONE", action = act.CopyMode("MoveToViewportTop") },
			{ key = "L", mods = "NONE", action = act.CopyMode("MoveToViewportBottom") },
			{ key = "M", mods = "NONE", action = act.CopyMode("MoveToViewportMiddle") },
			-- スクロール
			{ key = "b", mods = "CTRL", action = act.CopyMode("PageUp") },
			{ key = "f", mods = "CTRL", action = act.CopyMode("PageDown") },
			{ key = "d", mods = "CTRL", action = act.CopyMode({ MoveByPage = 0.5 }) },
			{ key = "u", mods = "CTRL", action = act.CopyMode({ MoveByPage = -0.5 }) },
			-- 範囲選択モード
			{ key = "v", mods = "NONE", action = act.CopyMode({ SetSelectionMode = "Cell" }) },
			{ key = "v", mods = "CTRL", action = act.CopyMode({ SetSelectionMode = "Block" }) },
			{ key = "V", mods = "NONE", action = act.CopyMode({ SetSelectionMode = "Line" }) },
			-- コピー
			{ key = "y", mods = "NONE", action = act.CopyTo("Clipboard") },

			-- コピーモードを終了
			{
				key = "Enter",
				mods = "NONE",
				action = act.Multiple({ { CopyTo = "ClipboardAndPrimarySelection" }, { CopyMode = "Close" } }),
			},
			{ key = "Escape", mods = "NONE", action = act.CopyMode("Close") },
			{ key = "c", mods = "CTRL", action = act.CopyMode("Close") },
			{ key = "q", mods = "NONE", action = act.CopyMode("Close") },
		},
	}
end

return M
