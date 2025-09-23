vim.pack.add({
  { src = 'https://github.com/stevearc/quicker.nvim' },
  { src = 'https://github.com/kevinhwang91/nvim-bqf' },
})

require('bqf').setup()
require('quicker').setup()

vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'qf' },
  callback = function()
    vim.keymap.set('n', 'q', '<cmd>bd<cr>', { silent = true, buffer = true })
  end,
})
