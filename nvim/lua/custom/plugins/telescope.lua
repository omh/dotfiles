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
        winblend = 8,
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
    require("telescope").load_extension("git_worktree")

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

    local dropdown_theme = require('telescope.themes').get_dropdown({
      cwd_only = true,
      layout_config = {
        height = 26
      },
      borderchars = {
        { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
        prompt = { "─", "│", " ", "│", '┌', '┐', "│", "│" },
        results = { "─", "│", "─", "│", "├", "┤", "┘", "└" },
        preview = { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
      },
      mirror = true,
      previewer = false,
    })

    local ivy_config = require('telescope.themes').get_ivy({
      path_display = { truncate = 3 },
      layout_config = {
        anchor = 'CENTER',
      },
    })

    local keymap = vim.keymap.set
    local tb = require('telescope.builtin')

    keymap('n', '<leader>ff', function() tb.find_files(dropdown_theme) end, { desc = 'Find Files' })
    keymap('n', '<leader>ss', function() tb.live_grep(ivy_config) end, { desc = 'Search for text' })
    keymap('n', '<leader>sS', function()
      local word = vim.fn.expand("<cword>")
      local opts = { search = word }
      tb.grep_string(require('telescope.themes').get_ivy(opts))
    end, { desc = 'Search for text under cursor' })
    keymap('v', '<leader>ss', function()
      local text = vim.getVisualSelection()
      local opts = { search = text }
      tb.grep_string(require('telescope.themes').get_ivy(opts))
    end, { desc = 'Search for highlighted text' })
    keymap('n', '<leader>fr', function() tb.oldfiles(dropdown_theme) end, { desc = "Recent files" })
    keymap('n', '<leader>sh', function() tb.help_tags(dropdown_theme) end, { desc = "Help tags" })
    keymap('n', '<leader>gb', function() tb.git_branches(dropdown_theme) end, { desc = "Branches" })
    keymap('n', '<leader>bb', function() tb.buffers(dropdown_theme) end, { desc = "Find buffers" })

    keymap('n', '<leader>gn', function() require('telescope').extensions.git_worktree.create_git_worktree() end,
      { desc = "Create new worktree" })
    keymap('n', '<leader>gw', function() require('telescope').extensions.git_worktree.git_worktrees() end,
      { desc = "Create new worktree" })

    keymap('n', '<leader>o', function()
      local cfg = require('telescope.themes').get_cursor({
        layout_config = {
          width = 140,
          height = 20,
          preview_cutoff = 130,
          preview_width = 70,
        }
      })
      require('telescope.builtin').lsp_document_symbols(cfg)
    end, { desc = 'Document Symbols' })
    keymap('n', '<leader>O', function()
      require('telescope.builtin').lsp_dynamic_workspace_symbols(dropdown_theme)
    end, { desc = '[W]orkspace [S]ymbols' })
  end
}
