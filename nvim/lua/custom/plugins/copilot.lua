return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    enabled = true,
    event = "InsertEnter",
    opts = {
      -- I don't find the panel useful.
      panel = { enabled = false },
      suggestion = {
        enabled = false,
        auto_trigger = false,
        -- Use alt to interact with Copilot.
        -- keymap = {
        --   -- Disable the built-in mapping, we'll configure it in nvim-cmp.
        --   accept = false,
        --   accept_word = '<C-w>',
        --   accept_line = '<C-l>',
        --   next = '<C-]>',
        --   prev = '<C-[>',
        --   dismiss = '/',
        -- },
      },
      -- filetypes = { markdown = true },
    },
    config = function(_, opts)
      local cmp = require 'cmp'
      local copilot = require 'copilot.suggestion'
      local luasnip = require 'luasnip'

      require('copilot').setup(opts)

      local function set_trigger(trigger)
        vim.b.copilot_suggestion_auto_trigger = trigger
        vim.b.copilot_suggestion_hidden = not trigger
      end

      -- Hide suggestions when the completion menu is open.
      cmp.event:on('menu_opened', function()
        if copilot.is_visible() then
          copilot.dismiss()
        end
        set_trigger(false)
      end)

      -- Disable suggestions when inside a snippet.
      cmp.event:on('menu_closed', function()
        set_trigger(not luasnip.expand_or_locally_jumpable())
      end)
      vim.api.nvim_create_autocmd('User', {
        pattern = { 'LuasnipInsertNodeEnter', 'LuasnipInsertNodeLeave' },
        callback = function()
          set_trigger(not luasnip.expand_or_locally_jumpable())
        end,
      })
    end,
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "canary",
    dependencies = {
      { "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
      { "nvim-lua/plenary.nvim" },  -- for curl, log wrapper
    },
    build = "make tiktoken",        -- Only on MacOS or Linux
    opts = {
      debug = false,                -- Enable debugging
      -- See Configuration section for rest
    },
    -- See Commands section for default commands if you want to lazy load on them
  },
}
