-- list of plugins that doesn't require much configuration
return {
  -- hjkl navigation with tmux
  { 'christoomey/vim-tmux-navigator' },

  -- Gbrowse - open stuff in github
  { 'tpope/vim-rhubarb',             event = "VeryLazy" },

  -- auto insert `end` in ruby/elixir, etc
  { 'tpope/vim-endwise',             event = "InsertEnter" },

  -- Useful utilities
  { 'tpope/vim-unimpaired' },

  -- readline keybindings for insert/command mode
  { 'tpope/vim-rsi',                 event = "VeryLazy" },

  {
    "kylechui/nvim-surround",
    event = "VeryLazy",
    version = "*",
    config = function()
      require('nvim-surround').setup {}
    end
  },

  { 'SmiteshP/nvim-navic', event = "VeryLazy" },

  {
    "OXY2DEV/markview.nvim",
    ft = "markdown", -- If you decide to lazy-load anyway

    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons"
    },
    keys = {
      { "<leader>mv", "MarkView splitToggle" },
    },
  },

  {
    "fredrikaverpil/pr.nvim",
    lazy = true,
    version = "*",
    ---@type PR.Config
    opts = {
    },
    keys = {
      {
        "<leader>gv",
        function()
          require("pr").view()
        end,
        desc = "View PR in browser",
      },
    },
    cmd = { "PRView" },
  },

  {
    'folke/snacks.nvim',
    lazy = false,
    priority = 5001,
    opts = {
      quickfile = { enabled = false },
      gitbrowse = { enabled = false },
      dashboard = { enabled = false },
      input = { enabled = true },
      indent = {
        enabled = true,
        indent = {
          enabled = true, -- enable indent guides
          only_current = true,
          hl = 'SnacksIndent',
        },
        animate = {
          duration = {
            step = 20,   -- ms per step
            total = 100, -- maximum duration
          },
        },
        chunk = {
          enabled = true,
          only_current = true,
        },
      },
      notifier = {
        enabled = true,
      },
      statuscolumn = { enabled = false },
      words = { enabled = false },
    },
  },

  {
    "rachartier/tiny-inline-diagnostic.nvim",
    event = "LspAttach", -- Or `LspAttach`
    priority = 1000,     -- needs to be loaded in first
    config = function()
      require('tiny-inline-diagnostic').setup({
        throttle = 80,
      })
    end
  },
}
