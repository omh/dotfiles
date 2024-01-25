return {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    auto_close = true,
  },
  config = function()
    vim.keymap.set("n", "<leader>xx", function() require("trouble").toggle() end, { desc = "Toggle Trouble diagnostics" })
    vim.keymap.set("n", "<leader>xw", function() require("trouble").toggle("workspace_diagnostics") end,
      { desc = "Toggle Trouble Workspace diagnostics" })
    vim.keymap.set("n", "<leader>xd", function() require("trouble").toggle("document_diagnostics") end,
      { desc = "Toggle Trouble document_diagnostics" })

    vim.keymap.set('n', ']d', function()
      require("trouble").next({ skip_groups = true, jump = true });
    end, { desc = 'Go to previous diagnostic message' })
    vim.keymap.set('n', '[d', function()
      require("trouble").previous({ skip_groups = true, jump = true });
    end, { desc = 'Go to next diagnostic message' })
  end
}
