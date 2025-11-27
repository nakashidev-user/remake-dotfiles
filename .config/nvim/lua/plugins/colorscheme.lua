return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		lazy = false,
		version = false,
		opts = {
			integrations = {
				bufferline = true,
				-- 他にも使っているプラグインがあればここで true に
			},
		},
	},
	{
		"bluz71/vim-moonfly-colors",
		name = "moonfly",
		lazy = false,
		priority = 1000,
		config = function()
			vim.g.moonflyTransparent = true
		end,
	},
	{
		"brendon-felix/anysphere.nvim",
		priority = 1000,
		config = true,
		opts = {},
	},
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
	},
	{
		"xiantang/darcula-dark.nvim",
		config = function()
			-- setup must be called before loading
			require("darcula").setup({
				opt = {
					integrations = {
						telescope = true,
						lualine = true,
						transparent = true,
					},
				},
			})
		end,
	},
	{
		"eldritch-theme/eldritch.nvim",
		lazy = false,
		priority = 1000,
		opts = function()
			return {
				transparent = true,
			}
		end,
	},
	{
		"craftzdog/solarized-osaka.nvim",
		lazy = true,
		priority = 1000,
		opts = function()
			return {
				transparent = true,
				on_highlights = function(hl, c)
					hl.markdownCodeBlock = {
						bg = nil,
					}
				end,
			}
		end,
	},
	-- color code highlights
	{
		"uga-rosa/ccc.nvim",
		event = "BufReadPost",
		config = function()
			vim.opt.termguicolors = true
			local ccc = require("ccc")
			ccc.setup({
				highlighter = {
					auto_enable = true,
					lsp = true,
				},
			})
		end,
	},
}
