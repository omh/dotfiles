return {
  {
    "refractalize/oil-git-status.nvim",
    dependencies = {
      "stevearc/oil.nvim",
    },
    config = true,
  },
  {
    'stevearc/oil.nvim',
    keys = {
      { "-", "<cmd>Oil --float<cr>", desc = "Open file explorer" },
    },
    -- Optional dependencies
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
      local oil = require 'oil'
      -- Delete a file from disk and git
      local function git_rm()
        local cwd = oil.get_current_dir()
        if not cwd then
          vim.notify('Could not retrieve the current directory from oil.nvim', vim.log.levels.ERROR)
          return
        end

        local cursor_entry = oil.get_cursor_entry()
        if not cursor_entry then
          vim.notify('Could not retrieve the file under cursor from oil.nvim', vim.log.levels.ERROR)
          return
        end

        local full_path = string.format('%s/%s', cwd, cursor_entry.name)

        local rm_cmd = string.format('rm -f %s', full_path)
        os.execute(rm_cmd)
        local git_rm_cmd = string.format('git rm -f %s', full_path)
        os.execute(git_rm_cmd)

        -- refresh oil
        vim.cmd.edit({ bang = true })
        vim.cmd.nohlsearch()
      end

      require("oil").setup({
        keymaps = {
          ["q"] = "actions.close",
          ['<Leader>gd'] = function()
            git_rm()
          end,
        },
        view_options = {
          show_hidden = true
        },
        columns = {
          "icon",
        },
        preview_split = "below",
        skip_confirm_for_simple_edits = true,
        float = {
          padding = 4,
          max_width = 80,
          max_height = 30,
        },
        win_options = {
          signcolumn = "yes:2",
        },
      })
    end
  }
}
