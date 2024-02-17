return {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    auto_close = true,
  },
  keys = {
    { "<leader>xx", function() require("trouble").toggle() end,                        { desc = "Toggle Trouble" } },
    { "<leader>xw", function() require("trouble").toggle("workspace_diagnostics") end, { desc = "Toggle Trouble Workspace diagnostics" } },
    { "<leader>xd", function() require("trouble").toggle("document_diagnostics") end,  { desc = "Toggle Trouble Document diagnostics" } },
    { "<leader>xq", function() require("trouble").toggle("quickfix") end,              { desc = "Toggle Trouble quickfix" } },
    { "gr",         function() require("trouble").open("lsp_references") end,          { desc = "LSP references in Trouble" } },
  },
  config = function()
    vim.keymap.set('n', ']d', function()
      require("trouble").next({ skip_groups = true, jump = true });
    end, { desc = 'Go to previous diagnostic message' })
    vim.keymap.set('n', '[d', function()
      require("trouble").previous({ skip_groups = true, jump = true });
    end, { desc = 'Go to next diagnostic message' })
  end
}
