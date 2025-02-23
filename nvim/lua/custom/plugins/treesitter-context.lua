return {
  'nvim-treesitter/nvim-treesitter-context',
  enabled = true,
  event = "BufRead",
  config = function()
    require 'treesitter-context'.setup {
      max_lines = 3, -- How many lines the window should span. Values <= 0 mean no limit.
      separator = ' ',
      trim_scope = 'inner',
      multiline_threshold = 2, -- Maximum number of lines to show for a single context
    }

    vim.api.nvim_set_hl(0, 'TreesitterContext', { bg = "none" })
    vim.api.nvim_set_hl(0, 'TreesitterContextBottom', { bg = "none" })
    vim.api.nvim_set_hl(0, 'TreesitterContextSeparator',
      { fg = "#050505", bg = "none", strikethrough = true, bold = true })
  end,
}
