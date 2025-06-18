return {
  {
    "karb94/neoscroll.nvim",
    event = "VeryLazy",
    opts = {},
  },
  -- messages, cmdline and the popupmenu
  {
    "folke/noice.nvim",
    opts = function(_, opts)
      table.insert(opts.routes, {
        filter = {
          event = "notify",
          find = "No information available",
        },
        opts = { skip = true },
      })
      local focused = true
      vim.api.nvim_create_autocmd("FocusGained", {
        callback = function()
          focused = true
        end,
      })
      vim.api.nvim_create_autocmd("FocusLost", {
        callback = function()
          focused = false
        end,
      })
      table.insert(opts.routes, 1, {
        filter = {
          cond = function()
            return not focused
          end,
        },
        view = "notify_send",
        opts = { stop = false },
      })

      opts.commands = {
        all = {
          -- options for the message history that you get with `:Noice`
          view = "split",
          opts = { enter = true, format = "details" },
          filter = {},
        },
      }

      -- vim.api.nvim_create_autocmd("FileType", {
      --   pattern = "markdown",
      --   callback = function(event)
      --     vim.schedule(function()
      --       require("noice.text.markdown").keys(event.buf)
      --     end)
      --   end,
      -- })

      opts.presets.lsp_doc_border = true
    end,
  },

  {
    "rcarriga/nvim-notify",
    event = "VeryLazy",
    opts = {
      timeout = 3000,
    },
  },

  {
    "snacks.nvim",
    opts = {
      scroll = { enabled = false },
    },
    keys = {},
  },

  -- buffer line
  {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    keys = {
      { "<Tab>", "<Cmd>BufferLineCycleNext<CR>", desc = "Next tab" },
      { "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", desc = "Prev tab" },
    },
    opts = {
      options = {
        mode = "tabs",
        -- separator_style = "slant",
        show_buffer_close_icons = false,
        show_close_icon = false,
      },
    },
    config = function(_, opts)
      require("bufferline").setup(opts)
      vim.api.nvim_set_hl(0, "BufferLineFill", { bg = "#000305" })
    end,
  },

  -- filename

  -- statusline
  {
    "nvim-lualine/lualine.nvim",
    opts = {
      colorscheme = "vesper",
    },
  },
  {
    "folke/snacks.nvim",
    opts = {
      dashboard = {
        preset = {
          header = [[
██╗  ██╗███████╗██╗     ██╗      ██████╗     ██╗    ██╗ ██████╗ ██████╗ ██╗     ██████╗     ██╗██╗
██║  ██║██╔════╝██║     ██║     ██╔═══██╗    ██║    ██║██╔═══██╗██╔══██╗██║     ██╔══██╗    ██║██║
███████║█████╗  ██║     ██║     ██║   ██║    ██║ █╗ ██║██║   ██║██████╔╝██║     ██║  ██║    ██║██║
██╔══██║██╔══╝  ██║     ██║     ██║   ██║    ██║███╗██║██║   ██║██╔══██╗██║     ██║  ██║    ╚═╝╚═╝
██║  ██║███████╗███████╗███████╗╚██████╔╝    ╚███╔███╔╝╚██████╔╝██║  ██║███████╗██████╔╝    ██╗██╗
╚═╝  ╚═╝╚══════╝╚══════╝╚══════╝ ╚═════╝      ╚══╝╚══╝  ╚═════╝ ╚═╝  ╚═╝╚══════╝╚═════╝     ╚═╝╚═╝
   ]],
        },
      },
    },
  },
  -- {
  --   "tamton-aquib/zone.nvim",
  --   config = function()
  --     require("zone").setup({
  --       style = "vanish",
  --       after = 10, -- idle timeout
  --       exclude_filetypes = { "telescopeprompt", "nvimtree", "neo-tree", "dashboard", "lazy" },
  --       -- more options to come later
  --
  --       treadmill = {
  --         direction = "left",
  --         headache = true,
  --         tick_time = 30, -- lower, the faster
  --         -- opts for treadmill style
  --       },
  --       epilepsy = {
  --         stage = "aura", -- "aura" or "ictal"
  --         tick_time = 100,
  --       },
  --       dvd = {
  --         text = { "line1", "line2", "line3", "etc" },
  --         tick_time = 100,
  --         -- opts for dvd style
  --       },
  --       -- etc
  --     })
  --   end,
  -- },
}
