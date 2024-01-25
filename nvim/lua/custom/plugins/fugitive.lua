return {
  'tpope/vim-fugitive',
  config = function()
    -- vim.keymap.set("n", "<leader>gs", "<cmd>vertical botright Git<CR><cmd>vertical resize -20<CR>",
    --   { desc = "Git status" })
    vim.keymap.set("n", "<leader>gs", "<cmd>Git<CR>", { desc = "Git status" })
    vim.keymap.set("n", "<leader>gp", "<cmd>Git push<CR>", { desc = "Git push" })
    vim.keymap.set("n", "<leader>gP", "<cmd>Git push --force<CR>", { desc = "Git push force" })
    vim.keymap.set("n", "<leader>gu", "<cmd>Git pull<CR>", { desc = "Git pull" })
    vim.keymap.set("n", "<leader>gd", "<cmd>Git diff<CR>", { desc = "Git diff" })
    vim.keymap.set("n", "<leader>gl", "<cmd>Git log %<CR>", { desc = "Git log for current file" })
    vim.keymap.set("n", "<leader>gL", "<cmd>Git log<CR>", { desc = "Git log for repo" })
  end
}
