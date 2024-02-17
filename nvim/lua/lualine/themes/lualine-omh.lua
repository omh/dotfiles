-- stylua: ignore start
local u = require("catppuccin.palettes").get_palette "mocha"

local omh = {}

local dim = "#999999"
local bg = "#292929"

omh.normal = {
  a = { fg = u.text, bg = u.surface0 },
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
  a = { fg = dim, bg = u.red },
  b = { fg = dim, bg = bg },
  c = { fg = dim, bg = bg },
  x = { fg = dim, bg = bg },
  y = { fg = dim, bg = bg },
  z = { fg = dim, bg = bg },
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
