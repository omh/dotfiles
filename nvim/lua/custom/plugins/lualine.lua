return {
  'nvim-lualine/lualine.nvim',
  enabled = true,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
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
      if path == "" then
        return " "
      end

      if path == "." then
        return " "
      end

      local elements = {}
      for element in string.gmatch(path, "[^/]+") do
        if element == "~" then
          element = "󰜥 "
        end

        table.insert(elements, element)
      end

      if self.options.colored then
        return "%#DimText#" .. table.concat(elements, "%#Comment# > %#DimText#") .. "%#Comment# > "
      else
        return table.concat(elements, " > ") .. " > "
      end
    end

    local http_env = function()
      if vim.bo.filetype == "http" then
        local env = require('kulala').get_selected_env()
        return "%#Comment#-> %#function# %#DimText#" .. env
      else
        return ""
      end
    end

    require('lualine').setup {
      options = {
        -- theme = 'lualine-omh-kanagawa',
        theme = 'lualine-omh-vscode',
        -- theme = 'vscode',
        component_separators = { left = "", right = "" },
        section_separators = { left = '', right = '' },
        disabled_filetypes = {
          winbar = { 'trouble', 'dap-repl', 'kulala', 'json' },
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
          { 'filename', padding = 0,      path = 0 },
        },
        lualine_c = {
          {
            "navic",
            -- color_correction = "dynamic",
            navic_opts = {
              depth_limit = 2,
              highlight = true,
              separator = "%#Comment# > ",
              lazy_update_context = true,
            },
            padding = { left = 1 },
            fmt = function(str, _)
              if str == "" then
                return str
              end
              return "%#Comment#->%#normal# " .. str
            end,
          },
          { http_env }
        },
        lualine_x = {},
        lualine_z = {
          { 'diff',        separator = '|', },
          { 'diagnostics', separator = '|' },

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
          { 'diff',        separator = '|', colored = false },
          { 'diagnostics', separator = '|', colored = false },
        },
      }
    }
    require('lualine').hide({
      place = { 'statusline' },
      unhide = false,
    })
  end

}
