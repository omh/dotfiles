return {
  'nvim-lualine/lualine.nvim',
  config = function()
    local diff_symbols = { added = ' ', modified = ' ', removed = ' ' }
    require('lualine').setup {
      options = {
        -- theme = 'lualine-omh',
        theme = 'lualine-omh-kanagawa',
        -- theme = 'lualine-omh-vscode',
        globalstatus = true,
        icons_enabled = true,
        always_divide_middle = false,
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        disabled_filetypes = {
          winbar = { 'trouble' },
        },
      },
      -- sections = {
      --   lualine_a = { { 'mode', color = { bg = '#ff0000' } } },
      --   lualine_b = { { '', draw_empty = true, color = { bg = '#ff0000' } } },
      --   lualine_c = { { '', draw_empty = true, color = { bg = '#ff0000' } } },
      --   -- lualine_b = { 'branch' },
      --   -- lualine_c = { { 'filename', path = 1 } },
      --   lualine_x = { { 'filetype', colored = false } },
      --   lualine_y = { 'progress' },
      --   lualine_z = { 'location' }
      -- },
      -- sections = {
      --   lualine_a = {},
      --   lualine_b = {},
      --   lualine_c = {},
      --   lualine_x = { { 'filetype', colored = false } },
      --   lualine_y = { 'progress' },
      --   lualine_z = { 'location' }
      -- },
      sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {}
      },
      inactive_sections = {},
      winbar = {
        lualine_c = {
          { 'filetype', icon_only = true, padding = { left = 1, right = 0 } },
          { 'filename', path = 1,         colored = false },
        },
        lualine_x = {
          {
            require("noice").api.status.command.get,
            cond = require("noice").api.status.command.has,
            color = { fg = "#ff9e64" },
          },
          {
            require("noice").api.status.mode.get,
            cond = require("noice").api.status.mode.has,
            color = { fg = "#ff9e64" },
          },
          {
            require("noice").api.status.search.get,
            cond = require("noice").api.status.search.has,
            color = { fg = "#ff9e64" },
          },
        },
        lualine_y = {
          { 'diff', colored = true, symbols = diff_symbols },
        },
        lualine_z = {
          'diagnostics'
        },
      },
      inactive_winbar = {
        lualine_c = {
          { 'filetype', icon_only = true, colored = false, padding = { left = 1, right = 0 } },
          { 'filename', path = 1,         colored = false }
        },
        lualine_y = {
          { 'diff', colored = false, symbols = diff_symbols },
        },
        lualine_z = {
          { 'diagnostics', colored = false },
        },
      },
      -- no extensions needed if we never show the status line
      -- extensions = { 'quickfix', 'trouble', 'lazy', 'nvim-dap-ui', 'oil' }
    }

    require('lualine').hide({
      place = { 'statusline' }, -- The segment this change applies to.
      unhide = false,           -- whether to re-enable lualine again/
    })
  end

}
