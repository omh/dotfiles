-- @TODO:
-- diagnostic/error popups have same bg has bg
-- tabs should be white/black with the filename highlighted instead
return {
  'rebelot/kanagawa.nvim',
  priority = 4999,
  enabled = true,
  config = function()
    require('kanagawa').setup {
      undercurl = true,
      compile = true,
      commentStyle = { italic = false },
      keywordStyle = { italic = false },
      statementStyle = { bold = false },
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
        return {
          CursorLine                  = { bg = '#262626' },
          CursorLineNr                = { bg = '#262626', bold = false },

          TabLine                     = { fg = palette.fujiGray, bg = 'NONE' },
          TabLineSel                  = { fg = theme.ui.fg, bg = 'NONE' },
          TabLineFill                 = { fg = theme.ui.bg_p2, bg = 'NONE', strikethrough = true },

          StatusLine                  = { fg = theme.ui.bg_p2, bg = '#282828' },
          StatusLineNC                = { fg = theme.ui.bg_p2, bg = '#282828' },

          NormalFloat                 = { bg = theme.ui.bg, fg = theme.ui.fg, blend = 10 },
          FloatBorder                 = { bg = 'none', fg = palette.sumiInk6 },
          FloatTitle                  = { bg = 'none', fg = palette.springViolet1 },
          PmenuSbar                   = { bg = theme.ui.bg_m1 },

          -- Plugins
          TreesitterContextSeparator  = { fg = theme.ui.bg_p2, bg = 'none', strikethrough = true },
          TreesitterContextLineNumber = { fg = theme.ui.bg_p2, bg = 'none' },
          IblIndent                   = { fg = theme.ui.bg_p1 },
          LocalHighlight              = { underline = true },

          MsgArea                     = { bg = 'none', blend = 5 },
        }
      end,
    }
    vim.cmd 'colorscheme kanagawa-wave'
  end,
}
