return {
  'nvim-lualine/lualine.nvim',
  enabled = true,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "meuter/lualine-so-fancy.nvim",
  },
  config = function()
    local file_path = function()
      local path = vim.fn.expand("%:~:.:h")
      if path == "" then return " " else return path .. "/" end
    end

    require('lualine').setup {
      options = {
        theme = 'lualine-omh-kanagawa',
        icons_enabled = true,
        always_divide_middle = false,
        component_separators = { left = "", right = "" },
        section_separators = { left = '', right = '' },
        disabled_filetypes = {
          winbar = { 'trouble', 'dap-repl' },
        },
        refresh = {
          winbar = 100,
        }
      },
      extensions = { 'quickfix', 'trouble', 'lazy', 'nvim-dap-ui', 'oil' },
      sections = {},
      winbar = {
        lualine_a = {
          { 'filetype', icon_only = true,                 padding = { left = 1, right = 0 } },
          { file_path,  padding = { left = 1, right = 0 } },
        },
        lualine_b = {
          { 'filename', padding = 0, path = 0, },
        },
        lualine_c = {
          {
            "navic",
            color_correction = 'static',
            navic_opts = {
              depth_limit = 2,
              highlight = true,
              lazy_update_context = true,
            },
            padding = { left = 2 },
          }
        },
        lualine_x = {},
        lualine_z = {
          { 'diff',        separator = '|', icons_enabled = false, colored = true },
          { 'diagnostics', separator = '|', icons_enabled = false, colored = true },
        },
      },
      inactive_winbar = {
        lualine_a = {
          { 'filetype', icon_only = true, colored = false, padding = { left = 1, right = 1 } },
          { file_path,  padding = 0 },
        },
        lualine_b = {
          { 'filename', padding = 0, path = 0, },
        },
        lualine_c = {
        },
        lualine_z = {
          { 'diff',        separator = '|', icons_enabled = false, colored = false },
          { 'diagnostics', separator = '|', icons_enabled = false, colored = false },
        },
      }
    }
    require('lualine').hide({
      place = { 'statusline' },
      unhide = false,
    })
  end

}
