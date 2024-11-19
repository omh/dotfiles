return {
  'nvim-treesitter/nvim-treesitter-context',
  commit = '2e5aef3d3013482ace17306b1fd1183c6e6c9eb1',
  enabled = false,
  event = "BufRead",
  config = function()
    require 'treesitter-context'.setup {
      max_lines = 3,           -- How many lines the window should span. Values <= 0 mean no limit.
      separator = ' ',
      multiline_threshold = 2, -- Maximum number of lines to show for a single context
    }

    vim.cmd [[highlight TreesitterContext guibg=none]]
    -- vim.cmd [[highlight TreesitterContextLast guibg=none]]
    vim.cmd [[highlight TreesitterContextBottom guibg=none gui=none]]
    -- vim.cmd [[highlight TreesitterContextLineNumber guifg=#585b70 guibg=none]]
    -- vim.cmd [[highlight TreesitterContextSeparator guifg=#313244 guibg=none gui=strikethrough]]
  end,
}
