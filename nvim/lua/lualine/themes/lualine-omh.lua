-- stylua: ignore start
local u = require("catppuccin.palettes").get_palette "mocha"

local omh = {}

local dim = "#999999"

omh.normal = {
  a = { fg = u.text, bg = u.surface0 },
  b = { fg = dim, bg = u.mantle },
  c = { fg = u.rosewater, bg = u.mantle },
  x = { fg = dim, bg = u.mantle },
  y = { fg = dim, bg = u.mantle },
  z = { fg = dim, bg = u.mantle },
}
omh.insert = {
  a = { fg = u.crust, bg = u.green },
  b = { fg = dim, bg = u.mantle },
  c = { fg = u.rosewater, bg = u.mantle },
  x = { fg = dim, bg = u.mantle },
  y = { fg = dim, bg = u.mantle },
  z = { fg = dim, bg = u.mantle },
}
omh.visual = {
  a = { fg = u.crust, bg = u.pink },
  b = { fg = dim, bg = u.mantle },
  c = { fg = u.rosewater, bg = u.mantle },
  x = { fg = dim, bg = u.mantle },
  y = { fg = dim, bg = u.mantle },
  z = { fg = dim, bg = u.mantle },
}
omh.replace = {
  a = { fg = u.crust, bg = u.red },
  b = { fg = dim, bg = u.mantle },
  c = { fg = u.rosewater, bg = u.mantle },
  x = { fg = dim, bg = u.mantle },
  y = { fg = dim, bg = u.mantle },
  z = { fg = dim, bg = u.mantle },
}
omh.command = {
  a = { fg = u.crust, bg = u.red },
  b = { fg = dim, bg = u.mantle },
  c = { fg = u.rosewater, bg = u.mantle },
  x = { fg = dim, bg = u.mantle },
  y = { fg = dim, bg = u.mantle },
  z = { fg = dim, bg = u.mantle },
}
omh.inactive = {
  a = { fg = dim, bg = u.red },
  b = { fg = dim, bg = u.mantle },
  c = { fg = dim, bg = u.mantle },
  x = { fg = dim, bg = u.mantle },
  y = { fg = dim, bg = u.mantle },
  z = { fg = dim, bg = u.mantle },
}

-- stylua: ignore end

if vim.g.newpaper_lualine_bold == nil then
  vim.g.newpaper_lualine_bold = true
end

if vim.g.newpaper_lualine_bold then
  for _, mode in pairs(omh) do
    mode.a.gui = "bold"
  end
end

return omh
