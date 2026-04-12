vim.cmd [[
    let g:tmux_navigator_disable_when_zoomed = 1
]]

vim.pack.add({
  -- hjkl navigation with tmux
  'https://github.com/christoomey/vim-tmux-navigator',
  -- navigation path
  'https://github.com/SmiteshP/nvim-navic',
  -- readline keybindings for insert/command mode
  'https://github.com/tpope/vim-rsi',
  -- show marks in signcolumn
  'https://github.com/dimtion/guttermarks.nvim',
  -- base64 encode/decode
  'https://github.com/ovk/endec.nvim',
  -- better diagnostics
  'https://github.com/rachartier/tiny-inline-diagnostic.nvim',
  -- view pr in browser
  'https://github.com/fredrikaverpil/pr.nvim',
})

vim.defer_fn(function()
  require("guttermarks").setup()
  require("tiny-inline-diagnostic").setup()
  require("pr").setup()
  require("nvim-navic").setup({
    depth_limit = 2,
    highlight = true,
    separator = "%#Comment# > ",
    icons = {
      File = ' ',
      Module = ' ',
      Namespace = ' ',
      Package = ' ',
      Class = ' ',
      Method = ' ',
      Property = ' ',
      Field = ' ',
      Constructor = ' ',
      Enum = ' ',
      Interface = ' ',
      Function = ' ',
      Variable = ' ',
      Constant = ' ',
      String = ' ',
      Number = ' ',
      Boolean = ' ',
      Array = ' ',
      Object = ' ',
      Key = ' ',
      Null = ' ',
      EnumMember = ' ',
      Struct = ' ',
      Event = ' ',
      Operator = ' ',
      TypeParameter = ' '
    },
  })
end, 200)
