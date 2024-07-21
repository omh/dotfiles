return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",
    "nvim-neotest/nvim-nio",

    "jfpedroza/neotest-elixir",
    "nvim-neotest/neotest-go",
  },
  keys = {
    { "<leader>rr", "<cmd>lua require('neotest').run.run_last()<CR>",             { desc = "Run previous test" } },
    { "<leader>rn", "<cmd>lua require('neotest').run.run()<CR>",                  { desc = "Run nearest test" } },
    { "<leader>rf", "<cmd>lua require('neotest').run.run(vim.fn.expand '%')<CR>", { desc = "Run current file" } },
    { "<leader>ro", "<cmd>lua require('neotest').output_panel.toggle()<CR>",      { desc = "Show output panel" } },
  },
  config = function()
    require("neotest").setup {
      adapters = {
        require "neotest-elixir",
        require "neotest-go",
      },
    }
    -- vim.keymap.set("n", "<leader>rr", function() require("neotest").run.run_last() end, {desc = "Run previous test"})
    -- vim.keymap.set("n", "<leader>rn", function() require("neotest").run.run() end, {desc = "Run nearest test"})
    -- vim.keymap.set("n", "<leader>rf", function() require("neotest").run.run(vim.fn.expand "%") end, {desc = "Run current file"})
    -- vim.keymap.set("n", "<leader>ra", function() require("neotest").output_panel.toggle() end, {desc = "Show output panel"})
  end,
}
