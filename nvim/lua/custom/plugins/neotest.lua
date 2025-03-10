return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",
    "nvim-neotest/nvim-nio",

    "jfpedroza/neotest-elixir",
    -- "nvim-neotest/neotest-go",
    { "fredrikaverpil/neotest-golang", version = "*" },
    -- "nvim-extensions/nvim-ginkgo",
  },
  keys = {
    { "<leader>rr", "<cmd>lua require('neotest').run.run_last()<CR>",                desc = "Run previous test" },
    { "<leader>ra", "<cmd>lua require('neotest').run.attach()<CR>",                  desc = "Attach to running test" },
    { "<leader>rn", "<cmd>lua require('neotest').run.run()<CR>",                     desc = "Run nearest test" },
    { "<leader>rf", "<cmd>lua require('neotest').run.run(vim.fn.expand '%')<CR>",    desc = "Run current file" },
    { "<leader>ru", "<cmd>lua require('neotest').output.open({ enter = true })<CR>", desc = "Floating output window" },
    { "<leader>ro", "<cmd>lua require('neotest').output_panel.toggle()<CR>",         desc = "Show output panel" },
    { "<leader>rc", "<cmd>lua require('neotest').output_panel.clear()<CR>",          desc = "Clear output panel" },
  },
  config = function()
    local go_cfg = {
      -- go_test_args = { "" },
      -- runner = "gotestsum"
    }

    require("neotest").setup {
      discovery = {
        -- Drastically improve performance in ginormous projects by
        -- only AST-parsing the currently opened buffer.
        enabled = false,
        -- Number of workers to parse files concurrently.
        -- A value of 0 automatically assigns number based on CPU.
        -- Set to 1 if experiencing lag.
        concurrent = 2,
      },
      quickfix = {
        enabled = false,
        open = false
      },
      floating = {
        border = "rounded",
        max_height = 0.6,
        max_width = 0.9,
        options = {}
      },
      adapters = {
        -- require "neotest-elixir",
        -- require "neotest-go",
        require("neotest-golang")(go_cfg),
        -- require "nvim-ginkgo",
      },
    }
  end,
}
