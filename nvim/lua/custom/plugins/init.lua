-- list of plugins that doesn't require much configuration
return {
  -- hjkl navigation with tmux
  { 'christoomey/vim-tmux-navigator' },

  -- Gbrowse - open stuff in github
  { 'tpope/vim-rhubarb',             event = "VeryLazy" },

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

  -- log inserting
  {
    "Goose97/timber.nvim",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("timber").setup({
        log_templates = {
          default = {
            go = [[log.Printf("==========> %log_target: %v\n", %log_target)]],
          }
        },
        highlight = {
          -- After a log statement is inserted
          on_insert = true,
          -- After a log target is added to a batch
          on_add_to_batch = true,
          -- After a log entry is shown/jumped to in the summary panel
          on_summary_show_entry = true,
          -- The duration of the flash highlight
          duration = 100,
        },
      })
    end
  }
}
