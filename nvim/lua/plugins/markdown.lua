vim.pack.add({ 'https://github.com/OXY2DEV/markview.nvim' })
require('markview').setup({
  preview = {
    icon_provider = "mini", -- "mini" or "devicons"
  }
})


vim.pack.add({ 'https://github.com/selimacerbas/live-server.nvim' })
vim.pack.add({ 'https://github.com/selimacerbas/markdown-preview.nvim' })
require('markdown_preview').setup({})
