-- highlight word under cursor in the current buffer
return {
  'tzachar/local-highlight.nvim',
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require('local-highlight').setup({})
  end
}
