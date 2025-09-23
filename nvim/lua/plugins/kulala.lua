vim.filetype.add({
  extension = {
    ['http'] = 'http',
  },
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'http', 'rest' },
  callback = function()
    vim.pack.add({ 'https://github.com/mistweaverco/kulala.nvim' })
    require('kulala').setup({
      global_keymaps = true,
      kulala_keymaps_prefix = "",
    })
  end,
})
