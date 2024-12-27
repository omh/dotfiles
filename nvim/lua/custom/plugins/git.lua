return {
  {
    "NeogitOrg/neogit",
    lazy = false,
    keys = {
      { "<leader>gs", "<cmd>Neogit<cr>",                                        desc = "Neogit status" },
      { "<leader>gp", "<cmd>Neogit push<cr>",                                   desc = "Git push" },
      { "<leader>gP", "<cmd>Neogit push --force<cr>",                           desc = "Git push forc" },
      { "<leader>dd", "<cmd>DiffviewOpen<cr>",                                  desc = "Open diff view against current branch" },
      { "<leader>gl", "<cmd>DiffviewFileHistory %<CR>",                         desc = "Git log for current file" },
      { "<leader>gb", require("snacks").git.blame_line,                         desc = "Git blame for current line" },
      { "<leader>gL", "<cmd>DiffviewFileHistory<CR>",                           desc = "Git log for repo" },
      { "<leader>dm", "<cmd>DiffviewOpen origin/HEAD...HEAD --imply-local<cr>", desc = "Open diff view for branch" },
    },
    dependencies = {
      "nvim-lua/plenary.nvim",  -- required
      "sindrets/diffview.nvim", -- optional - Diff integration

      -- Only one of these is needed, not both.
      -- "nvim-telescope/telescope.nvim", -- optional
      "ibhagwan/fzf-lua", -- optional
    },
    config = function()
      local neogit = require("neogit")
      neogit.setup {
        graph_style = "kitty",
        signs = {
          -- { CLOSED, OPENED }
          hunk = { "", "" },
          item = { "", "" },
          section = { "", "" },
        },
        mappings = {
          popup = {
            ["p"] = "PushPopup",
            ["P"] = "PullPopup",
          } },
      }

      local diffview = require("diffview")
      diffview.setup {
        file_panel = {
          win_config = { -- See |diffview-config-win_config|
            position = "left",
            width = 55,
            win_opts = {},
          },
        },
      }

      local theme = require("kanagawa.colors").setup().theme
      local palette = require("kanagawa.colors").setup().palette
      vim.api.nvim_set_hl(0, "DiffviewFilePanelSelected", { fg = palette.carpYellow, bg = theme.ui.bg_p1, bold = true })
    end
  },
  {
    'tpope/vim-fugitive',
    config = function()
      -- vim.keymap.set("n", "<leader>gs", "<cmd>Git<CR>", { desc = "Git status" })
      -- vim.keymap.set("n", "<leader>gp", "<cmd>Git push<CR>", { desc = "Git push" })
      -- vim.keymap.set("n", "<leader>gP", "<cmd>Git push --force<CR>", { desc = "Git push force" })
      vim.keymap.set("n", "<leader>ggo", "<cmd>GBrowse<CR>", { desc = "Open file on github" })
      vim.keymap.set("n", "<leader>ggc", "<cmd>GBrowse!<CR>", { desc = "Copy file's GitHub URL" })
      vim.keymap.set("x", "<leader>ggo", ":'<,'>GBrowse<CR>", { desc = "Open selection on github" })
      vim.keymap.set("x", "<leader>ggc", ":'<,'>GBrowse!<CR>", { desc = "Copy selection's GitHub URL" })
      vim.keymap.set("n", "<leader>ggp", "<cmd>!gh pr view --web<CR>", { desc = "Open current pr in browser" })

      vim.keymap.set("n", "<leader>gvb", function()
        local branch = vim.fn.input("Branch: ", vim.g.base_branch)
        if branch ~= "" then
          local f = vim.fn.expand('%:p')
          local cmd = ":Gedit " .. branch .. ":" .. f
          vim.cmd(cmd)
        end
      end, { desc = "View current file on different branch..." })

      vim.keymap.set("n", "<leader>gvd", function()
        local branch = vim.fn.input("Branch: ", vim.g.base_branch)
        if branch ~= "" then
          local cmd = ":Gvdiffsplit " .. branch
          vim.cmd(cmd)
        end
      end, { desc = "Diff current file against a branch..." })

      -- remap some keys to make it more intuitive
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "fugitiveblame", "fugitive" },
        callback = function()
          vim.api.nvim_buf_set_keymap(0, 'n', 'q', 'gq', { silent = true })
          vim.api.nvim_buf_set_keymap(0, 'n', '<tab>', '=', { silent = true })
        end
      })
    end

  },
  {
    'lewis6991/gitsigns.nvim',
    event = 'VeryLazy',
    opts = {
      -- See `:help gitsigns.txt`
      signs = {
        add          = { text = '│' },
        change       = { text = '│' },
        delete       = { text = '_' },
        topdelete    = { text = '‾' },
        changedelete = { text = '~' },
        untracked    = { text = '┆' },
      },
      current_line_blame_opts = {
        virt_text_pos = 'right_align', -- 'eol' | 'overlay' | 'right_align'
      },
      preview_config = {
        -- Options passed to nvim_open_win
        border = 'rounded',
      },
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        -- Navigation
        map({ 'n', 'v' }, ']c', function()
          if vim.wo.diff then
            return ']c'
          end
          vim.schedule(function()
            gs.next_hunk()
          end)
          return '<Ignore>'
        end, { expr = true, desc = 'Jump to next hunk' })

        map({ 'n', 'v' }, '[c', function()
          if vim.wo.diff then
            return '[c'
          end
          vim.schedule(function()
            gs.prev_hunk()
          end)
          return '<Ignore>'
        end, { expr = true, desc = 'Jump to previous hunk' })

        -- Actions
        map('v', '<leader>hs', function()
          gs.stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
        end, { desc = 'stage git hunk' })
        map('v', '<leader>hr', function()
          gs.reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
        end, { desc = 'reset git hunk' })
        -- normal mode
        map('n', '<leader>hs', gs.stage_hunk, { desc = 'git stage hunk' })
        map('n', '<leader>hr', gs.reset_hunk, { desc = 'git reset hunk' })
        map('n', '<leader>hS', gs.stage_buffer, { desc = 'git Stage buffer' })
        map('n', '<leader>hu', gs.undo_stage_hunk, { desc = 'undo stage hunk' })
        map('n', '<leader>hR', gs.reset_buffer, { desc = 'git Reset buffer' })
        map('n', '<leader>hp', gs.preview_hunk, { desc = 'preview git hunk' })
        map('n', '<leader>hb', function()
          gs.blame_line { full = false }
        end, { desc = 'git blame line' })
        map('n', '<leader>hd', gs.diffthis, { desc = 'git diff against index' })
        map('n', '<leader>hD', function()
          gs.diffthis '~'
        end, { desc = 'git diff against last commit' })

        -- Toggles
        map('n', '<leader>tb', gs.toggle_current_line_blame, { desc = 'toggle git blame line' })
        map('n', '<leader>td', gs.toggle_deleted, { desc = 'toggle git show deleted' })

        -- Text object
        map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>', { desc = 'select git hunk' })
      end,
    },
  }

}
