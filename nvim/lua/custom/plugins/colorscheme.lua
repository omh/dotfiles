return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 5000,
  config = function()
    require("catppuccin").setup({
      term_colors = true,
      no_italic = true,
      transparent_background = false,
      -- dark gray
      -- color_overrides = {
      --   mocha = {
      --     base = "#252526",
      --     mantle = "#222222",
      --     crust = "#1E1E1E",
      --
      --     surface0 = "#2E2E2E",
      --     surface1 = "#323232",
      --     surface2 = "#2f2f2f",
      --
      --     overlay0 = "#cdd6f4", -- text
      --     overlay1 = "#FFFFFF",
      --     overlay2 = "#cdd6f4"  --text,
      --   },
      -- },

      custom_highlights = function(u)
        local c = require('catppuccin.utils.colors')
        return {
          CursorLineNr            = {
            bg = c.vary_color({ latte = c.lighten(u.mantle, 0.70, u.base) }, c.darken(u.surface0, 0.64, u.base)),
          },
          TabLineFill             = { fg = u.surface0, bg = 'NONE', strikethrough = true },
          WinSeparator            = { fg = u.surface0, bg = 'NONE' },
          TabLine                 = { fg = u.overlay1, bg = 'NONE' },
          TabLineSel              = { fg = u.text, bg = 'NONE' },
          -- Visual                      = { bg = c.darken(u.blue, 0.4, u.base) },
          -- String                      = { bg = c.darken(u.green, 0.1, u.base), fg = u.green },

          CmpItemAbbr             = { fg = u.text },
          CmpItemAbbrMatch        = { fg = u.red },

          CopilotSuggestion       = { fg = u.overlay0 },
          IndentBlanklineChar     = { fg = u.surface0 },
          LocalHighlight          = { underline = true, sp = u.blue },
          TroubleFoldIcon         = { bg = 'NONE', fg = u.peach },
          TroubleNormal           = { bg = 'NONE' },
          TroubleNormalNC         = { bg = 'NONE' },

          -- TelescopeNormal         = { bg = u.mantle },
          -- TelescopePreview        = { bg = u.peach },
          -- TelescopePromptNormal   = { bg = u.mantle },
          -- TelescopePromptPrefix   = { fg = u.lavender, bg = u.mantle },
          -- TelescopePromptBorder   = { fg = u.mantle, bg = u.mantle },
          -- TelescopeBorder         = { fg = u.mantle, bg = u.mantle },
          -- TelescopeSelectionCaret = { fg = u.lavender, bg = u.lavender },

          TelescopePromptPrefix   = { fg = u.blue },
          TelescopeBorder         = { fg = u.surface0 },
          TelescopeTitle          = { fg = u.blue },
          TelescopeSelectionCaret = { fg = u.blue, bg = u.blue },
          TelescopeSelection      = { bg = c.darken(u.blue, 0.2, u.base), fg = "#FFFFFF", bold = true },

          -- TreesitterContext defined in plugin
        }
      end,

      -- custom_highlights = function(colors)
      -- return {
      --   Comment                 = { fg = "#6a9955" },
      --   CursorLine              = { bg = colors.surface2, blend = 10 },
      --   CursorLineNr            = { fg = colors.peach, bg = colors.surface2 },
      --   Folded                  = { bg = "#181818" },
      --   WinSeparator            = { fg = colors.surface2 },
      --   Visual                  = { bg = "#304E75" },
      --
      --   FloatBorder             = { bg = colors.crust, fg = colors.crust },
      --   FloatTitle              = { bg = colors.crust, fg = colors.blue },
      --   NormalFloat             = { bg = colors.crust },
      --
      --   CmpFloatBorder          = { bg = colors.surface1, fg = colors.surface1 },
      --   CmpNormal               = { bg = colors.surface1 },
      --   CmpItemAbbrMatchFuzzy   = { fg = colors.peach },
      --   CmpItemAbbrMatch        = { fg = colors.blue },
      --
      --   IndentBlanklineChar     = { fg = colors.surface2 },
      --
      --   TabLineFill             = { fg = colors.surface1, bg = 'NONE', strikethrough = true },
      --   TabLine                 = { fg = "#999999", bg = 'NONE' },
      --   TabLineSel              = { fg = colors.flamingo, bg = 'NONE' },
      --
      --   -- plugins
      --   LocalHighlight          = { underline = true, sp = colors.blue },
      --   TroubleFoldIcon         = { bg = 'NONE', fg = colors.peach },
      --
      --   TelescopeNormal         = { bg = colors.surface1 },
      --   TelescopePromptNormal   = { bg = colors.surface1 },
      --   TelescopePromptPrefix   = { fg = colors.peach, bg = colors.surface1 },
      --   TelescopeBorder         = { fg = colors.surface1, bg = colors.surface1 },
      --   TelescopePromptBorder   = { fg = colors.surface1, bg = colors.surface1 },
      --   TelescopeMatching       = { fg = colors.peach },
      --   TelescopeSelectionCaret = { fg = colors.peach, bg = colors.peach },
      -- }
      -- end,
      dim_inactive = {
        enabled = false,  -- dims the background color of inactive window
        shade = "light",
        percentage = 0.2, -- percentage of the shade to apply to the inactive window
      },
      integrations = {
        cmp = true,
        fidget = true,
        gitsigns = true,
        harpoon = true,
        headlines = true,
        -- lsp_trouble = true,
        mason = true,
        neogit = true,
        noice = true,
        neotest = true,
        telescope = {
          enabled = true,
          -- style = "nvchad"
        },
        native_lsp = {
          enabled = true,
          virtual_text = {
            errors = { "italic" },
            hints = { "italic" },
            warnings = { "italic" },
            information = { "italic" },
          },
          underlines = {
            errors = { "underline" },
            hints = { "underline" },
            warnings = { "underline" },
            information = { "underline" },
          },
          inlay_hints = {
            background = true,
          },
        },
        which_key = true,
      }
    })
    vim.cmd.colorscheme "catppuccin-mocha"
  end
}

