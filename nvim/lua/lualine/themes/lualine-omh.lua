-- stylua: ignore start
local u = require("catppuccin.palettes").get_palette "mocha"

local omh = {}

local dim = "#999999"
local bg = "#292929"

bg = u.base
dim = u.subtext1

omh.normal = {
  a = { fg = u.text, bg = u.surface0, bold = true },
  b = { fg = dim, bg = bg },
  c = { fg = u.rosewater, bg = bg },
  x = { fg = dim, bg = bg },
  y = { fg = dim, bg = bg },
  z = { fg = dim, bg = bg },
}
omh.insert = {
  a = { fg = u.crust, bg = u.green },
  b = { fg = dim, bg = bg },
  c = { fg = u.rosewater, bg = bg },
  x = { fg = dim, bg = bg },
  y = { fg = dim, bg = bg },
  z = { fg = dim, bg = bg },
}
omh.visual = {
  a = { fg = u.crust, bg = u.pink },
  b = { fg = dim, bg = bg },
  c = { fg = u.rosewater, bg = bg },
  x = { fg = dim, bg = bg },
  y = { fg = dim, bg = bg },
  z = { fg = dim, bg = bg },
}
omh.replace = {
  a = { fg = u.crust, bg = u.red },
  b = { fg = dim, bg = bg },
  c = { fg = u.rosewater, bg = bg },
  x = { fg = dim, bg = bg },
  y = { fg = dim, bg = bg },
  z = { fg = dim, bg = bg },
}
omh.command = {
  a = { fg = u.crust, bg = u.red },
  b = { fg = dim, bg = bg },
  c = { fg = u.rosewater, bg = bg },
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

return omh
