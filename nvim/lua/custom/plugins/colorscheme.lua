return {
  "catppuccin/nvim",
  priority = 5000,
  config = function()
    require("catppuccin").setup({
      term_colors = true,
      no_italic = true,
      transparent_background = false,
      color_overrides = {
        mocha = {
          base = "#1E1E1E",
          mantle = "#252526",
          crust = "#454545",

          surface0 = "#2E2E2E",
          surface1 = "#454545",
          surface2 = "#2f2f2f",

          overlay0 = "#cdd6f4", -- text
          overlay1 = "#FFFFFF",
          overlay2 = "#cdd6f4"  --text,
        },
      },

      custom_highlights = function(colors)
        local bg = "#1D1D1D"
        return {
          Comment                     = { fg = "#6a9955" },
          CursorLine                  = { bg = "#252526" },
          CursorLineNr                = { bg = "#252526" },
          Folded                      = { bg = "#181818" },
          WinSeparator                = { fg = colors.mantle },
          Visual                      = { bg = "#304E75", bold = true },

          NormalFloat                 = { bg = "NONE" },
          FloatBorder                 = { fg = "#999999", bg = "NONE" },

          CmpFloatBorder              = { bg = "#323232", fg = "#323232" },
          CmpNormal                   = { bg = "#323232" },

          IndentBlanklineChar         = { fg = colors.mantle },

          TreesitterContext           = { bg = colors.base },
          TreesitterContextLineNumber = { bg = colors.base },
          TreesitterContextBottom     = { sp = colors.surface1 },

          -- BufferCurrent          = { fg = colors.yellow, bg = colors.base },
          -- BufferCurrentMod       = { fg = colors.yellow, bg = colors.base },
          -- BufferCurrentIndex     = { fg = colors.blue, bg = colors.blue },
          -- BufferCurrentTarget    = { fg = colors.red, bg = colors.base },
          -- BufferCurrentSign      = { fg = colors.blue, bg = colors.base },

          BufferCurrent               = { fg = colors.flamingo, bg = colors.base },
          BufferCurrentMod            = { fg = colors.flamingo, bg = colors.base },
          BufferCurrentIndex          = { fg = colors.blue, bg = colors.base },
          BufferCurrentTarget         = { fg = colors.red, bg = colors.base },
          BufferCurrentSign           = { fg = colors.flamingo, bg = bg },

          BufferVisible               = { link = "BufferInactive" },
          BufferVisibleMod            = { link = "BufferInactiveMod" },
          BufferVisibleTarget         = { link = "BufferInactiveTarget" },
          BufferVisibleIndex          = { link = "BufferInactiveIndex" },
          BufferVisibleSign           = { link = "BufferInactiveSign" },

          BufferInactive              = { fg = "#999999", bg = bg },
          BufferInactiveMod           = { fg = "#999999", bg = bg, bold = true },
          BufferInactiveIndex         = { fg = colors.red, bg = bg },
          BufferInactiveTarget        = { fg = colors.red, bg = bg },
          BufferInactiveSign          = { fg = bg, bg = bg },

          BufferTabpageFill           = { bg = bg },
          BufferTabpages              = { fg = colors.text },

          TabLineFill                 = { fg = colors.surface1, bg = 'NONE', strikethrough = true },
          TabLine                     = { fg = "#999999", bg = 'NONE' },
          TabLineSel                  = { fg = colors.flamingo, bg = 'NONE' },

          TelescopeBorder             = { bg = "#323232", fg = "#323232" },
          TelescopeNormal             = { bg = "#323232" },
          TelescopePreviewNormal      = { bg = "#363637" },
          TelescopePreviewBorder      = { fg = "#363637", bg = "#363637" },
          TelescopePromptBorder       = { fg = "#363637", bg = "#363637" },

          -- TelescopeBorder        = { fg = "#454545", bg = "NONE" },
          -- TelescopePreviewBorder = { fg = "#454545", bg = "NONE" },
          -- TelescopePromptBorder  = { fg = "#454545", bg = "NONE" },

        }
      end,
      dim_inactive = {
        enabled = false,  -- dims the background color of inactive window
        shade = "light",
        percentage = 0.2, -- percentage of the shade to apply to the inactive window
      },
      integrations = {
        cmp = true,
        gitsigns = true,
        semantic_tokens = true,
        treesitter = true,
        treesitter_context = true,
        neotest = true,
        which_key = true,
        telescope = {
          enabled = true,
          style = 'nvchad'
        },
        indent_blankline = {
          enabled = true,
          scope_color = "overlay1", -- catppuccin color (eg. `lavender`) Default: text
          colored_indent_levels = false,
        },
      }
    })
    vim.cmd.colorscheme "catppuccin"
  end
}

--   {
--     "rockyzhang24/arctic.nvim",
--     branch = "v2",
--     dependencies = { "rktjmp/lush.nvim" },
--     config = function()
--       vim.cmd([[colorscheme arctic]])
--       local theme = require('lush_theme.arctic')
--       vim.api.nvim_set_hl(0, 'LineNr', { fg = "#444444" })
--       vim.api.nvim_set_hl(0, 'CursorLine', { bg = "#222222" })
--       vim.api.nvim_set_hl(0, 'CursorLineNr', { fg = "#FFFFFF" })
--       vim.api.nvim_set_hl(0, 'TreesitterContextLineNumber', { fg = theme.Normal.bg })
--     end
--   },
