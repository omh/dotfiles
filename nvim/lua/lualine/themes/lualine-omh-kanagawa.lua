local theme = require("kanagawa.colors").setup().theme
local palette = require("kanagawa.colors").setup().palette

local kanagawa = {}

kanagawa.normal = {
  a = { bg = theme.syn.fun, fg = theme.ui.bg_m3 },
  b = { bg = theme.diff.change, fg = theme.syn.fun },
  c = { bg = 'none', fg = theme.ui.fg, bold = true },
  x = { bg = 'none', fg = theme.ui.fg },
  y = { bg = 'none', fg = theme.ui.fg },
  z = { bg = 'none', fg = theme.ui.fg },
}

kanagawa.insert = {
  a = { bg = theme.diag.ok, fg = theme.ui.bg },
  b = { bg = theme.ui.bg, fg = theme.diag.ok },
}

kanagawa.command = {
  a = { bg = theme.syn.operator, fg = theme.ui.bg },
  b = { bg = theme.ui.bg, fg = theme.syn.operator },
}

kanagawa.visual = {
  a = { bg = theme.syn.keyword, fg = theme.ui.bg },
  b = { bg = theme.ui.bg, fg = theme.syn.keyword },
}

kanagawa.replace = {
  a = { bg = theme.syn.constant, fg = theme.ui.bg },
  b = { bg = theme.ui.bg, fg = theme.syn.constant },
}

kanagawa.inactive = {
  a = { bg = 'none', fg = theme.syn.comment },
  b = { bg = 'none', fg = theme.syn.comment },
  c = { bg = 'none', fg = theme.syn.comment },
}

if vim.g.kanagawa_lualine_bold then
  for _, mode in pairs(kanagawa) do
    mode.a.gui = "bold"
  end
end

return kanagawa
