vim.defer_fn(function()
  vim.pack.add({
    { src = 'https://github.com/nvim-mini/mini.nvim' },
  })


  require('mini.ai').setup()
  require('mini.completion').setup({
    delay = { completion = 50, signature = 50 },
  })
  require('mini.icons').tweak_lsp_kind()
  require('mini.jump').setup()

  local gen_loader = require('mini.snippets').gen_loader
  require('mini.snippets').setup({
    snippets = {
      gen_loader.from_file('~/.config/nvim/snippets/global.json'),
      -- Load snippets based on current language by reading files from
      -- "snippets/" subdirectories from 'runtimepath' directories.
      gen_loader.from_lang(),
    },
  })

  local make_stop = function()
    local au_opts = { pattern = '*:n', once = true }
    au_opts.callback = function()
      while MiniSnippets.session.get() do
        MiniSnippets.session.stop()
      end
    end
    vim.api.nvim_create_autocmd('ModeChanged', au_opts)
  end
  local opts = { pattern = 'MiniSnippetsSessionStart', callback = make_stop }
  vim.api.nvim_create_autocmd('User', opts)


  require('mini.surround').setup()

  local miniclue = require("mini.clue")
  miniclue.setup({
    triggers = {
      -- Leader triggers
      { mode = 'n', keys = '<Leader>' },
      { mode = 'x', keys = '<Leader>' },

      -- Built-in completion
      { mode = 'i', keys = '<C-x>' },

      -- `g` key
      { mode = 'n', keys = 'g' },
      { mode = 'x', keys = 'g' },

      -- Marks
      { mode = 'n', keys = "'" },
      { mode = 'n', keys = '`' },
      { mode = 'x', keys = "'" },
      { mode = 'x', keys = '`' },

      -- Registers
      { mode = 'n', keys = '"' },
      { mode = 'x', keys = '"' },
      { mode = 'i', keys = '<C-r>' },
      { mode = 'c', keys = '<C-r>' },

      -- Window commands
      { mode = 'n', keys = '<C-w>' },

      -- `z` key
      { mode = 'n', keys = 'z' },
      { mode = 'x', keys = 'z' },
    },
    clues = {
      -- Enhance this by adding descriptions for <Leader> mapping groups
      { mode = 'n', keys = "<leader>b",     desc = "Buffer" },
      -- { mode = 'n', keys = "<leader>c",     desc = "Code" },
      -- { mode = 'n', keys = "<leader>d",     desc = "Diff | Debug" },
      { mode = 'n', keys = "<leader>f",     desc = "File | Find" },
      { mode = 'n', keys = "<leader>g",     desc = "Git | Commenting" },
      { mode = 'n', keys = "<leader>gg",    desc = "Github" },
      { mode = 'n', keys = "<leader>h",     desc = "Hunk" },
      -- { mode = 'n', keys = "<leader>k",     desc = "Kulala" },
      { mode = 'n', keys = "<leader>r",     desc = "Run tests" },
      -- { mode = 'n', keys = "<leader>s",     desc = "Search | Sessions" },
      { mode = 'n', keys = "<leader>l",     desc = "LSP" },
      { mode = 'n', keys = "<leader>p",     desc = "Packages" },
      { mode = 'n', keys = "<leader><tab>", desc = "Tabs" },
      { mode = 'n', keys = "<leader>t",     desc = "Toggle" },
      -- { mode = 'n', keys = "<leader>u",     desc = "Rsync" },
      { mode = 'n', keys = "<leader>q",     desc = "Quit" },

      miniclue.gen_clues.square_brackets(),
      miniclue.gen_clues.builtin_completion(),
      miniclue.gen_clues.g(),
      miniclue.gen_clues.marks(),
      miniclue.gen_clues.registers(),
      miniclue.gen_clues.windows(),
      miniclue.gen_clues.z(),
    },

  })
end, 200)
