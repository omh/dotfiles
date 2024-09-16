local theme = require("kanagawa.colors").setup().theme
local palette = require("kanagawa.colors").setup().palette

-- local bg = '#262626'
local bg = theme.ui.bg
local kanagawa = {}

kanagawa.normal = {
  a = { bg = bg, fg = palette.carpYellow },
  b = { bg = bg, fg = theme.ui.fg },
  c = { bg = bg, fg = palette.carpYellow },
  x = { bg = bg, fg = theme.ui.fg },
  y = { bg = theme.ui.bg, fg = theme.ui.fg },
  z = { bg = bg, fg = theme.ui.fg_dim },
}
kanagawa.inactive = {
  a = { bg = bg, fg = theme.syn.comment },
  b = { bg = bg, fg = theme.syn.comment },
  c = { bg = bg, fg = theme.syn.comment },
  x = { bg = bg, fg = theme.syn.comment },
  y = { bg = bg, fg = theme.syn.comment },
  z = { bg = bg, fg = theme.syn.comment },
}

if vim.g.kanagawa_lualine_bold then
  for _, mode in pairs(kanagawa) do
    mode.a.gui = "bold"
  end
end

return kanagawa
