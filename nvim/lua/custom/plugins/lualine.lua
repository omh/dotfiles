return {
  'nvim-lualine/lualine.nvim',
  enabled = true,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "meuter/lualine-so-fancy.nvim",
  },
  config = function()
    local custom_fname = require('lualine.components.filename'):extend()

    function custom_fname:init(options)
      local default_options = {
        colored = true,
      }
      custom_fname.super.init(self, options)
      self.options = vim.tbl_deep_extend('keep', self.options or {}, default_options)
    end

    function custom_fname:update_status()
      local path = vim.fn.expand("%:~:.:h")
      local elements = {}
      for element in string.gmatch(path, "[^/]+") do
        table.insert(elements, element)
      end

      if path == "" then
        return " "
      end

      if self.options.colored then
        return "%#directory#  %#normal#" ..
            table.concat(elements, "%#comment# > %#normal#") .. "%#comment# > "
      else
        return "  " .. table.concat(elements, " > ") .. " > "
      end
    end

    local http_env = function()
      if vim.bo.filetype == "http" then
        local env = require('kulala').get_selected_env()
        return "  %#function#  %#normal#" .. env
      else
        return ""
      end
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
          { custom_fname, padding = { left = 1, right = 0 } },
          -- { file_path,   padding = { left = 1, right = 0 } },
        },
        lualine_b = {
          { 'filetype', icon_only = true, padding = { left = 0, right = 0 } },
          { 'filename', padding = 0,      path = 0, },
        },
        lualine_c = {
          {
            "navic",
            color_correction = 'static',
            navic_opts = {
              depth_limit = 3,
              highlight = true,
              separator = "%#comment# > ",
              -- lazy_update_context = true,
            },
            padding = { left = 1 },
            fmt = function(str, _)
              if str == "" then
                return str
              end
              return "%#comment#>%#normal# " .. str
            end,
          },
          { http_env }
        },
        lualine_x = {},
        lualine_z = {
          { 'diff',        separator = '|', icons_enabled = false, colored = true },
          { 'diagnostics', separator = '|', icons_enabled = false, colored = true },
        },
      },
      inactive_winbar = {
        lualine_a = {
          { custom_fname, padding = { left = 1, right = 0 }, colored = false },
        },
        lualine_b = {
          { 'filetype', colored = false, icon_only = true, padding = { left = 0, right = 0 } },
          { 'filename', colored = false, padding = 0,      path = 0, },
        },
        lualine_c = {
          { http_env }
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
