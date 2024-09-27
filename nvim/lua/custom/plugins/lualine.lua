return {
  'nvim-lualine/lualine.nvim',
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "meuter/lualine-so-fancy.nvim",
  },
  config = function()
    local diff_symbols = { added = ' ', modified = ' ', removed = ' ' }

    require('lualine').setup {
      options = {
        theme = 'lualine-omh-kanagawa',
        icons_enabled = true,
        always_divide_middle = false,
        component_separators = { left = "", right = "" },
        section_separators = { left = '', right = '' },
        disabled_filetypes = {
          winbar = { 'trouble' },
        },
        refresh = {
          winbar = 200,
        }
      },
      extensions = { 'quickfix', 'trouble', 'lazy', 'nvim-dap-ui', 'oil' },
      sections = {
        -- lualine_a = {
        --   { 'filetype', icon_only = true, padding = { left = 1, right = 0 } },
        --   { 'filename', path = 1,         colored = false },
        -- },
        -- lualine_b = {},
        -- lualine_c = {},
        -- lualine_x = {
        --   { 'diff',       colored = true, symbols = diff_symbols },
        --   { 'diagnostics' },
        -- },
        -- lualine_y = {
        -- },
        -- lualine_z = {
        --   { 'location' },
        -- },
      },
      inactive_sections = {
        -- lualine_a = {
        --   { 'filetype', icon_only = true, padding = { left = 1, right = 0 }, colored = false },
        --   { 'filename', path = 1,         colored = false },
        -- },
        -- lualine_b = {},
        -- lualine_c = {},
        -- lualine_x = {
        --   { 'diff',        colored = false, symbols = diff_symbols },
        --   { 'diagnostics', colored = false },
        -- },
        -- lualine_y = {
        -- },
        -- lualine_z = {
        --   { 'location' },
        -- },
      },
      winbar = {
        lualine_c = {
          { 'filetype', icon_only = true, padding = { left = 2, right = 0 } },
          { 'filename', path = 1, },
        },
        lualine_x = {
          'fancy_macro',
        },
        lualine_z = {
          { 'diff',        colored = true, symbols = diff_symbols },
          { 'diagnostics', colored = true },
        }
      },
      inactive_winbar = {
        lualine_c = {
          { 'filetype', icon_only = true, padding = { left = 2, right = 0 } },
          { 'filename', path = 1, },
        },
        lualine_z = {
          { 'diff',        colored = false, symbols = diff_symbols },
          { 'diagnostics', colored = false },
        }
      }
    }
    require('lualine').hide({
      place = { 'statusline' },
      unhide = false,
    })
  end

}
