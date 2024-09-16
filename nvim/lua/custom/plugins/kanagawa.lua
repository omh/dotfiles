return {
  'rebelot/kanagawa.nvim',
  priority = 4999,
  enabled = true,
  config = function()
    require('kanagawa').setup {
      undercurl = true,
      compile = false,
      commentStyle = { italic = true },
      keywordStyle = { italic = true },
      statementStyle = { bold = true },
      transparent = false,
      theme = 'wave',
      colors = {
        palette = {
          sumiInk0 = '#313131',
          sumiInk1 = '#FF0000',
          sumiInk2 = '#777777', -- scrollbar pmenu
          sumiInk3 = '#1F1F1F', -- bg
          sumiInk4 = '#313131', -- indent lines
          sumiInk5 = '#414141', -- cursor line, winseprator
          sumiInk6 = '#626262', -- original numbers
        },
        theme = {
          all = {
            ui = {
              bg_gutter = 'none',
            },
          },
        },
      },
      overrides = function(colors)
        local theme = colors.theme
        local palette = colors.palette

        local sign = vim.fn.sign_define
        sign("DapBreakpoint", { text = "●", texthl = "DapBreakpoint", linehl = "", numhl = "" })
        sign("DapBreakpointCondition", { text = "●", texthl = "DapBreakpointCondition", linehl = "", numhl = "" })
        sign("DapLogPoint", { text = "◆", texthl = "DapLogPoint", linehl = "", numhl = "" })
        sign('DapStopped', { text = ' ', texthl = 'DapStopped', linehl = 'DapStoppedLine' })

        local dark_orange = '#655145'

        return {
          CursorLine                  = { bg = '#262626' },
          CursorLineNr                = { bg = '#262626', bold = false },

          TabLine                     = { fg = palette.fujiGray, bg = 'NONE' },
          TabLineSel                  = { fg = theme.ui.fg, bg = 'NONE' },
          TabLineFill                 = { fg = theme.ui.bg_p2, bg = 'NONE', strikethrough = true },

          StatusLine                  = { fg = theme.ui.bg_p2, bg = theme.ui.bg, strikethrough = true },
          StatusLineNC                = { fg = theme.ui.bg_p2, bg = theme.ui.bg, strikethrough = true },

          -- StatusLine                  = { fg = theme.ui.bg_p2, bg = '#282828' },
          -- StatusLineNC                = { fg = theme.ui.bg_p2, bg = '#282828' },

          NormalFloat                 = { bg = theme.ui.bg, fg = theme.ui.fg, blend = 10 },
          FloatBorder                 = { bg = 'none', fg = palette.sumiInk6 },
          FloatTitle                  = { bg = 'none', fg = palette.springViolet1 },
          PmenuSbar                   = { bg = theme.ui.bg_m1 },

          -- Plugins
          DapBreakpoint               = { fg = palette.waveRed },
          DapStopped                  = { fg = palette.springGreen },
          DapStoppedLine              = { bg = dark_orange },

          TreesitterContextSeparator  = { fg = theme.ui.bg_p2, bg = 'none', strikethrough = true },
          TreesitterContextLineNumber = { fg = theme.ui.bg_p2, bg = 'none' },
          IblIndent                   = { fg = theme.ui.bg_p2 },
          -- IblScope                    = { fg = theme.ui.bg_m1, bold = true },
          LocalHighlight              = { underline = true },
          DiffviewFilePanelSelected   = { fg = '#FF0000', bg = '#FF0000', bold = true, force = true },

          MsgArea                     = { bg = 'none', blend = 5 },
        }
      end,
    }
    vim.cmd 'colorscheme kanagawa-wave'
  end,
}
