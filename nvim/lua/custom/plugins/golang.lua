return {
  "olexsmir/gopher.nvim",
  ft = "go",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  keys = {
    { "<localleader>gt",  "<cmd>GoTagAdd<cr>",   { desc = "Add Go tags" } },
    { "<localleader>gT",  "<cmd>GoTagRm<cr>",    { desc = "Add Go tags" } },
    { "<localleader>grn", "<cmd>GoTestAdd<cr>",  { desc = "Generate test for func under cursor" } },
    { "<localleader>gra", "<cmd>GoTestsAll<cr>", { desc = "Generate test for all funcs in file" } },
    { "<localleader>grf", "<cmd>GoTestsExp<cr>", { desc = "Generate test for exported funcs" } },

    { "<localleader>gmt", "<cmd>GoMod tidy<cr>", { desc = "go mod tidy" } },
  },
  opts = {},
}
