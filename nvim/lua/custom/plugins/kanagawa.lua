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
      compile = false,
      commentStyle = { italic = false },
      keywordStyle = { italic = false },
      statementStyle = { bold = false },
      transparent = false,
      theme = 'wave',
      colors = {
        palette = {
          sumiInk0 = '#282828',
          sumiInk1 = '#FF0000',
          sumiInk2 = '#777777', -- scrollbar pmenu
          sumiInk3 = '#1F1F1F', -- bg
          sumiInk4 = '#262626', -- indent lines
          sumiInk5 = '#414141', -- cursor line, winseprator
          sumiInk6 = '#414141', -- original numbers
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
          -- WinSeparator                = { fg = '#262626' },
          CursorLine                  = { bg = '#242424' },
          CursorLineNr                = { bg = '#242424', bold = false },

          -- CursorLine = { bg = '#292935' },
          -- CursorLineNr = { bg = '#292935', bold = false },
          -- LineNr = { fg = theme.ui.bg_p2 },

          TabLine                     = { fg = palette.fujiGray, bg = 'NONE' },
          TabLineSel                  = { fg = theme.ui.fg, bg = 'NONE' },
          TabLineFill                 = { fg = theme.ui.bg_m3, bg = 'NONE', strikethrough = true },

          StatusLine                  = { fg = theme.ui.bg_p2, bg = theme.ui.bg_m3 },
          StatusLineNC                = { fg = theme.ui.bg_p2, bg = theme.ui.bg_m3 },

          Pmenu                       = { fg = theme.ui.shade0, bg = theme.ui.bg_p1, blend = 5 }, -- add `blend = vim.o.pumblend` to enable transparency
          PmenuSel                    = { fg = 'NONE', bg = theme.ui.bg_p2 },
          PmenuSbar                   = { bg = theme.ui.bg_m1 },
          PmenuThumb                  = { bg = theme.ui.bg_p1 },

          -- Transparent popups
          NormalFloat                 = { bg = theme.ui.bg_p1 },
          FloatBorder                 = { bg = theme.ui.bg_p1 },
          FloatTitle                  = { bg = theme.ui.bg_p1 },

          -- Save an hlgroup with dark background and dimmed foreground
          -- so that you can use it where your still want darker windows.
          -- E.g.: autocmd TermOpen * setlocal winhighlight=Normal:NormalDark
          NormalDark                  = { fg = theme.ui.fg_dim, bg = 'none' },

          -- Popular plugins that open floats will link to NormalFloat by default;
          -- set their background accordingly if you wish to keep them dark and borderless
          LazyNormal                  = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
          MasonNormal                 = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },

          -- Plugins
          TreesitterContextSeparator  = { fg = theme.ui.bg_p1, bg = 'none', strikethrough = true },
          TreesitterContextLineNumber = { fg = theme.ui.bg_p2, bg = 'none' },
          IblIndent                   = { fg = theme.ui.bg_p1 },
          LocalHighlight              = { underline = true },

          CmpDoc                      = { bg = theme.ui.bg_p2, blend = 5 },
          CmpDocBorder                = { bg = theme.ui.bg_p2, fg = 'none' },

          MsgArea                     = { bg = theme.ui.bg_p1, strikethrough = false, blend = 5 },
        }
      end,
    }
    vim.cmd 'colorscheme kanagawa-wave'
  end,
}
