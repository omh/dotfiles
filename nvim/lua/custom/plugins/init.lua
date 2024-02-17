-- list of plugins that doesn't require much configuration
return {
  -- hjkl navigation with tmux
  { 'christoomey/vim-tmux-navigator' },

  -- doesn't play nice with quicklist preview :(
  -- { 'stefandtw/quickfix-reflector.vim', event = "VeryLazy" },

  -- Gbrowse - open stuff in github
  { 'tpope/vim-rhubarb',             event = "VeryLazy" },

  -- auto insert `end` in ruby/elixir, etc
  { 'tpope/vim-endwise',             event = "InsertEnter" },

  -- Detect tabstop and shiftwidth automatically
  { 'tpope/vim-sleuth' },

  -- Useful utilities
  { 'tpope/vim-unimpaired' },

  -- readline keybindings for insert/command mode
  { 'tpope/vim-rsi',                 event = "VeryLazy" },

  { "kylechui/nvim-surround",        event = "VeryLazy",   version = "*", },

  -- show marks in signcolumn
  { 'chentoast/marks.nvim',          event = "VeryLazy", },

  -- show/browse keybindings
  { 'folke/which-key.nvim', },

  -- buffers are per tab
  { "tiagovla/scope.nvim", },

  -- slightly nicer ui for inputs
  { 'stevearc/dressing.nvim',        event = "VeryLazy" },

  -- edit the quickfix list with :EnMasse
  { 'Olical/vim-enmasse',            event = "VeryLazy" },

  -- kill buffers without removing the window
  { 'qpkorr/vim-bufkill',            event = "VeryLazy" },
}
