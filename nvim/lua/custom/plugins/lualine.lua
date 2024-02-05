return {
  'nvim-lualine/lualine.nvim',
  config = function()
    require('lualine').setup {
      -- options = {
      --   -- theme = "visual_studio_code",
      --   -- icons_enabled = true,
      --   component_separators = { left = "", right = "" },
      --   section_separators = { left = "", right = "" },
      --   disabled_filetypes = {},
      --   globalstatus = false,
      -- },
      -- options = {
      --   theme = "lualine-omh-vscode",
      --   icons_enabled = true,
      --   component_separators = { left = "", right = "" },
      --   section_separators = { left = "", right = "" },
      --   disabled_filetypes = {},
      --   globalstatus = false,
      -- },
      options = {
        theme = 'lualine-omh',
        globalstatus = false,
        icons_enabled = true,
      },
      sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = { 'filename' },
        lualine_x = { 'filetype' },
        lualine_y = {},
        lualine_z = { 'location' }
      },
    }
  end

}
