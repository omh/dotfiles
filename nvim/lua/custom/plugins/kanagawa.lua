return {
  "rebelot/kanagawa.nvim",
  priority = 4999,
  enabled = false,
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
          CursorLine                  = { bg = '#292935' },
          CursorLineNr                = { bg = '#292935', bold = false },
          LineNr                      = { fg = theme.ui.bg_p2 },

          TabLine                     = { fg = palette.fujiGray, bg = 'NONE' },
          TabLineSel                  = { fg = palette.carpYellow, bg = 'NONE' },
          TabLineFill                 = { fg = theme.ui.bg_p2, bg = 'NONE', strikethrough = true },

          -- StatusLine                  = { fg = theme.ui.bg_p2, bg = 'NONE', strikethrough = true },
          -- StatusLineNC                = { fg = theme.ui.bg_p2, bg = 'NONE', strikethrough = true },

          Pmenu                       = { fg = theme.ui.shade0, bg = theme.ui.bg_p1, blend = 5 }, -- add `blend = vim.o.pumblend` to enable transparency
          PmenuSel                    = { fg = "NONE", bg = theme.ui.bg_p2 },
          PmenuSbar                   = { bg = theme.ui.bg_m1 },
          PmenuThumb                  = { bg = theme.ui.special },

          -- Transparent popups
          NormalFloat                 = { bg = "none" },
          FloatBorder                 = { bg = "none" },
          FloatTitle                  = { bg = "none" },

          -- Save an hlgroup with dark background and dimmed foreground
          -- so that you can use it where your still want darker windows.
          -- E.g.: autocmd TermOpen * setlocal winhighlight=Normal:NormalDark
          NormalDark                  = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },

          -- Popular plugins that open floats will link to NormalFloat by default;
          -- set their background accordingly if you wish to keep them dark and borderless
          LazyNormal                  = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
          MasonNormal                 = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },

          -- Plugins
          TreesitterContextSeparator  = { fg = theme.ui.bg_p1, bg = 'none', strikethrough = true },
          TreesitterContextLineNumber = { fg = theme.ui.bg_p2, bg = 'none' },
          IblIndent                   = { fg = theme.ui.bg_p1 },
          LocalHighlight              = { underline = true },

          CmpDoc                      = { bg = theme.ui.bg_p2 },
          CmpDocBorder                = { bg = theme.ui.bg_p2, fg = 'none' },
        }
      end,
    })
    vim.cmd("colorscheme kanagawa-wave")
  end
}
