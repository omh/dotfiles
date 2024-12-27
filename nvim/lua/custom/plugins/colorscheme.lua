return {
  -- kanagawa gray
  {
    'rebelot/kanagawa.nvim',
    priority = 4999,
    lazy = false,
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
          sign('DapStopped', { text = '󰐊', texthl = 'DapStopped', linehl = 'DapStoppedLine' })

          return {
            CursorLine                  = { bg = '#262626' },
            CursorLineNr                = { fg = theme.ui.fg, bg = '#262626', bold = false },

            TabLine                     = { fg = palette.fujiGray, bg = 'none' },
            TabLineHead                 = { fg = palette.springViolet1, bg = 'none' },
            TabLineSel                  = { bg = 'none' },
            TabLineFill                 = { fg = theme.ui.bg_p2, bg = 'NONE' },

            StatusLine                  = { fg = theme.ui.bg_p2, bg = theme.ui.bg, strikethrough = true },
            StatusLineNC                = { fg = theme.ui.bg_p2, bg = theme.ui.bg, strikethrough = true },

            NormalFloat                 = { bg = theme.ui.bg, fg = theme.ui.fg, blend = 10 },
            FloatBorder                 = { bg = 'none', fg = palette.sumiInk6 },
            FloatTitle                  = { bg = 'none', fg = palette.springViolet1 },

            MsgArea                     = { bg = 'none', blend = 5 },

            Pmenu                       = { fg = theme.ui.shade0, bg = "NONE" }, -- add `blend = vim.o.pumblend` to enable transparency
            PmenuSel                    = { fg = "NONE", bg = theme.ui.bg_p2 },
            PmenuSbar                   = { bg = theme.ui.bg_m1 },
            PmenuThumb                  = { bg = theme.ui.bg_p2 },

            BlinkCmpMenu                = { bg = "NONE" },
            BlinkCmpMenuBorder          = { fg = palette.sumiInk6, bold = true },
            BlinkCmpMenuSelection       = { bg = palette.waveBlue2 },
            BlinkCmpDoc                 = { bg = "NONE" },
            BlinkCmpDocBorder           = { fg = palette.sumiInk6, bold = true },
            BlinkCmpDocSeparator        = { fg = palette.sumiInk6, bold = true },

            -- Plugins
            DapBreakpoint               = { fg = palette.waveRed },
            DapStopped                  = { fg = palette.surimiOrange, bg = '#2C3522' },
            DapStoppedLine              = { bg = '#2C3522' },

            TelescopeSelection          = { bg = theme.ui.bg_p2, fg = 'none', bold = true, blend = 5 },
            TelescopeSelectionCaret     = { bg = theme.ui.bg_p2, fg = 'none', bold = true, blend = 5 },

            TreesitterContextSeparator  = { fg = theme.ui.bg_p2, bg = 'none', strikethrough = true },
            TreesitterContextLineNumber = { fg = theme.ui.bg_p2, bg = 'none' },

            SnacksIndent                = { fg = '#313131' },
            SnacksIndentScope           = { fg = '#313131' },
            SnacksIndentChunk           = { fg = '#313131' },
            LocalHighlight              = { underline = true },
            DiffviewFilePanelSelected   = { fg = '#FF0000', bg = '#FF0000', bold = true, force = true },

            FzfLuaFzfBorder             = { fg = palette.sumiInk6, bold = true },

            -- quicker
            QuickFixLineNr              = { fg = theme.ui.fg, bg = 'NONE' },
            Delimiter                   = { fg = theme.ui.bg_p2, bg = 'NONE' }
          }
        end,
      }
      vim.cmd 'colorscheme kanagawa-wave'
    end,
  },

  -- kanagawa original
  -- {
  --   'rebelot/kanagawa.nvim',
  --   priority = 4999,
  --   lazy = false,
  --   enabled = true,
  --   config = function()
  --     require('kanagawa').setup {
  --       undercurl = true,
  --       compile = false,
  --       commentStyle = { italic = false },
  --       keywordStyle = { italic = false },
  --       statementStyle = { bold = false },
  --       transparent = false,
  --       theme = 'wave',
  --       colors = {
  --         theme = {
  --           all = {
  --             ui = {
  --               bg_gutter = 'none',
  --             },
  --           },
  --         },
  --       },
  --       overrides = function(colors)
  --         local theme = colors.theme
  --         local palette = colors.palette
  --
  --         local makeDiagnosticColor = function(color)
  --           local c = require("kanagawa.lib.color")
  --           return { fg = color, bg = c(color):blend(theme.ui.bg, 0.95):to_hex() }
  --         end
  --
  --         local sign = vim.fn.sign_define
  --         sign("DapBreakpoint", { text = "●", texthl = "DapBreakpoint", linehl = "", numhl = "" })
  --         sign("DapBreakpointCondition", { text = "●", texthl = "DapBreakpointCondition", linehl = "", numhl = "" })
  --         sign("DapLogPoint", { text = "◆", texthl = "DapLogPoint", linehl = "", numhl = "" })
  --         sign('DapStopped', { text = '󰐊', texthl = 'DapStopped', linehl = 'DapStoppedLine' })
  --
  --         return {
  --           -- CursorLine                  = { bg = '#262626' },
  --           -- CursorLineNr                = { bg = '#262626', bold = false },
  --
  --           TabLine                     = { fg = palette.fujiGray, bg = 'none' },
  --           TabLineHead                 = { fg = palette.springViolet1, bg = 'none' },
  --           TabLineSel                  = { bold = true, bg = 'none' },
  --           TabLineFill                 = { fg = theme.ui.bg_p1, bg = 'NONE', strikethrough = true },
  --
  --           StatusLine                  = { fg = theme.ui.bg_p2, bg = theme.ui.bg, strikethrough = true },
  --           StatusLineNC                = { fg = theme.ui.bg_p2, bg = theme.ui.bg, strikethrough = true },
  --
  --           -- StatusLine                  = { fg = theme.ui.bg_p2, bg = '#282828' },
  --           -- StatusLineNC                = { fg = theme.ui.bg_p2, bg = '#282828' },
  --
  --           NormalFloat                 = { bg = "none" },
  --           FloatBorder                 = { bg = "none" },
  --           FloatTitle                  = { bg = "none" },
  --
  --           -- Save an hlgroup with dark background and dimmed foreground
  --           -- so that you can use it where your still want darker windows.
  --           -- E.g.: autocmd TermOpen * setlocal winhighlight=Normal:NormalDark
  --           NormalDark                  = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },
  --
  --           -- Popular plugins that open floats will link to NormalFloat by default;
  --           -- set their background accordingly if you wish to keep them dark and borderless
  --           LazyNormal                  = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
  --           MasonNormal                 = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
  --
  --           DiagnosticVirtualTextHint   = makeDiagnosticColor(theme.diag.hint),
  --           DiagnosticVirtualTextInfo   = makeDiagnosticColor(theme.diag.info),
  --           DiagnosticVirtualTextWarn   = makeDiagnosticColor(theme.diag.warning),
  --           DiagnosticVirtualTextError  = makeDiagnosticColor(theme.diag.error),
  --
  --           MsgArea                     = { bg = 'none', blend = 5 },
  --
  --           -- Plugins
  --           DapBreakpoint               = { fg = palette.waveRed },
  --           DapStopped                  = { fg = palette.surimiOrange, bg = '#2C3522' },
  --           DapStoppedLine              = { bg = '#2C3522' },
  --
  --           TelescopeSelection          = { bg = theme.ui.bg_p2, fg = 'none', bold = true, blend = 5 },
  --           TelescopeSelectionCaret     = { bg = theme.ui.bg_p2, fg = 'none', bold = true, blend = 5 },
  --
  --           TreesitterContextSeparator  = { fg = theme.ui.bg_p2, bg = 'none', strikethrough = true },
  --           TreesitterContextLineNumber = { fg = theme.ui.bg_p2, bg = 'none' },
  --           -- IblIndent                   = { fg = '#262626' },
  --           -- IblScope                    = { fg = theme.ui.bg_m1, bold = true },
  --           LocalHighlight              = { underline = true },
  --           DiffviewFilePanelSelected   = { fg = '#FF0000', bg = '#FF0000', bold = true, force = true },
  --
  --           -- quicker
  --           QuickFixLineNr              = { fg = theme.ui.fg, bg = 'NONE' },
  --           Delimiter                   = { fg = theme.ui.bg_p2, bg = 'NONE' }
  --         }
  --       end,
  --     }
  --     vim.cmd 'colorscheme kanagawa-wave'
  --   end,
  -- },

  -- {
  --   "catppuccin/nvim",
  --   name = "catppuccin",
  --   priority = 5000,
  --   enabled = false,
  --   config = function()
  --     require("catppuccin").setup({
  --       term_colors = true,
  --       no_italic = false,
  --       transparent_background = false,
  --       custom_highlights = function(u)
  --         local c = require('catppuccin.utils.colors')
  --
  --         local sign = vim.fn.sign_define
  --         sign("DapBreakpoint", { text = "●", texthl = "DapBreakpoint", linehl = "", numhl = "" })
  --         sign("DapBreakpointCondition", { text = "●", texthl = "DapBreakpointCondition", linehl = "", numhl = "" })
  --         sign("DapLogPoint", { text = "◆", texthl = "DapLogPoint", linehl = "", numhl = "" })
  --         sign('DapStopped', { text = ' ', texthl = 'DapStopped', linehl = 'DapStoppedLine' })
  --
  --         local dark_green = c.vary_color({ latte = c.lighten(u.green, 0.70, u.base) }, c.darken(u.green, 0.14, u.base))
  --
  --         return {
  --           Visual                      = { bg = c.darken(u.blue, 0.4, u.base) },
  --           WinSeparator                = { fg = u.surface0, bg = 'NONE' },
  --
  --           TabLineFill                 = { fg = u.surface0, bg = 'NONE', strikethrough = true },
  --           TabLine                     = { fg = u.overlay1, bg = 'NONE' },
  --           TabLineSel                  = { fg = u.text, bg = 'NONE' },
  --
  --           DapBreakpoint               = { fg = u.red },
  --           DapStopped                  = { fg = u.green },
  --           DapStoppedLine              = { bg = dark_green },
  --
  --           LocalHighlight              = { underline = true, sp = u.blue },
  --
  --           TelescopePromptPrefix       = { fg = u.blue },
  --           TelescopeBorder             = { fg = u.surface0 },
  --           TelescopeTitle              = { fg = u.blue },
  --           TelescopeSelectionCaret     = { fg = u.blue, bg = u.blue },
  --           TelescopeSelection          = { bg = c.darken(u.blue, 0.2, u.base), fg = "#FFFFFF", bold = true },
  --
  --           -- TreesitterContext also defined in plugin
  --           TreesitterContext           = { bg = 'none' },
  --           TreesitterContextLast       = { bg = 'none' },
  --           TreesitterContextBottom     = { bg = 'none', underline = false },
  --           TreesitterContextLineNumber = { bg = 'none' },
  --           TreesitterContextSeparator  = { fg = u.surface0, bg = 'none', strikethrough = true },
  --         }
  --       end,
  --
  --       dim_inactive = {
  --         enabled = false,  -- dims the background color of inactive window
  --         shade = "light",
  --         percentage = 0.2, -- percentage of the shade to apply to the inactive window
  --       },
  --       integrations = {
  --         cmp = true,
  --         dap = true,
  --         dap_ui = true,
  --         diffview = true,
  --         fidget = true,
  --         gitsigns = true,
  --         grug_far = true,
  --         harpoon = true,
  --         indent_blankline = {
  --           enabled = true,
  --           scope_color = "", -- catppuccin color (eg. `lavender`) Default: text
  --           colored_indent_levels = false,
  --         },
  --         lsp_trouble = true,
  --         mason = true,
  --         neogit = true,
  --         neotest = true,
  --         noice = true,
  --         telescope = {
  --           enabled = true,
  --         },
  --         native_lsp = {
  --           enabled = true,
  --           virtual_text = {
  --             errors = { "italic" },
  --             hints = { "italic" },
  --             warnings = { "italic" },
  --             information = { "italic" },
  --           },
  --           underlines = {
  --             errors = { "underline" },
  --             hints = { "underline" },
  --             warnings = { "underline" },
  --             information = { "underline" },
  --           },
  --           inlay_hints = {
  --             background = true,
  --           },
  --         },
  --         which_key = true,
  --       }
  --     })
  --     vim.cmd.colorscheme "catppuccin-mocha"
  --   end
  -- }
}
