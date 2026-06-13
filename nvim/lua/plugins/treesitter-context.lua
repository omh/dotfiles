vim.defer_fn(function()
  vim.pack.add({ 'https://github.com/nvim-treesitter/nvim-treesitter-context' })
  require 'treesitter-context'.setup {
    max_lines = 3,
    separator = '─',
    trim_scope = 'inner',
    multiwindow = true,
    multiline_threshold = 3,
  }
end, 100)
