-- project wide templates/settings
return {
  'tpope/vim-projectionist',
  config = function()
    vim.g.projectionist_heuristics = {
      ['*.go'] = {
        ['*.go'] = { alternate = '{}_test.go', type = "source" },
        ['*_test.go'] = { alternate = '{}.go', type = "test" },
      }
    }
    vim.keymap.set('n', '<leader>fa', '<cmd>A<CR>', { desc = 'Alternate file' })
  end
}
