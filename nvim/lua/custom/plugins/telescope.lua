return {
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    -- Fuzzy Finder Algorithm which requires local dependencies to be built.
    -- Only load if `make` is available. Make sure you have the system
    -- requirements installed.
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      -- NOTE: If you are having trouble with this installation,
      --       refer to the README for telescope-fzf-native for more instructions.
      build = 'make',
      cond = function()
        return vim.fn.executable 'make' == 1
      end,
    },

  },
  config = function()
    local ta = require('telescope.actions')
    require('telescope').setup {
      defaults = {
        prompt_prefix = " ",
        mappings = {
          i = {
            ["<C-h>"] = "which_key",
            ["<esc>"] = ta.close,
            ["<C-j>"] = ta.move_selection_next,
            ["<C-k>"] = ta.move_selection_previous,
          }
        },
        vimgrep_arguments = {
          "rg",
          "-L",
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case",
        },
        winblend = 10,
        color_devicons = true,
      },
      pickers = {
        lsp_document_symbols = {
          symbol_width = 60,
        },
        lsp_workspace_symbols = {
          symbol_width = 60,
        }
      },
      extensions = {
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
          case_mode = "smart_case",
        },
      },
    }
    -- Enable telescope fzf native, if installed
    pcall(require('telescope').load_extension, 'fzf')

    function vim.getVisualSelection()
      vim.cmd('noau normal! "vy"')
      local text = vim.fn.getreg('v')
      vim.fn.setreg('v', {})

      text = string.gsub(text, "\n", "")
      if #text > 0 then
        return text
      else
        return ''
      end
    end

    -- local config = {
    --   layout_config = {
    --     width = width_func,
    --     height = function(_, _, max_lines)
    --       local height = 35
    --       if max_lines < height then
    --         height = math.floor(0.9 * max_lines)
    --       end
    --       return height
    --     end
    --   }
    -- }

    local drop_config = require('telescope.themes').get_dropdown({
      winblend = 10,
      shorten_path = true,
      layout_config = {
        anchor = 'N',
        prompt_position = 'top',
        mirror = true,
        height = 0.5
      },
    })

    local ivy_config = require('telescope.themes').get_ivy({
      path_display = { truncate = 3 },
    })

    local keymap = vim.keymap.set
    local tb = require('telescope.builtin')

    keymap('n', '<leader>sf', function() tb.find_files(drop_config) end, { desc = 'Search Files' })
    keymap('n', '<leader>fw', function()
      tb.live_grep(ivy_config)
    end, { desc = 'Search for text' })
    keymap('n', '<leader>fW', function()
      local word = vim.fn.expand("<cword>")
      local opts = { search = word }
      tb.grep_string(require('telescope.themes').get_ivy(opts))
    end, { desc = 'Search for text' })
    keymap('v', '<leader>fw', function()
      local text = vim.getVisualSelection()
      local opts = { search = text }
      tb.grep_string(require('telescope.themes').get_ivy(opts))
    end, { desc = 'Search for highlighted text' })
    keymap('n', '<leader>fr', function() tb.oldfiles(drop_config) end, { desc = "Find recent files" })
    keymap('n', '<leader>fh', function() tb.help_tags(drop_config) end, { desc = "Search help tags" })
    keymap('n', '<leader>gb', function() tb.git_branches(drop_config) end, { desc = "Find buffers" })
    keymap('n', '<leader>fb', function() tb.buffers(drop_config) end, { desc = "Find buffers" })
    keymap('n', '<leader>o', function()
      require('telescope.builtin').lsp_document_symbols(drop_config)
    end, { desc = 'Document Symbols' })
    keymap('n', '<leader>O', function()
      require('telescope.builtin').lsp_dynamic_workspace_symbols(drop_config)
    end, { desc = '[W]orkspace [S]ymbols' })
  end
}
