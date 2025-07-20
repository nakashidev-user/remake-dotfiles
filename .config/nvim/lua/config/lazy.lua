local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		vim.cmd("qa!") -- Exit Neovim safely
	end
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	spec = {
		{
			"LazyVim/LazyVim",
			import = "lazyvim.plugins",
			opts = {
				colorscheme = "solarized-osaka",
				news = {
					lazyvim = false,
					neovim = true,
				},
			},
		},
		{ import = "lazyvim.plugins.extras.linting.eslint" },
		{ import = "lazyvim.plugins.extras.formatting.prettier" },
		-- { import = "lazyvim.plugins.extras.ai.copilot" },
		-- { import = "lazyvim.plugins.extras.ai.copilot-chat" },
		{ import = "plugins" },
	},
	defaults = {
		lazy = true,
		version = "*",
	},
	concurrency = 50,
	install = { colorscheme = { "solarized-osaka", "tokyonight", "habamax" } },
	checker = {
		enabled = false,
		notify = false,
		frequency = 3600,
	},
	change_detection = {
		enabled = false,
		notify = false,
	},
	performance = {
		cache = {
			enabled = true,
		},
		reset_packpath = true,
		rtp = {
			reset = true,
			paths = {},
			disabled_plugins = {
				"gzip",
				"matchit",
				"matchparen",
				"netrwPlugin",
				"tarPlugin",
				"tohtml",
				"tutor",
				"zipPlugin",
				"getscript",
				"getscriptPlugin",
				"logipat",
				"rrhelper",
				"spellfile_plugin",
				"vimball",
				"vimballPlugin",
			},
		},
	},
})
