-- project wide templates/settings
return {
  'tpope/vim-projectionist',
  config = function()
    vim.keymap.set('n', '<leader>fa', '<cmd>A<CR>', { desc = 'Alternate file' })
  end
}
