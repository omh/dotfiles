return {
  'tpope/vim-fugitive',
  config = function()
    -- vim.keymap.set("n", "<leader>gs", "<cmd>Git<CR>", { desc = "Git status" })
    vim.keymap.set("n", "<leader>ggo", "<cmd>GBrowse<CR>", { desc = "Open file on github" })
    vim.keymap.set("n", "<leader>ggc", "<cmd>GBrowse!<CR>", { desc = "Copy file's GitHub URL" })
    vim.keymap.set("x", "<leader>ggo", ":'<,'>GBrowse<CR>", { desc = "Open selection on github" })
    vim.keymap.set("x", "<leader>ggc", ":'<,'>GBrowse!<CR>", { desc = "Copy selection's GitHub URL" })
    vim.keymap.set("n", "<leader>ggp", "<cmd>!gh pr view --web<CR>", { desc = "Open current pr in browser" })

    vim.keymap.set("n", "<leader>gvb", function()
      local branch = vim.fn.input("Branch: ", vim.g.base_branch)
      if branch ~= "" then
        local f = vim.fn.expand('%:p')
        local cmd = ":Gedit " .. branch .. ":" .. f
        vim.cmd(cmd)
      end
    end, { desc = "View current file on different branch..." })

    vim.keymap.set("n", "<leader>gvd", function()
      local branch = vim.fn.input("Branch: ", vim.g.base_branch)
      if branch ~= "" then
        local cmd = ":Gvdiffsplit " .. branch
        vim.cmd(cmd)
      end
    end, { desc = "Diff current file against a branch..." })
  end
}
