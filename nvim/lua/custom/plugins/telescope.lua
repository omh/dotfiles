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

    {
      'nvim-telescope/telescope-live-grep-args.nvim',
    }
  },
  config = function()
    local ta = require('telescope.actions')
    local lga_actions = require("telescope-live-grep-args.actions")

    require('telescope').setup {
      defaults = {
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
          "--trim",
        },
        winblend = 0,
        prompt_prefix = "❯ ",
        color_devicons = true,
      },
      pickers = {
        lsp_document_symbols = {
          symbol_width = 50,
        },
        lsp_workspace_symbols = {
          symbol_width = 50,
        }
      },
      extensions = {
        live_grep_args = {
          auto_quoting = true, -- enable/disable auto-quoting
          -- define mappings, e.g.
          mappings = {         -- extend mappings
            i = {
              ["<C-k>"] = lga_actions.quote_prompt(),
              ["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
            },
          },
        },

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

    local width_func = function(_, max_columns)
      local width = 180
      if max_columns < width then
        width = math.floor(0.9 * max_columns)
      end

      return width
    end

    local config = {
      layout_config = {
        width = width_func,
        preview_width = 90,
        height = function(_, _, max_lines)
          local height = 35
          if max_lines < height then
            height = math.floor(0.9 * max_lines)
          end
          return height
        end
      }
    }
    local keymap = vim.keymap.set
    local tb = require('telescope.builtin')

    keymap('n', '<leader>sf', function() tb.find_files(config) end, { desc = 'Search Files' })
    keymap('n', '<leader>fw', function()
      tb.live_grep(require('telescope.themes').get_ivy({}))
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
    keymap('n', '<leader>fr', function() tb.oldfiles(config) end, { desc = "Find recent files" })
    keymap('n', '<leader>fh', function() tb.help_tags(config) end, { desc = "Search help tags" })
    keymap('n', '<leader>gb', function() tb.git_branches(config) end, { desc = "Find buffers" })
    keymap('n', '<leader>fb', function() tb.buffers(config) end, { desc = "Find buffers" })
  end
}
