vim.pack.add({ { src = 'https://github.com/mistweaverco/kulala.nvim', version = 'develop' } })

vim.filetype.add({
  extension = {
    ['http'] = 'http',
  },
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'http', 'rest' },
  callback = function()
    require('kulala').setup({
      global_keymaps = true,
      kulala_keymaps_prefix = "",
    })
    vim.treesitter.start()
  end,
})
