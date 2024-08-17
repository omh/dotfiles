return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",
    "nvim-neotest/nvim-nio",

    "jfpedroza/neotest-elixir",
    "nvim-neotest/neotest-go",
    "nvim-extensions/nvim-ginkgo",
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
        require "nvim-ginkgo",
      },
    }
  end,
}
