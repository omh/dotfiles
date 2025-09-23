vim.defer_fn(function()
  vim.pack.add({ 'https://github.com/nvim-treesitter/nvim-treesitter-context' })
  require 'treesitter-context'.setup {
    max_lines = 3, -- How many lines the window should span. Values <= 0 mean no limit.
    separator = ' ',
    trim_scope = 'inner',
    multiwindow = true,
    multiline_threshold = 2, -- Maximum number of lines to show for a single context
  }
end, 100)
