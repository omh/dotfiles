-- highlight word under cursor in the current buffer
return {
  'tzachar/local-highlight.nvim',
  config = function()
    require('local-highlight').setup({})
  end
}
