return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 5000,
  config = function()
    require("catppuccin").setup({
      term_colors = true,
      no_italic = false,
      transparent_background = false,
      custom_highlights = function(u)
        local c = require('catppuccin.utils.colors')

        local sign = vim.fn.sign_define
        sign("DapBreakpoint", { text = "●", texthl = "DapBreakpoint", linehl = "", numhl = "" })
        sign("DapBreakpointCondition", { text = "●", texthl = "DapBreakpointCondition", linehl = "", numhl = "" })
        sign("DapLogPoint", { text = "◆", texthl = "DapLogPoint", linehl = "", numhl = "" })
        sign('DapStopped', { text = ' ', texthl = 'DapStopped', linehl = 'DapStoppedLine' })

        local dark_green = c.vary_color({ latte = c.lighten(u.green, 0.70, u.base) }, c.darken(u.green, 0.14, u.base))

        return {
          Visual                      = { bg = c.darken(u.blue, 0.4, u.base) },
          WinSeparator                = { fg = u.surface0, bg = 'NONE' },

          TabLineFill                 = { fg = u.surface0, bg = 'NONE', strikethrough = true },
          TabLine                     = { fg = u.overlay1, bg = 'NONE' },
          TabLineSel                  = { fg = u.text, bg = 'NONE' },

          DapBreakpoint               = { fg = u.red },
          DapStopped                  = { fg = u.green },
          DapStoppedLine              = { bg = dark_green },

          LocalHighlight              = { underline = true, sp = u.blue },

          TelescopePromptPrefix       = { fg = u.blue },
          TelescopeBorder             = { fg = u.surface0 },
          TelescopeTitle              = { fg = u.blue },
          TelescopeSelectionCaret     = { fg = u.blue, bg = u.blue },
          TelescopeSelection          = { bg = c.darken(u.blue, 0.2, u.base), fg = "#FFFFFF", bold = true },

          -- TreesitterContext also defined in plugin
          TreesitterContext           = { bg = 'none' },
          TreesitterContextLast       = { bg = 'none' },
          TreesitterContextBottom     = { bg = 'none', underline = false },
          TreesitterContextLineNumber = { bg = 'none' },
          TreesitterContextSeparator  = { fg = u.surface0, bg = 'none', strikethrough = true },
        }
      end,

      dim_inactive = {
        enabled = false,  -- dims the background color of inactive window
        shade = "light",
        percentage = 0.2, -- percentage of the shade to apply to the inactive window
      },
      integrations = {
        cmp = true,
        dap = true,
        dap_ui = true,
        diffview = true,
        fidget = true,
        gitsigns = true,
        grug_far = true,
        harpoon = true,
        indent_blankline = {
          enabled = true,
          scope_color = "", -- catppuccin color (eg. `lavender`) Default: text
          colored_indent_levels = false,
        },
        lsp_trouble = true,
        mason = true,
        neogit = true,
        neotest = true,
        noice = true,
        telescope = {
          enabled = true,
        },
        native_lsp = {
          enabled = true,
          virtual_text = {
            errors = { "italic" },
            hints = { "italic" },
            warnings = { "italic" },
            information = { "italic" },
          },
          underlines = {
            errors = { "underline" },
            hints = { "underline" },
            warnings = { "underline" },
            information = { "underline" },
          },
          inlay_hints = {
            background = true,
          },
        },
        which_key = true,
      }
    })
    vim.cmd.colorscheme "catppuccin-mocha"
  end
}