-- return {
--   "rose-pine/neovim",
--   name = "rose-pine",
--   priority = 1000,
--   config = function()
--     require("rose-pine").setup({
--       variant = "auto",
--       dark_variant = "main",
--       styles = {
--         italic = false,
--       },
--       highlight_groups = {
--         CursorLine                  = { blend = 30 },
--         CursorLineNr                = { bg = 'overlay', blend = 30, bold = false },
--         DiffDelete                  = { fg = 'rose', blend = 10 },
--         DiffAdd                     = { blend = 10 },
--         DiffRemove                  = { blend = 10 },
--         DiffChange                  = { blend = 10, bg = "iris" },
--         DiffText                    = { blend = 20, bg = "iris" },
--         Search                      = { fg = "text", bg = "highlight_high", blend = 80 },
--         TabLineFill                 = { fg = "subtle", bg = 'base', strikethrough = true },
--         TabLine                     = { bg = 'base' },
--         TabLineSel                  = { bg = 'base' },
--
--         -- plugins
--         DiffviewFilePanelInsertions = { bg = 'NONE', fg = 'foam' },
--         DiffviewFilePanelDeletions  = { bg = 'NONE', fg = 'rose', strikethrough = true },
--         DiffviewStatusLine          = { bg = 'NONE', fg = 'rose', strikethrough = true },
--
--         LocalHighlight              = { fg = "text", bg = "highlight_med" },
--
--         IndentBlanklineChar         = { fg = "overlay" },
--
--         CmpNormal                   = { bg = "overlay" },
--
--         -- transparent telescope
--         -- TelescopeBorder             = { fg = "highlight_high", bg = "none" },
--         -- TelescopeNormal             = { bg = "none" },
--         -- TelescopePromptNormal       = { bg = "base" },
--         -- TelescopeResultsNormal      = { fg = "subtle", bg = "none" },
--         -- TelescopeSelection          = { fg = "text", bg = "overlay", bold = true },
--         -- TelescopeSelectionCaret     = { fg = "rose", bg = "rose" },
--
--         -- no border telescope
--         TelescopeBorder             = { fg = "overlay", bg = "overlay" },
--         TelescopeNormal             = { fg = "subtle", bg = "overlay" },
--         TelescopeSelection          = { fg = "text", bg = "highlight_med", bold = true },
--         TelescopeSelectionCaret     = { fg = "love", bg = "love", bold = true },
--         TelescopeMultiSelection     = { fg = "text", bg = "highlight_high" },
--
--         TelescopeTitle              = { fg = "base", bg = "love" },
--         TelescopePromptTitle        = { fg = "base", bg = "pine" },
--         TelescopePreviewTitle       = { fg = "base", bg = "iris" },
--
--         TelescopePromptNormal       = { fg = "text", bg = "overlay" },
--         TelescopePromptBorder       = { fg = "overlay", bg = "overlay" },
--       },
--     })
--     vim.cmd("colorscheme rose-pine")
--   end
-- }
