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

  { "kylechui/nvim-surround",        event = "VeryLazy",   version = "*", },

  -- slightly nicer ui for inputs
  { 'stevearc/dressing.nvim',        event = "VeryLazy" },

  -- kill buffers without removing the window
  { 'qpkorr/vim-bufkill',            event = "VeryLazy" },

  -- git worktrees
  { 'ThePrimeagen/git-worktree.nvim' },
}
