return {
  "NeogitOrg/neogit",
  keys = {
    { "<leader>gs", "<cmd>Neogit<cr>",                desc = "Neogit status" },
    { "<leader>dd", "<cmd>DiffviewOpen<cr>",          desc = "Open diff view against current branch" },
    { "<leader>dc", "<cmd>DiffviewClose<cr>",         desc = "Close diff view" },
    { "<leader>dm", "<cmd>DiffviewOpen main<cr>",     desc = "Open diff view against main" },
    { "<leader>dM", "<cmd>DiffviewOpen master<cr>",   desc = "Open diff view against master" },
    { "<leader>gl", "<cmd>DiffviewFileHistory %<CR>", { desc = "Git log for current file" } },
    { "<leader>gL", "<cmd>DiffviewFileHistory<CR>",   { desc = "Git log for repo" } },
  },
  dependencies = {
    "nvim-lua/plenary.nvim",  -- required
    "sindrets/diffview.nvim", -- optional - Diff integration

    -- Only one of these is needed, not both.
    "nvim-telescope/telescope.nvim", -- optional
  },
  config = function()
    local neogit = require("neogit")
    neogit.setup {
      graph_style = "unicode",
      highlight = {
        italic = false,
        bold = true,
        underline = true
      },
    }

    local diffview = require("diffview")
    diffview.setup {
      enhanced_diff_hl = true
    }
  end
}
