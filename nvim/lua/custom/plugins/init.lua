-- list of plugins that doesn't require much configuration
return {
  -- hjkl navigation with tmux
  { 'christoomey/vim-tmux-navigator' },

  -- Gbrowse - open stuff in github
  { 'tpope/vim-rhubarb',             event = "VeryLazy" },

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
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    ft = 'markdown',
    opts = {
      file_types = { 'markdown', 'copilot-chat' },
    },
  },

  -- {
  --   "OXY2DEV/markview.nvim",
  --   ft = "markdown", -- If you decide to lazy-load anyway
  --
  --   dependencies = {
  --     "nvim-treesitter/nvim-treesitter",
  --     "nvim-tree/nvim-web-devicons"
  --   },
  --   keys = {
  --     { "<leader>mv", "MarkView splitToggle" },
  --   },
  -- },

  {
    "fredrikaverpil/pr.nvim",
    lazy = true,
    version = "*",
    ---@type PR.Config
    opts = {
    },
    keys = {
      {
        "<leader>ggv",
        function()
          require("pr").view()
        end,
        desc = "View PR in browser",
      },
    },
    cmd = { "PRView" },
  },

  {
    "rachartier/tiny-inline-diagnostic.nvim",
    event = "LspAttach", -- Or `LspAttach`
    priority = 1000,     -- needs to be loaded in first
    config = function()
      require('tiny-inline-diagnostic').setup({
        throttle = 80,
        show_source = true,
        enable_on_insert = false,
      })
    end
  },

  {
    'preservim/nerdcommenter',
    keys = {
      { "<leader>ci", "<cmd>NERDCommenterInvert", mode = 'n', desc = "Invert comment" },
      { "<leader>ci", "<cmd>NERDCommenterInvert", mode = 'v', desc = "Invert comment" },
    },
    config = function()
      vim.g.NERDSpaceDelims = 1
      vim.g.NERDCreateDefaultMappings = 0
    end
  },

  {
    "chentoast/marks.nvim",
    event = "VeryLazy",
    opts = {},
  },

  -- base64 encode/decode
  {
    "ovk/endec.nvim",
    event = "VeryLazy",
    opts = {}
  },
}
