vim.pack.add({ 'https://github.com/HiPhish/rainbow-delimiters.nvim' })
vim.defer_fn(function()
  require('rainbow-delimiters.setup').setup()
end, 100)
