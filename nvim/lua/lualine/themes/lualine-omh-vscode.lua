local c = require('vscode.colors').get_colors()
local bg = c.vscBack
local normal = c.vscFront
local filename = '#FFFFFF'
local filename_gui = 'none'
local dim = c.vscGray
if vim.o.background == 'light' then
  filename = '#000000'
  filename_gui = 'bold'
  dim = "#a0a0a0"
end

local vscode = {}

vscode.normal = {
  a = { fg = normal, bg = bg },
  b = { fg = filename, bg = bg, gui = filename_gui },
  c = { fg = dim, bg = bg },
  x = { fg = dim, bg = bg },
  y = { fg = dim, bg = bg },
  z = { fg = dim, bg = bg },
}
vscode.inactive = {
  a = { fg = dim, bg = bg },
  b = { fg = dim, bg = bg },
  c = { fg = dim, bg = bg },
  x = { fg = dim, bg = bg },
  y = { fg = dim, bg = bg },
  z = { fg = dim, bg = bg },
}

return vscode
