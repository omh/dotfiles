return {
  {
    "Mofiqul/vscode.nvim",
    priority = 5000,
    enabled = true,
    config = function()
      vim.o.background = 'dark'
      local c = require('vscode.colors').get_colors()

      local sign = vim.fn.sign_define
      sign("DapBreakpoint", { text = "", texthl = "DapBreakpoint", linehl = "", numhl = "" })
      sign("DapBreakpointCondition", { text = "●", texthl = "DapBreakpointCondition", linehl = "", numhl = "" })
      sign("DapLogPoint", { text = "◆", texthl = "DapLogPoint", linehl = "", numhl = "" })
      sign('DapStopped', { text = '󰐊', texthl = 'DapStopped', linehl = 'DapStoppedLine' })

      require('vscode').setup {
        italic_comments = false,

        group_overrides = {
          ['@type.builtin']                    = { fg = c.vscBlueGreen, bg = 'NONE' },
          ['@lsp.mod.format.go']               = { fg = c.vscLightBlue },
          LspReferenceText                     = { bg = c.vscDimHighlight },
          LspReferenceRead                     = { bg = c.vscDimHighlight },
          LspReferenceWrite                    = { link = 'PmenuSel' },
          LspInlayHint                         = { fg = "#969696", bg = '#262626' },

          CursorLine                           = { bg = '#282828' },
          -- CursorLineNr                = { link = 'CursorLine' },
          WinBar                               = { bold = false },
          DimText                              = { fg = c.vscPopupFront },

          StatusLine                           = { fg = c.vscSplitDark, bg = 'none', strikethrough = true },
          StatusLineNC                         = { fg = c.vscSplitDark, bg = 'none', strikethrough = true },

          Folded                               = { fg = c.vscYellow, bg = c.vscFoldBackground },

          -- DiffChange                           = { bg = c.vscPopupHighlightBlue },
          -- DiffText                             = { bg = c.vscDiffGreenLight },
          -- DiffDelete                           = { fg = c.vscSplitDark, bg = 'none' },
          -- GitSignsDeletePreview                = { bg = c.vscDiffRedLight },
          -- diffAdded                            = { fg = c.vscGreen, bg = 'none' },
          -- diffChanged                          = { fg = c.vscBlue, bg = 'none' },
          -- diffRemoved                          = { fg = c.vscRed, bg = 'none' },
          -- NeogitDiffAddHighlight               = { fg = 'none', bg = c.vscDiffGreenLight },
          -- NeogitDiffDeleteHighlight            = { fg = 'none', bg = c.vscDiffRedLight },

          DiffviewFilePanelSelected            = { fg = "#FFFFFF", bg = c.vscPopupHighlightBlue, bold = true },

          TabLine                              = { fg = c.vscGitIgnored, bg = 'NONE' },
          TabLineSel                           = { fg = '#FFFFFF', bg = 'NONE' },
          TabLineFill                          = { fg = c.vscSplitDark, bg = 'NONE' },

          GlanceWinBarFilename                 = { fg = '#FFFFFF' },
          GlanceWinBarFilepath                 = { fg = c.vscPopupFront },
          GlanceListFilepath                   = { link = 'GlanceWinBarFilepath' },
          GlanceBorderTop                      = { fg = c.vscBlue },
          GlancePreviewBorderBottom            = { fg = c.vscBlue },
          GlanceListBorderBottom               = { fg = c.vscBlue },

          LualineFolder                        = { fg = "#677489" },

          DapBreakpoint                        = { fg = c.vscPink },
          DapStopped                           = { bg = c.vscPopupHighlightBlue },
          DapStoppedLine                       = { bg = c.vscPopupHighlightBlue },

          SnacksIndent                         = { fg = "#424242" },
          SnacksIndentScope                    = { fg = '#787878' },
          SnacksIndentChunk                    = { fg = "#424242" },

          SnacksPickerBorder                   = { fg = c.vscSplitDark },
          SnacksPickerInputCursorLine          = { fg = 'NONE', bg = c.vscBack },
          SnacksPickerListCursorLine           = { fg = '#ffffff', bg = c.vscPopupHighlightBlue },
          SnacksPickerDir                      = { fg = c.vscGray },
          SnacksPickerCol                      = { fg = c.vscGray, bg = 'NONE' },
          SnacksPickerTitle                    = { fg = c.vscBlue },
          SnacksPickerInputSearch              = { fg = c.vscBlue },
          SnacksPickerInput                    = { fg = c.vscBlue },
          SnacksPickerMatch                    = { fg = c.vscBlue, bold = true },

          RainbowDelimiterRed                  = { fg = c.vscDarkYellow },
          RainbowDelimiterYellow               = { fg = c.vscPink },
          RainbowDelimiterBlue                 = { fg = c.vscBlue },
          RainbowDelimiterOrange               = { fg = c.vscDarkYellow },
          RainbowDelimiterGreen                = { fg = c.vscPink },
          RainbowDelimiterViolet               = { fg = c.vscBlue },
          RainbowDelimiterCyan                 = { fg = c.vscDarkYellow },

          MiniCursorword                       = { bg = c.vscDimHighlight },

          RenderMarkdownCode                   = { bg = c.vscBack },

          Directory                            = { fg = c.vscBlue, bg = 'none' },
          Float                                = { bg = 'none' },
          NormalFloat                          = { bg = 'none' },
          LspInfoBorder                        = { fg = c.vscSplitDark },
          FloatBorder                          = { fg = c.vscSplitDark },

          Pmenu                                = { fg = c.vscFront, bg = c.vscBack },
          PmenuSel                             = { fg = '#ffffff', bg = c.vscPopupHighlightBlue },
          BlinkCmpMenuBorder                   = { link = 'FloatBorder' },
          BlinkCmpDocBorder                    = { link = 'FloatBorder' },
          BlinkCmpSignatureHelpBorder          = { link = 'FloatBorder' },
          BlinkCmpSignatureHelpActiveParameter = { underline = true, sp = c.vscFront },
          BlinkCmpDocSeparator                 = { link = 'FloatBorder' },
          BlinkCmpKindCopilot                  = { link = 'BlinkCmpKindFunction' },

          GitSignsChange                       = { fg = c.vscBlue },

          MarkSignHL                           = { fg = c.vscYellow, italic = true },

          NavicIconsFile                       = { link = "Directory" },
          NavicIconsModule                     = { link = "@module" },
          NavicIconsNamespace                  = { link = "@module" },
          NavicIconsPackage                    = { link = "@module" },
          NavicIconsClass                      = { link = "Type" },
          NavicIconsMethod                     = { link = "Keyword" },
          NavicIconsProperty                   = { link = "@property" },
          NavicIconsField                      = { link = "@variable.member" },
          NavicIconsConstructor                = { link = "@constructor" },
          NavicIconsEnum                       = { link = "Type" },
          NavicIconsInterface                  = { link = "Type" },
          NavicIconsFunction                   = { link = "Keyword" },
          NavicIconsVariable                   = { link = "@variable" },
          NavicIconsConstant                   = { link = "Constant" },
          NavicIconsString                     = { link = "String" },
          NavicIconsNumber                     = { link = "Number" },
          NavicIconsBoolean                    = { link = "Boolean" },
          NavicIconsArray                      = { link = "Type" },
          NavicIconsObject                     = { link = "Type" },
          NavicIconsKey                        = { link = "Identifier" },
          NavicIconsNull                       = { link = "Type" },
          NavicIconsEnumMember                 = { link = "Constant" },
          NavicIconsStruct                     = { link = "Structure" },
          NavicIconsEvent                      = { link = "Structure" },
          NavicIconsOperator                   = { link = "Operator" },
          NavicIconsTypeParameter              = { link = "Type" },
          NavicText                            = { fg = c.vscFront },
          NavicSeparator                       = { link = "Comment" },

        },
      }
      vim.cmd("colorscheme vscode")
    end
  },
  {
    "wtfox/jellybeans.nvim",
    lazy = false,
    enabled = false,
    priority = 1000,
    config = function()
      require('jellybeans').setup {
        italics = true,
        on_highlights = function(hl, c)
          hl.WinBar                    = { bg = c.background }

          hl.GlanceWinBarFilename      = { fg = c.brandy, bg = c.background }
          hl.GlanceWinBarFilepath      = { fg = c.brandy, bg = c.background }
          hl.GlanceListFilepath        = { link = 'GlanceWinBarFilepath' }
          hl.GlanceBorderTop           = { fg = c.morning_glory }
          hl.GlancePreviewBorderBottom = { fg = c.morning_glory }
          hl.GlanceListBorderBottom    = { fg = c.morning_glory }

          hl.NavicIconsFile            = { link = "Directory" }
          hl.NavicIconsModule          = { link = "@module" }
          hl.NavicIconsNamespace       = { link = "@module" }
          hl.NavicIconsPackage         = { link = "@module" }
          hl.NavicIconsClass           = { link = "Type" }
          hl.NavicIconsMethod          = { link = "Keyword" }
          hl.NavicIconsProperty        = { link = "@property" }
          hl.NavicIconsField           = { link = "@variable.member" }
          hl.NavicIconsConstructor     = { link = "@constructor" }
          hl.NavicIconsEnum            = { link = "Type" }
          hl.NavicIconsInterface       = { link = "Type" }
          hl.NavicIconsFunction        = { link = "Keyword" }
          hl.NavicIconsVariable        = { link = "@variable" }
          hl.NavicIconsConstant        = { link = "Constant" }
          hl.NavicIconsString          = { link = "String" }
          hl.NavicIconsNumber          = { link = "Number" }
          hl.NavicIconsBoolean         = { link = "Boolean" }
          hl.NavicIconsArray           = { link = "Type" }
          hl.NavicIconsObject          = { link = "Type" }
          hl.NavicIconsKey             = { link = "Identifier" }
          hl.NavicIconsNull            = { link = "Type" }
          hl.NavicIconsEnumMember      = { link = "Constant" }
          hl.NavicIconsStruct          = { link = "Structure" }
          hl.NavicIconsEvent           = { link = "Structure" }
          hl.NavicIconsOperator        = { link = "Operator" }
          hl.NavicIconsTypeParameter   = { link = "Type" }
          hl.NavicText                 = { fg = c.foreground }
          hl.NavicSeparator            = { link = "Comment" }
        end,
      }
      vim.cmd [[colorscheme jellybeans]]
    end
  },
  -- kanagawa gray
  {
    'rebelot/kanagawa.nvim',
    priority = 4999,
    lazy = false,
    enabled = false,
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

          local sign = vim.fn.sign_define
          sign("DapBreakpoint", { text = "●", texthl = "DapBreakpoint", linehl = "", numhl = "" })
          sign("DapBreakpointCondition",
            { text = "●", texthl = "DapBreakpointCondition", linehl = "", numhl = "" })
          sign("DapLogPoint", { text = "◆", texthl = "DapLogPoint", linehl = "", numhl = "" })
          sign('DapStopped', { text = '󰐊', texthl = 'DapStopped', linehl = 'DapStoppedLine' })

          return {
            CursorLine                 = { bg = '#262626' },
            CursorLineNr               = { fg = theme.ui.fg, bg = '#262626', bold = false },

            TabLine                    = { fg = palette.fujiGray, bg = 'none' },
            TabLineHead                = { fg = palette.springViolet1, bg = 'none' },
            TabLineSel                 = { bg = 'none' },
            TabLineFill                = { fg = theme.ui.bg_p2, bg = 'NONE' },

            StatusLine                 = { fg = theme.ui.bg_p2, bg = theme.ui.bg, strikethrough = true },
            StatusLineNC               = { fg = theme.ui.bg_p2, bg = theme.ui.bg, strikethrough = true },

            NormalFloat                = { bg = 'none', fg = theme.ui.fg, blend = 10 },
            FloatBorder                = { bg = 'none', fg = palette.sumiInk6 },
            FloatTitle                 = { bg = 'none', fg = palette.springViolet1 },

            MsgArea                    = { bg = 'none', blend = 5 },

            Pmenu                      = { fg = theme.ui.shade0, bg = "NONE" }, -- add `blend = vim.o.pumblend` to enable transparency
            PmenuSel                   = { bg = theme.ui.pmenu.bg_sel },
            PmenuSbar                  = { bg = theme.ui.bg_m1 },
            PmenuThumb                 = { bg = theme.ui.bg_p2 },

            -- BlinkCmpMenu                = { bg = "NONE" },
            BlinkCmpMenuBorder         = { bg = "NONE", fg = palette.sumiInk6, bold = true },
            -- BlinkCmpMenuSelection       = { bg = '#363636', bold = true },
            -- BlinkCmpDoc                 = { bg = "NONE" },
            BlinkCmpDocBorder          = { bg = "NONE", fg = palette.sumiInk6, bold = true },
            BlinkCmpDocSeparator       = { bg = "NONE", fg = palette.sumiInk6, bold = true },

            FzfLuaCursorLine           = { bg = theme.ui.pmenu.bg_sel, bold = true },
            FzfLuaBorder               = { fg = theme.ui.bg_p2 },
            FzfLuaTitle                = { fg = palette.surimiOrange, bold = true },

            -- Plugins
            DapBreakpoint              = { fg = palette.waveRed },
            DapStopped                 = { fg = palette.surimiOrange, bg = '#2C3522' },
            DapStoppedLine             = { bg = '#2C3522' },

            SnacksPickerCursorLine     = { bg = theme.ui.bg },
            SnacksPickerListCursorLine = { bg = theme.ui.bg_p2, bold = true },

            SnacksIndent               = { fg = '#313131' },
            SnacksIndentScope          = { fg = '#313131' },
            SnacksIndentChunk          = { fg = '#313131' },
            LocalHighlight             = { underline = true, bold = true },

            -- quicker
            QuickFixLineNr             = { fg = theme.ui.fg, bg = 'NONE' },
            Delimiter                  = { fg = theme.ui.bg_p2, bg = 'NONE' }
          }
        end,
      }
      vim.cmd 'colorscheme kanagawa-wave'
    end,
  },

  {
    "vague2k/vague.nvim",
    priority = 4999,
    lazy = false,
    enabled = false,
    config = function()
      require("vague").setup({
        style = {
          -- strings = "none",
          -- comments = "none",
          -- keywords = "none",
          -- keyword_return = "none",
        },
        colors = {
          floatBorder = "#373737",
        },
      })
      vim.cmd "colorscheme vague"

      local conf = require("vague.config.internal").current
      local bg2 = "#212122"

      vim.api.nvim_set_hl(0, 'TabLine', { fg = conf.colors.comment, bg = "none" })
      vim.api.nvim_set_hl(0, 'TabLineFill', { fg = conf.colors.comment, bg = "none" })
      vim.api.nvim_set_hl(0, 'TabLineSel', { fg = conf.colors.fg, bg = "none" })

      vim.api.nvim_set_hl(0, 'StatusLine', { fg = conf.colors.floatBorder, bg = "none", strikethrough = true })
      vim.api.nvim_set_hl(0, 'StatusLineNC', { fg = conf.colors.floatBorder, bg = "none", strikethrough = true })
      vim.api.nvim_set_hl(0, 'WinBar', { fg = conf.colors.fg, bg = "none" })

      vim.api.nvim_set_hl(0, 'DiffAdd', { bg = "#2A3621" })
      vim.api.nvim_set_hl(0, 'DiffAdded', { bg = "#2A3621" })
      vim.api.nvim_set_hl(0, 'DiffChange', { bg = "#5B4830" })
      vim.api.nvim_set_hl(0, 'DiffText', { bg = "#5B4830" })
      vim.api.nvim_set_hl(0, 'DiffDelete', { bg = "#4F252F" })
      vim.api.nvim_set_hl(0, 'DiffRemoved', { bg = "#4F252F" })

      -- plugins
      vim.api.nvim_set_hl(0, 'DiffviewFilePanelSelected', { fg = conf.colors.warning, bold = true })

      -- DiffAdd          = { fg = c.plus },
      -- DiffChange       = { fg = c.delta },
      -- DiffDelete       = { fg = c.error },
      -- DiffText         = { fg = c.fg },
      -- DiffAdded        = { fg = c.plus },
      -- DiffRemoved      = { fg = c.error },
      -- DiffFile         = { fg = c.keyword },


      vim.api.nvim_set_hl(0, 'SnacksPicker', { bg = bg2 })
      vim.api.nvim_set_hl(0, 'SnacksPickerBorder', { fg = bg2, bg = bg2 })
      vim.api.nvim_set_hl(0, 'SnacksPickerList', { bg = bg2 })
      vim.api.nvim_set_hl(0, 'SnacksPickerPreview', { bg = bg2 })
      vim.api.nvim_set_hl(0, 'SnacksPickerPreviewBorder', { fg = conf.colors.line, bg = bg2 })
      vim.api.nvim_set_hl(0, 'SnacksPickerTitle', { fg = conf.colors.bg, bg = conf.colors.func, bold = true })
      vim.api.nvim_set_hl(0, 'SnacksPickerPrompt', { fg = conf.colors.warning, bg = bg2, bold = true })
      vim.api.nvim_set_hl(0, 'SnacksPickerTotals', { fg = conf.colors.comment, bg = bg2 })

      vim.api.nvim_set_hl(0, 'SnacksPickerMatch', { fg = conf.colors.warning, bg = "none" })
      vim.api.nvim_set_hl(0, 'SnacksPickerCursorLine', { bg = bg2 })
      vim.api.nvim_set_hl(0, 'SnacksPickerListCursorLine', { bg = conf.colors.line })
      vim.api.nvim_set_hl(0, 'SnacksPickerCol', { fg = conf.colors.operator, bg = "none" })
      vim.api.nvim_set_hl(0, 'SnacksPickerRow', { fg = conf.colors.operator, bg = "none" })

      vim.api.nvim_set_hl(0, 'SnacksIndent', { fg = "#282828", bg = "none" })
      vim.api.nvim_set_hl(0, 'SnacksIndentScope', { fg = "#303030", bg = "none" })
      vim.api.nvim_set_hl(0, 'LocalHighlight', { underline = true, bold = true })

      vim.api.nvim_set_hl(0, "NavicIconsFile", { default = true, bg = "none", fg = conf.colors.builtin })
      vim.api.nvim_set_hl(0, "NavicIconsModule", { default = true, bg = "none", fg = conf.colors.builtin })
      vim.api.nvim_set_hl(0, "NavicIconsNamespace", { default = true, bg = "none", fg = conf.colors.builtin })
      vim.api.nvim_set_hl(0, "NavicIconsPackage", { default = true, bg = "none", fg = conf.colors.builtin })
      vim.api.nvim_set_hl(0, "NavicIconsClass", { default = true, bg = "none", fg = conf.colors.builtin })
      vim.api.nvim_set_hl(0, "NavicIconsMethod", { default = true, bg = "none", fg = conf.colors.func })
      vim.api.nvim_set_hl(0, "NavicIconsProperty", { default = true, bg = "none", fg = conf.colors.property })
      vim.api.nvim_set_hl(0, "NavicIconsField", { default = true, bg = "none", fg = conf.colors.property })
      vim.api.nvim_set_hl(0, "NavicIconsConstructor", { default = true, bg = "none", fg = conf.colors.func })
      vim.api.nvim_set_hl(0, "NavicIconsEnum", { default = true, bg = "none", fg = conf.colors.func })
      vim.api.nvim_set_hl(0, "NavicIconsInterface", { default = true, bg = "none", fg = conf.colors.func })
      vim.api.nvim_set_hl(0, "NavicIconsFunction", { default = true, bg = "none", fg = conf.colors.func })
      vim.api.nvim_set_hl(0, "NavicIconsVariable", { default = true, bg = "none", fg = conf.colors.parameter })
      vim.api.nvim_set_hl(0, "NavicIconsConstant", { default = true, bg = "none", fg = conf.colors.constant })
      vim.api.nvim_set_hl(0, "NavicIconsString", { default = true, bg = "none", fg = conf.colors.string })
      vim.api.nvim_set_hl(0, "NavicIconsNumber", { default = true, bg = "none", fg = conf.colors.number })
      vim.api.nvim_set_hl(0, "NavicIconsBoolean", { default = true, bg = "none", fg = conf.colors.constant })
      vim.api.nvim_set_hl(0, "NavicIconsArray", { default = true, bg = "none", fg = conf.colors.keyword })
      vim.api.nvim_set_hl(0, "NavicIconsObject", { default = true, bg = "none", fg = conf.colors.keyword })
      vim.api.nvim_set_hl(0, "NavicIconsKey", { default = true, bg = "none", fg = conf.colors.keyword })
      vim.api.nvim_set_hl(0, "NavicIconsNull", { default = true, bg = "none", fg = conf.colors.constant })
      vim.api.nvim_set_hl(0, "NavicIconsEnumMember", { default = true, bg = "none", fg = conf.colors.property })
      vim.api.nvim_set_hl(0, "NavicIconsStruct", { default = true, bg = "none", fg = conf.colors.keyword })
      vim.api.nvim_set_hl(0, "NavicIconsEvent", { default = true, bg = "none", fg = conf.colors.keyword })
      vim.api.nvim_set_hl(0, "NavicIconsOperator", { default = true, bg = "none", fg = conf.colors.operator })
      vim.api.nvim_set_hl(0, "NavicIconsTypeParameter", { default = true, bg = "none", fg = conf.colors.parameter })
      vim.api.nvim_set_hl(0, "NavicText", { default = true, bg = "none", fg = conf.colors.fg })
      vim.api.nvim_set_hl(0, "NavicSeparator", { default = true, bg = "none", fg = conf.colors.fg })
    end
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
