return {
  'nvim-lualine/lualine.nvim',
  config = function()

  local diff_symbols = { added = ' ', modified = ' ', removed = ' ' }

    require('lualine').setup {
      options = {
        theme = 'lualine-omh-kanagawa',
        icons_enabled = true,
        always_divide_middle = true,
        component_separators = { left = "", right = "" },
        section_separators = { left = '', right = '' },
        disabled_filetypes = {
          winbar = { 'trouble' },
        },
      },
      extensions = { 'quickfix', 'trouble', 'lazy', 'nvim-dap-ui', 'oil' },
      sections = {
        lualine_a = {
          { 'filetype', icon_only = true, padding = { left = 1, right = 0 } },
          { 'filename', path = 1,         colored = false },
        },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {
          { 'diff', colored = true, symbols = diff_symbols },
          { 'diagnostics' },
        },
        lualine_y = {
        },
        lualine_z = {
          { 'location' },
        },
      },
      inactive_sections = {
        lualine_a = {
          { 'filetype', icon_only = true, padding = { left = 1, right = 0 }, colored = false },
          { 'filename', path = 1,         colored = false },
        },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {
          { 'diff', colored = false, symbols = diff_symbols },
          { 'diagnostics', colored = false },
        },
        lualine_y = {
        },
        lualine_z = {
          { 'location' },
        },
      },
    }

    -- require('lualine').hide({
    --   place = { 'statusline' }, -- The segment this change applies to.
    --   unhide = false,           -- whether to re-enable lualine again/
    -- })
  end

}
