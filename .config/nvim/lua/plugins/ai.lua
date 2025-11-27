return {
	{
		"NickvanDyke/opencode.nvim",
		lazy = false,
		dependencies = {
			-- Recommended for `ask()` and `select()`.
			-- Required for `toggle()`.
			{ "folke/snacks.nvim", opts = { input = {}, picker = {} } },
		},
		config = function()
			vim.g.opencode_opts = {
				-- Your configuration, if any — see `lua/opencode/config.lua`, or "goto definition" on `opencode_opts`.
			}

			-- Required for `vim.g.opencode_opts.auto_reload`.
			vim.o.autoread = true

			-- Recommended/example keymaps.
			vim.keymap.set({ "n", "x" }, "<leader>oa", function()
				require("opencode").ask("@this: ", { submit = true })
			end, { desc = "Ask about this" })
			vim.keymap.set({ "n", "x" }, "<leader>os", function()
				require("opencode").select()
			end, { desc = "Select prompt" })
			vim.keymap.set({ "n", "x" }, "<leader>o+", function()
				require("opencode").prompt("@this")
			end, { desc = "Add this" })
			vim.keymap.set("n", "<leader>ot", function()
				require("opencode").toggle()
			end, { desc = "Toggle embedded" })
			vim.keymap.set("n", "<leader>oc", function()
				require("opencode").command()
			end, { desc = "Select command" })
			vim.keymap.set("n", "<leader>on", function()
				require("opencode").command("session_new")
			end, { desc = "New session" })
			vim.keymap.set("n", "<leader>oi", function()
				require("opencode").command("session_interrupt")
			end, { desc = "Interrupt session" })
			vim.keymap.set("n", "<leader>oA", function()
				require("opencode").command("agent_cycle")
			end, { desc = "Cycle selected agent" })
			vim.keymap.set("n", "<S-C-u>", function()
				require("opencode").command("messages_half_page_up")
			end, { desc = "Messages half page up" })
			vim.keymap.set("n", "<S-C-d>", function()
				require("opencode").command("messages_half_page_down")
			end, { desc = "Messages half page down" })
		end,
	},
	{
		"johnseth97/codex.nvim",
		lazy = true,
		cmd = { "Codex", "CodexToggle" }, -- Optional: Load only on command execution
		keys = {
			-- Normal: <C-i> で Codex を開き、直後に挿入モード
			{
				"<leader>ai",
				function()
					vim.cmd("Codex")
					vim.schedule(function()
						vim.cmd("startinsert")
					end)
				end,
				mode = "n",
				desc = "Codex を開いてすぐ入力",
			},

			-- Visual: 選択範囲をコンテキスト相当として入力欄へ貼付
			{
				"<leader>cx",
				function()
					local s = vim.fn.getpos("'<")
					local e = vim.fn.getpos("'>")
					local lines = vim.fn.getline(s[2], e[2])
					if #lines > 0 then
						lines[#lines] = string.sub(lines[#lines], 1, e[3])
						lines[1] = string.sub(lines[1], s[3])
					end
					local text = table.concat(lines, "\n")

					vim.cmd("Codex")
					vim.schedule(function()
						vim.cmd("startinsert")
						if text and #text > 0 then
							vim.api.nvim_paste("【選択範囲コンテキスト】\n" .. text .. "\n\n", true, -1)
						end
					end)
				end,
				mode = "v",
				desc = "選択範囲をコンテキストとして貼付",
			},
		},
		opts = {
			keymaps = {
				toggle = nil, -- Keybind to toggle Codex window (Disabled by default, watch out for conflicts)
				quit = "<C-q>", -- Keybind to close the Codex window (default: Ctrl + q)
			}, -- Disable internal default keymap (<leader>cc -> :CodexToggle)
			border = "rounded", -- Options: 'single', 'double', or 'rounded'
			width = 0.8, -- Width of the floating window (0.0 to 1.0)
			height = 0.8, -- Height of the floating window (0.0 to 1.0)
			model = "gpt-5", -- Optional: pass a string to use a specific model (e.g., 'o3-mini')
			autoinstall = true, -- Automatically install the Codex CLI if not found
		},
	},
	{
		"coder/claudecode.nvim",
		opts = {
			-- Server options
			port_range = { min = 10000, max = 65535 },
			auto_start = true,
			log_level = "info",

			-- Terminal options
			terminal = {
				split_side = "right",
				split_width_percentage = 0.4,
				provider = "snacks", -- or "native"
			},

			-- Diff options
			diff_opts = {
				auto_close_on_accept = true,
				vertical_split = true,
			},
		},
		config = true,
		keys = {
			{ "<leader>ac", "<cmd>ClaudeCode<cr>", desc = "Toggle Claude" },
			{ "<leader>as", "<cmd>ClaudeCodeSend<cr>", mode = "v", desc = "Send to Claude" },
			{ "<leader>ao", "<cmd>ClaudeCodeOpen<cr>", desc = "Open Claude" },
			{ "<leader>ax", "<cmd>ClaudeCodeClose<cr>", desc = "Close Claude" },
		},
	},
}
