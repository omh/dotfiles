local theme = require("kanagawa.colors").setup().theme
local palette = require("kanagawa.colors").setup().palette

local kanagawa = {}

kanagawa.normal = {
  a = { bg = 'none', fg = theme.ui.fg, strikethrough = true },
  b = { bg = 'none', fg = theme.syn.fu, strikethrough = true },
  c = { bg = 'none', fg = palette.carpYellow, bold = true },
  x = { bg = 'none', fg = theme.ui.fg },
  y = { bg = 'none', fg = theme.ui.fg },
  z = { bg = 'none', fg = theme.ui.fg },
}

-- kanagawa.insert = {
--   a = { bg = theme.diag.ok, fg = theme.ui.bg },
--   b = { bg = theme.ui.bg, fg = theme.diag.ok },
-- }
--
-- kanagawa.command = {
--   a = { bg = theme.syn.operator, fg = theme.ui.bg },
--   b = { bg = theme.ui.bg, fg = theme.syn.operator },
-- }
--
-- kanagawa.visual = {
--   a = { bg = theme.syn.keyword, fg = theme.ui.bg },
--   b = { bg = theme.ui.bg, fg = theme.syn.keyword },
-- }
--
-- kanagawa.replace = {
--   a = { bg = theme.syn.constant, fg = theme.ui.bg },
--   b = { bg = theme.ui.bg, fg = theme.syn.constant },
-- }

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
