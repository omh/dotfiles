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

  -- Useful utilities
  { 'tpope/vim-unimpaired' },

  -- readline keybindings for insert/command mode
  { 'tpope/vim-rsi',                 event = "VeryLazy" },

  -- Detect tabstop and shiftwidth automatically
  { 'NMAC427/guess-indent.nvim' },

  { "kylechui/nvim-surround",        event = "VeryLazy",   version = "*", },

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

  -- git worktrees
  { 'ThePrimeagen/git-worktree.nvim' },

  -- dashboard
  {
    'goolord/alpha-nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      -- require 'alpha'.setup(require 'alpha.themes.startify'.config)
      -- require 'alpha'.setup(require 'alpha.themes.dashboard'.config)
      require 'alpha'.setup(require 'alpha.themes.theta'.config)
    end
  },
}
