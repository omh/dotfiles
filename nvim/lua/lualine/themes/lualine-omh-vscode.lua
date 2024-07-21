local c = require("visual_studio_code").get_colors()
local bg = c.__vscode_local_background
local normal = c.__vscode_statusline_foreground
local insert = c.__vscode_keyword
local filename = c.__vscode_strings

local omh = {}

local dim = "#999999"

omh.normal = {
  a = { fg = normal, bg = bg },
  b = { fg = dim, bg = bg },
  c = { fg = filename, bg = bg },
  x = { fg = dim, bg = bg },
  y = { fg = dim, bg = bg },
  z = { fg = dim, bg = bg },
}
omh.insert = {
  a = { fg = insert, bg = bg },
  b = { fg = dim, bg = bg },
  c = { fg = filename, bg = bg },
  x = { fg = dim, bg = bg },
  y = { fg = dim, bg = bg },
  z = { fg = dim, bg = bg },
}
omh.visual = {
  a = { fg = insert, bg = bg },
  b = { fg = dim, bg = bg },
  c = { fg = filename, bg = bg },
  x = { fg = dim, bg = bg },
  y = { fg = dim, bg = bg },
  z = { fg = dim, bg = bg },
}
omh.replace = {
  a = { fg = insert, bg = bg },
  b = { fg = dim, bg = bg },
  c = { fg = filename, bg = bg },
  x = { fg = dim, bg = bg },
  y = { fg = dim, bg = bg },
  z = { fg = dim, bg = bg },
}
omh.command = {
  a = { fg = insert, bg = bg },
  b = { fg = dim, bg = bg },
  c = { fg = filename, bg = bg },
  x = { fg = dim, bg = bg },
  y = { fg = dim, bg = bg },
  z = { fg = dim, bg = bg },
}
omh.inactive = {
  a = { fg = dim, bg = bg },
  b = { fg = dim, bg = bg },
  c = { fg = dim, bg = bg },
  x = { fg = dim, bg = bg },
  y = { fg = dim, bg = bg },
  z = { fg = dim, bg = bg },
}

if vim.g.newpaper_lualine_bold == nil then
  vim.g.newpaper_lualine_bold = true
end

if vim.g.newpaper_lualine_bold then
  for _, mode in pairs(omh) do
    mode.a.gui = "bold"
  end
end

return omh
