return {
  'tpope/vim-fugitive',
  config = function()
    vim.keymap.set("n", "<leader>gs", "<cmd>Git<CR>", { desc = "Git status" })
    vim.keymap.set("n", "<leader>gp", "<cmd>Git push<CR>", { desc = "Git push" })
    vim.keymap.set("n", "<leader>gP", "<cmd>Git push --force<CR>", { desc = "Git push force" })
    vim.keymap.set("n", "<leader>gu", "<cmd>Git pull<CR>", { desc = "Git pull" })
    vim.keymap.set("n", "<leader>gd", "<cmd>Git diff<CR>", { desc = "Git diff" })
    vim.keymap.set("n", "<leader>gl", "<cmd>Git log %<CR>", { desc = "Git log for current file" })
    vim.keymap.set("n", "<leader>gL", "<cmd>Git log<CR>", { desc = "Git log for repo" })
    vim.keymap.set("n", "<leader>ggo", "<cmd>GBrowse<CR>", { desc = "Open file on github" })
    vim.keymap.set("n", "<leader>ggc", "<cmd>GBrowse!<CR>", { desc = "Copy file's GitHub URL" })
    vim.keymap.set("x", "<leader>ggo", ":'<,'>GBrowse<CR>", { desc = "Open selection on github" })
    vim.keymap.set("x", "<leader>ggc", ":'<,'>GBrowse!<CR>", { desc = "Copy selection's GitHub URL" })

    vim.keymap.set("n", "<leader>gD", "<cmd>Gvdiffsplit!<CR>", { desc = "Diff current file" })

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
