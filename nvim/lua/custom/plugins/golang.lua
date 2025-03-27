-- return {
--   "ray-x/go.nvim",
--   -- "olexsmir/gopher.nvim",
--   ft = "go",
--   dependencies = {
--     "nvim-lua/plenary.nvim",
--     "nvim-treesitter/nvim-treesitter",
--   },
--   keys = {
--     { "<localleader>gt",  "<cmd>GoTagAdd<cr>",   { desc = "Add Go tags" } },
--     { "<localleader>gT",  "<cmd>GoTagRm<cr>",    { desc = "Add Go tags" } },
--     { "<localleader>grn", "<cmd>GoTestAdd<cr>",  { desc = "Generate test for func under cursor" } },
--     { "<localleader>gra", "<cmd>GoTestsAll<cr>", { desc = "Generate test for all funcs in file" } },
--     { "<localleader>grf", "<cmd>GoTestsExp<cr>", { desc = "Generate test for exported funcs" } },
--
--     { "<localleader>gmt", "<cmd>GoMod tidy<cr>", { desc = "go mod tidy" } },
--   },
--   opts = {},
--
--   setup = function()
--     require('go').setup({
--       notify = true,
--       maintain_cursor_pos = true,
--       linter = 'golangci-lint',
--     })
--     require('lspconfig').gopls.setup({})
--   end
-- }
return {
  "ray-x/go.nvim",
  enabled = true,
  event = { "CmdlineEnter" },
  ft = { "go", 'gomod' },
  build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
  dependencies = {                                        -- optional packages
    "ray-x/guihua.lua",
    "neovim/nvim-lspconfig",
    "nvim-treesitter/nvim-treesitter",
  },
  keys = {
    { "<localleader>gf", "<cmd>GoFillStruct<cr>", { desc = "Go: Fill Struct" } },
  },
  config = function()
    require("go").setup({
      lsp_inlay_hints = {
        enable = false,
      },
      lsp_gofumpt = false,
      lsp_keymaps = false,
      dap_debug = false, -- handled by nvim-dap instead
      luasnip = true,
    })
  end,
}
