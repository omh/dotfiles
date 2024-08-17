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
  dependencies = { -- optional packages
    "ray-x/guihua.lua",
    "neovim/nvim-lspconfig",
    "nvim-treesitter/nvim-treesitter",
  },
  config = function()
    require("go").setup()

    local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})
    vim.api.nvim_create_autocmd("BufWritePre", {
      pattern = "*.go",
      callback = function()
        require('go.format').goimports()
      end,
      group = format_sync_grp,
    })
  end,
  event = { "CmdlineEnter" },
  ft = { "go", 'gomod' },
  build = ':lua require("go.install").update_all_sync()' -- if you need to install/update all binaries
}
