return {
  'nvim-treesitter/nvim-treesitter-context',
  enabled = true,
  event = "BufRead",
  config = function()
    require 'treesitter-context'.setup {
      max_lines = 3,       -- How many lines the window should span. Values <= 0 mean no limit.
      separator = ' ',
      trim_scope = 'inner',
      multiwindow = true,
      multiline_threshold = 2,       -- Maximum number of lines to show for a single context
    }

    local c = "#050505"
    if vim.o.background == 'light' then
      c = "#ececec"
    end

    vim.api.nvim_set_hl(0, 'TreesitterContext', { bg = "none" })
    vim.api.nvim_set_hl(0, 'TreesitterContextBottom', { bg = "none" })
    vim.api.nvim_set_hl(0, 'TreesitterContextSeparator', { fg = c, bg = "none", strikethrough = true, bold = true })
  end,
}
