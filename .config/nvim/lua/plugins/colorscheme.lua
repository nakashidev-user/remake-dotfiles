return {
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
