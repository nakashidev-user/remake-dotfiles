return {
  {
    "folke/tokyonight.nvim",
    lazy = true,
    config = function()
      require("tokyonight").setup({
        -- use the night style
        style = "night",
        -- disable italic for functions
        styles = {
          functions = {},
        },
        -- Change the "hint" color to the "orange" color, and make the "error" color bright red
        on_colors = function(colors)
          colors.hint = colors.orange
          colors.error = "#ff0000"
          colors.bg = "#000305"
        end,
      })
    end,
  },
  {
    "projekt0n/github-nvim-theme",
    name = "github-theme",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      local override = require("github-theme.override")
      override.groups = {
        github_dark_high_contrast = {
          Normal = { bg = "#000305" }, -- default background color
        },
      }
    end,
  },
  {
    "navarasu/onedark.nvim",
    config = function()
      require("onedark").setup({
        style = "dark",
        highlights = {
          Normal = { bg = "#000305" },
        },
      })
    end,
  },
  {
    "datsfilipe/vesper.nvim",
    config = function()
      require("vesper").setup({
        transparent = false, -- Boolean: Sets the background to transparent
        italics = {
          comments = true, -- Boolean: Italicizes comments
          keywords = true, -- Boolean: Italicizes keywords
          functions = true, -- Boolean: Italicizes functions
          strings = true, -- Boolean: Italicizes strings
          variables = true, -- Boolean: Italicizes variables
        },
        overrides = {
          Normal = { bg = "#000305" },
        }, -- A dictionary of group names, can be a function returning a dictionary or a table.
      })
    end,
  },
  {
    "craftzdog/solarized-osaka.nvim",
    lazy = true,
    priority = 1000,
    opts = function()
      return {
        transparent = true,
      }
    end,
  },

  {
    "idr4n/github-monochrome.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      styles = {
        comments = { italic = false },
        conditionals = { bold = true },
        loops = { bold = true },
        variables = {},
        floats = "dark",
        sidebars = "light",
      },
      on_colors = function(c, s)
        -- applies to 'solarized' style only
        if s == "solarized" then
          c.bg = "#000305"
        end
      end,
    },
  },
  {
    "Mofiqul/vscode.nvim",
    lazy = false,
    config = function()
      local c = require("vscode.colors").get_colors()
      require("vscode").setup({
        -- Override colors (see ./lua/vscode/colors.lua)
        color_overrides = {
          vscBack = "#000305",
        },
        -- Override highlight groups (see ./lua/vscode/theme.lua)
        group_overrides = {
          -- ここでハイライトの設定ができる
          -- 例)
          -- Cursor = { bg = c.vscAccentBlue },
        },
      })
    end,
  },
  {
    "wheat-thin-wiens/rei.nvim",
  },
  -- color code highlights
  {
    "uga-rosa/ccc.nvim",
    lazy = false,
    config = function()
      -- Enable true color
      vim.opt.termguicolors = true

      local ccc = require("ccc")

      ccc.setup({
        -- Your preferred settings
        -- Example: enable highlighter
        highlighter = {
          auto_enable = true,
          lsp = true,
        },
      })
    end,
  },
}
