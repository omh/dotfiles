return {
  "rose-pine/neovim",
  name = "rose-pine",
  priority = 1000,
  config = function()
    require("rose-pine").setup({
      variant = "auto",
      dark_variant = "main",
      styles = {
        italic = false,
      },
      highlight_groups = {
        TabLineFill                 = { fg = "subtle", bg = 'base', strikethrough = true },
        TabLine                     = { bg = 'base' },
        TabLineSel                  = { bg = 'base' },

        DiffDelete                  = { fg = 'rose', blend = 10 },
        DiffAdd                     = { blend = 10 },
        DiffRemove                  = { blend = 10 },
        DiffChange                  = { blend = 10, bg = "iris" },
        DiffText                    = { blend = 20, bg = "iris" },

        DiffviewFilePanelInsertions = { bg = 'NONE', fg = 'foam' },
        DiffviewFilePanelDeletions  = { bg = 'NONE', fg = 'rose', strikethrough = true },
        DiffviewStatusLine          = { bg = 'NONE', fg = 'rose', strikethrough = true },

        LocalHighlight              = { bold = true },

        IndentBlanklineChar         = { fg = "overlay" },

        CmpNormal                   = { bg = "surface" },

        TelescopeBorder             = { fg = "highlight_high", bg = "none" },
        TelescopeNormal             = { bg = "none" },
        TelescopePromptNormal       = { bg = "base" },
        TelescopeResultsNormal      = { fg = "subtle", bg = "none" },
        TelescopeSelection          = { fg = "love", bg = "overlay", bold = true },
        TelescopeSelectionCaret     = { fg = "rose", bg = "rose" },
      },
    })
    vim.cmd("colorscheme rose-pine")
  end
}
-- -- return {
-- --   "catppuccin/nvim",
-- --   priority = 5000,
-- --   enabled = false,
-- --   config = function()
-- --     require("catppuccin").setup({
-- --       term_colors = true,
-- --       no_italic = true,
-- --       transparent_background = false,
-- --       color_overrides = {
-- --         mocha = {
-- --           base = "#252526",
-- --           mantle = "#222222",
-- --           crust = "#1E1E1E",
-- --
-- --           surface0 = "#2E2E2E",
-- --           surface1 = "#454545",
-- --           surface2 = "#2f2f2f",
-- --
-- --           overlay0 = "#cdd6f4", -- text
-- --           overlay1 = "#FFFFFF",
-- --           overlay2 = "#cdd6f4"  --text,
-- --         },
-- --       },
-- --
-- --       custom_highlights = function(colors)
-- --         return {
-- --           Comment                 = { fg = "#6a9955" },
-- --           CursorLine              = { bg = colors.surface2 },
-- --           CursorLineNr            = { fg = colors.peach, bg = colors.surface2 },
-- --           Folded                  = { bg = "#181818" },
-- --           WinSeparator            = { fg = colors.surface2 },
-- --           Visual                  = { bg = "#304E75" },
-- --
-- --           FloatBorder             = { bg = colors.crust, fg = colors.crust },
-- --           FloatTitle              = { bg = colors.crust, fg = colors.blue },
-- --           NormalFloat             = { bg = colors.crust },
-- --
-- --           CmpFloatBorder          = { bg = colors.crust, fg = colors.crust },
-- --           CmpNormal               = { bg = colors.crust },
-- --           CmpItemAbbrMatchFuzzy   = { fg = colors.peach },
-- --           CmpItemAbbrMatch        = { fg = colors.blue },
-- --
-- --           IndentBlanklineChar     = { fg = colors.surface2 },
-- --
-- --           TabLineFill             = { fg = colors.surface1, bg = 'NONE', strikethrough = true },
-- --           TabLine                 = { fg = "#999999", bg = 'NONE' },
-- --           TabLineSel              = { fg = colors.flamingo, bg = 'NONE' },
-- --
-- --           -- plugins
-- --           LocalHighlight          = { underline = true, sp = colors.blue },
-- --           TroubleFoldIcon         = { bg = 'NONE', fg = colors.peach },
-- --
-- --           TelescopeNormal         = { bg = colors.mantle },
-- --           TelescopePromptNormal   = { bg = colors.mantle },
-- --           TelescopePromptPrefix   = { fg = colors.peach, bg = colors.mantle },
-- --           TelescopeBorder         = { fg = colors.mantle, bg = colors.mantle },
-- --           TelescopePromptBorder   = { fg = colors.mantle, bg = colors.mantle },
-- --           TelescopeMatching       = { fg = colors.peach },
-- --           TelescopeSelectionCaret = { fg = colors.peach },
-- --         }
-- --       end,
-- --       dim_inactive = {
-- --         enabled = false,  -- dims the background color of inactive window
-- --         shade = "light",
-- --         percentage = 0.2, -- percentage of the shade to apply to the inactive window
-- --       },
-- --       integrations = {
-- --         cmp = true,
-- --         gitsigns = true,
-- --         neotest = true,
-- --         noice = true,
-- --         which_key = true,
-- --         lsp_trouble = true,
-- --         telescope = {
-- --           enabled = true,
-- --           style = "nvchad"
-- --         },
-- --       }
-- --     })
-- --     vim.cmd.colorscheme "catppuccin"
-- --   end
-- -- }
