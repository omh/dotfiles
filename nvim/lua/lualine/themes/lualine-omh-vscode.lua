local c = require('vscode.colors').get_colors()
local bg = c.vscBack
local normal = c.vscFront
local filename = "#FFFFFF"

local vscode = {}

local dim = "#666666"

vscode.normal = {
  a = { fg = normal, bg = bg },
  b = { fg = filename, bg = bg },
  c = { fg = dim, bg = bg },
  x = { fg = dim, bg = bg },
  y = { fg = dim, bg = bg },
  z = { fg = dim, bg = bg },
}
-- vscode.insert = {
--   a = { fg = insert, bg = bg },
--   b = { fg = filename, bg = bg },
--   c = { fg = normal, bg = bg },
--   x = { fg = dim, bg = bg },
--   y = { fg = dim, bg = bg },
--   z = { fg = dim, bg = bg },
-- }
-- vscode.visual = {
--   a = { fg = insert, bg = bg },
--   b = { fg = dim, bg = bg },
--   c = { fg = filename, bg = bg },
--   x = { fg = dim, bg = bg },
--   y = { fg = dim, bg = bg },
--   z = { fg = dim, bg = bg },
-- }
-- vscode.replace = {
--   a = { fg = insert, bg = bg },
--   b = { fg = dim, bg = bg },
--   c = { fg = filename, bg = bg },
--   x = { fg = dim, bg = bg },
--   y = { fg = dim, bg = bg },
--   z = { fg = dim, bg = bg },
-- }
-- vscode.command = {
--   a = { fg = insert, bg = bg },
--   b = { fg = dim, bg = bg },
--   c = { fg = filename, bg = bg },
--   x = { fg = dim, bg = bg },
--   y = { fg = dim, bg = bg },
--   z = { fg = dim, bg = bg },
-- }
vscode.inactive = {
  a = { fg = dim, bg = bg },
  b = { fg = dim, bg = bg },
  c = { fg = dim, bg = bg },
  x = { fg = dim, bg = bg },
  y = { fg = dim, bg = bg },
  z = { fg = dim, bg = bg },
}

return vscode
