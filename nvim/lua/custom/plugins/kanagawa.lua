return {
  "rebelot/kanagawa.nvim",
  priority = 4999,
  config = function()
    require("kanagawa").setup({
      undercurl = true,
      compile = false,
      commentStyle = { italic = false },
      keywordStyle = { italic = false },
      statementStyle = { bold = false },
      theme = "wave",
      colors = {
        theme = {
          all = {
            ui = {
              bg_gutter = "none"
            }
          }
        }
      },
      overrides = function(colors)
        local theme = colors.theme
        local palette = colors.palette
        return {
          WinSeparator                = { fg = theme.ui.bg_p2 },
          CursorLine                  = { bg = theme.ui.bg_p2 },
          CursorLineNr                = { bg = theme.ui.bg_p2, bold = false },
          LineNr                      = { fg = theme.ui.bg_p2 },

          TabLine                     = { fg = palette.fujiGray, bg = 'NONE' },
          TabLineSel                  = { fg = palette.carpYellow, bg = 'NONE' },
          TabLineFill                 = { fg = theme.ui.bg_p2, bg = 'NONE', strikethrough = true },

          StatusLine                  = { fg = theme.ui.bg_p2, bg = 'NONE', strikethrough = true },
          StatusLineNC                = { fg = theme.ui.bg_p2, bg = 'NONE', strikethrough = true },

          Pmenu                       = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 }, -- add `blend = vim.o.pumblend` to enable transparency
          PmenuSel                    = { fg = "NONE", bg = theme.ui.bg_p2 },
          PmenuSbar                   = { bg = theme.ui.bg_m1 },
          PmenuThumb                  = { bg = theme.ui.special },

          -- PLugins
          TreesitterContextSeparator  = { fg = theme.ui.bg_p1, bg = 'none', strikethrough = true },
          TreesitterContextLineNumber = { fg = theme.ui.bg_p2, bg = 'none' },
          IblIndent                   = { fg = theme.ui.bg_p1 },
        }
      end,
    })
    vim.cmd("colorscheme kanagawa-wave")
  end
}
