vim.keymap.set('n', '<leader>ra', function()
  local cmd = "VimuxRunCommand \"mix test\""
  vim.cmd(cmd)
end, { desc = 'Test all (elixir)' })

vim.keymap.set('n', '<leader>rf', function()
  local f = vim.fn.expand('%:p')
  local cmd = "VimuxRunCommand \"mix test " .. f .. "\""
  vim.cmd(cmd)
end, { desc = 'Test file in tmux (elixir)' })

vim.keymap.set('n', '<leader>rn', function()
  local f = vim.fn.expand('%:p')
  local line = vim.api.nvim_win_get_cursor(0)[1]
  local cmd = "VimuxRunCommand \"mix test " .. f .. ":" .. line .. "\""
  vim.cmd(cmd)
end, { desc = 'Test nearest in tmux (elixir)' })
