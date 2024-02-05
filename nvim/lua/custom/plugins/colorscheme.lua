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
          base = "#232323",
          mantle = "#282829",
          crust = "#313132",

          surface0 = "#2E2E2E",
          surface1 = "#454545",
          surface2 = "#2f2f2f",

          overlay0 = "#cdd6f4", -- text
          overlay1 = "#FFFFFF",
          overlay2 = "#cdd6f4"  --text,
        },
      },

      custom_highlights = function(colors)
        return {
          Comment             = { fg = "#6a9955" },
          CursorLine          = { bg = colors.mantle },
          CursorLineNr        = { fg = colors.peach, bg = colors.mantle },
          Folded              = { bg = "#181818" },
          WinSeparator        = { fg = colors.mantle },
          Visual              = { bg = "#304E75" },

          CmpFloatBorder      = { bg = colors.crust, fg = colors.crust },
          CmpNormal           = { bg = colors.crust },

          IndentBlanklineChar = { fg = colors.mantle },

          LocalHighlight      = { underline = true, sp = colors.blue },

          TabLineFill         = { fg = colors.surface1, bg = 'NONE', strikethrough = true },
          TabLine             = { fg = "#999999", bg = 'NONE' },
          TabLineSel          = { fg = colors.flamingo, bg = 'NONE' },

          -- TelescopePreviewNormal      = { bg = "#363637" },
          -- TelescopePreviewBorder      = { fg = "#363637", bg = "#363637" },
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
        neotest = true,
        noice = true,
        which_key = true,
        lsp_trouble = true,
        telescope = {
          enabled = true,
        },
      }
    })
    vim.cmd.colorscheme "catppuccin"
  end
}
