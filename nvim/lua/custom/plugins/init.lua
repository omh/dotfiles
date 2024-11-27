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

  -- slightly nicer ui for inputs
  { 'stevearc/dressing.nvim', opt = {},          event = "VeryLazy" },

  -- kill buffers without removing the window
  { 'qpkorr/vim-bufkill',     event = "VeryLazy" },

  { 'SmiteshP/nvim-navic',    event = "VeryLazy" },

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
}
