return {
  'nvim-lualine/lualine.nvim',
  config = function()
    require('lualine').setup {
      options = {
        theme = 'lualine-omh',
        -- theme = "catppuccin",
        -- theme = 'rose-pine-alt',
        globalstatus = true,
        icons_enabled = true,
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
      },
      sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch' },
        lualine_c = { { 'filename', path = 1 } },
        lualine_y = { 'progress' },
        lualine_z = { 'location' }
      },
      inactive_sections = {},
      winbar = {
        lualine_c = {
          { 'filetype', icon_only = true, padding = { left = 0, right = 0 } },
          { 'filename', path = 4 },
        },
        lualine_x = {
          { 'diff', colored = true },
        },
        lualine_z = {
          'diagnostics'
        },
      },
      inactive_winbar = {
        lualine_b = {
          { 'filetype', icon_only = true, colored = false, padding = { left = 0, right = 0 } },
          { 'filename', path = 4 }
        },
        lualine_x = {
          { 'diff', colored = false },
        },
      },
      extensions = { 'quickfix', 'trouble', 'lazy' }
    }
  end

}
