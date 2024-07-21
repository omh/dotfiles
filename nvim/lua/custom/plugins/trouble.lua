return {
  "folke/trouble.nvim",
  opts = {}, -- for default options, refer to the configuration section for custom setup.
  cmd = "Trouble",
  keys = {
    {
      "<leader>xx",
      "<cmd>Trouble diagnostics toggle<cr>",
      desc = "Diagnostics (Trouble)",
    },
    {
      "<leader>xX",
      "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
      desc = "Buffer Diagnostics (Trouble)",
    },
    {
      "<leader>cs",
      "<cmd>Trouble symbols toggle focus=false<cr>",
      desc = "Symbols (Trouble)",
    },
    {
      "<leader>cl",
      "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
      desc = "LSP Definitions / references / ... (Trouble)",
    },
    {
      "<leader>xL",
      "<cmd>Trouble loclist toggle<cr>",
      desc = "Location List (Trouble)",
    },
    {
      "<leader>xQ",
      "<cmd>Trouble qflist toggle<cr>",
      desc = "Quickfix List (Trouble)",
    },
  },
  config = function()
    require 'trouble'.setup {}
    vim.cmd [[highlight TroubleNormalNC guibg=none]]
    vim.cmd [[highlight TroubleNormal guibg=none]]
  end
}
-- return {
--   "folke/trouble.nvim",
--   -- dependencies = { "nvim-tree/nvim-web-devicons" },
--   -- opts = {
--   --   -- your configuration comes here
--   --   -- or leave it empty to use the default settings
--   --   -- refer to the configuration section below
--   --   auto_close = true,
--   -- },
--   -- cmd = "Trouble",
--   -- keys = {
--   --   { "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>",              { desc = "Toggle Trouble" } },
--   --   { "<leader>xd", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", { desc = "Toggle Trouble Document diagnostics" } },
--   --   { "<leader>xq", "<cmd>Trouble qflist toggle<cr>",                   { desc = "Toggle Trouble quickfix" } },
--   --   -- { "gr",         function() require("trouble").open("lsp_references") end,          { desc = "LSP references in Trouble" } },
--   -- },
--   -- config = function()
--   --   vim.keymap.set('n', ']d', function()
--   --     require("trouble").next({ skip_groups = true, jump = true });
--   --   end, { desc = 'Go to previous diagnostic message' })
--   --   vim.keymap.set('n', '[d', function()
--   --     require("trouble").previous({ skip_groups = true, jump = true });
--   --   end, { desc = 'Go to next diagnostic message' })
--   -- end
-- }
