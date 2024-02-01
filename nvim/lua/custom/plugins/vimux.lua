-- run tmux commands from vim
return {
  'preservim/vimux',
  config = function()
    vim.g.VimuxHeight = "35"

    vim.keymap.set('n', '<leader>vl', "<cmd>VimuxRunLastCommand<CR>", { desc = 'Run last Vimux command' })
    -- vim.keymap.set('n', '<leader>vl', "<cmd>VimuxClearTerminalScreen<CR>", { desc = 'Clear Vimux screen' })
    vim.keymap.set('n', '<leader>vi', "<cmd>VimuxInspectRunner<CR>", { desc = 'Focus Vimux pane in copy mode' })
    vim.keymap.set('n', '<M-`>', "<cmd>VimuxToggle<CR>", { desc = 'Open Vimux pane' })
    vim.keymap.set('n', '<leader>vo', "<cmd>VimuxOpen<CR>", { desc = 'Open Vimux pane' })
    vim.keymap.set('n', '<leader>vq', "<cmd>VimuxClose<CR>", { desc = 'Close Vimux pane' })
    vim.keymap.set('n', '<leader>vx', "<cmd>VimuxInterruptRunner<CR><CR>", { desc = 'Interrupt Vimux command' })
  end
}
