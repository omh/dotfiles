local theme = require("kanagawa.colors").setup().theme
local palette = require("kanagawa.colors").setup().palette

local bg = theme.ui.bg
-- local bg = '#242424'
local kanagawa = {}

kanagawa.normal = {
  a = { bg = bg, fg = theme.ui.fg_dim },
  b = { bg = bg, fg = palette.carpYellow },
  c = { bg = bg, fg = theme.ui.fg },
  x = { bg = bg, fg = theme.ui.fg },
  y = { bg = theme.ui.bg, fg = theme.syn.comment },
  z = { bg = bg, fg = theme.syn.comment },
}
kanagawa.inactive = {
  a = { bg = bg, fg = theme.syn.comment },
  b = { bg = bg, fg = theme.syn.comment, gui = "bold" },
  c = { bg = bg, fg = theme.syn.comment },
  x = { bg = bg, fg = theme.syn.comment },
  y = { bg = bg, fg = theme.syn.comment },
  z = { bg = bg, fg = theme.syn.comment },
}

return kanagawa
