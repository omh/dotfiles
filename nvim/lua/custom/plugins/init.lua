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

  -- search/replace
  {
    'MagicDuck/grug-far.nvim',
    event = "VeryLazy",
    config = function()
      require('grug-far').setup({
      });
    end
  },

  -- {
  --   'Ramilito/winbar.nvim',
  --   event = "VimEnter", -- Alternatively, BufReadPre if we don't care about the empty file when starting with 'nvim'
  --   dependencies = { "nvim-tree/nvim-web-devicons" },
  --   config = function()
  --     require("winbar").setup({
  --       -- your configuration comes here, for example:
  --       icons = true,
  --       diagnostics = true,
  --       buf_modified = true,
  --       buf_modified_symbol = "M",
  --       -- or use an icon
  --       -- buf_modified_symbol = "●"
  --       dim_inactive = {
  --         enabled = false,
  --         highlight = "WinbarNC",
  --         icons = true, -- whether to dim the icons
  --         name = true,  -- whether to dim the name
  --       }
  --     })
  --   end
  -- },

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
