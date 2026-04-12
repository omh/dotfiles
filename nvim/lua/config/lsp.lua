vim.env.PATH = vim.fn.stdpath('data') .. '/mason/bin:' .. vim.env.PATH
vim.pack.add({
  -- mason - for installing LSPs
  'https://github.com/williamboman/mason.nvim',
})

require("mason").setup()

vim.lsp.enable('luals')
vim.lsp.enable('gopls')
