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
          Visual                      = { bg = "#304E75" },

          NormalFloat                 = { bg = colors.surface0 },
          FloatBorder                 = { fg = "#999999" },

          CmpFloatBorder              = { bg = "#323232", fg = "#323232" },
          CmpNormal                   = { bg = "#323232" },

          IndentBlanklineChar         = { fg = colors.mantle },

          TreesitterContext           = { bg = "#212121" },
          TreesitterContextLineNumber = { bg = "#212121" },
          TreesitterContextBottom     = { sp = colors.mantle },

          TabLineFill                 = { fg = colors.surface1, bg = 'NONE', strikethrough = true },
          TabLine                     = { fg = "#999999", bg = 'NONE' },
          TabLineSel                  = { fg = colors.flamingo, bg = 'NONE' },

          TelescopePreviewNormal      = { bg = "#363637" },
          TelescopePreviewBorder      = { fg = "#363637", bg = "#363637" },
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
