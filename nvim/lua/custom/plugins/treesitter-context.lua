return {
  'nvim-treesitter/nvim-treesitter-context',
  event = 'VeryLazy',
  config = function()
    require 'treesitter-context'.setup {
      max_lines = 5,           -- How many lines the window should span. Values <= 0 mean no limit.
      separator = '—',
      multiline_threshold = 2, -- Maximum number of lines to show for a single context
    }

    vim.cmd [[highlight TreesitterContext guibg=none]]
    vim.cmd [[highlight TreesitterContextLast guibg=none]]
    vim.cmd [[highlight TreesitterContextBottom guibg=none gui=none]]
    vim.cmd [[highlight TreesitterContextLineNumber guibg=none]]
    vim.cmd [[highlight TreesitterContextSeparator guifg=#313244 guibg=none gui=strikethrough]]
  end,
}
