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
        debounce = 300,
        auto_trigger = true,
        keymap = {
          accept = '<C-y>',
          accept_word = false,
          accept_line = '<C-y>',
          next = "<M-]>",
          prev = "<M-[>",
          dismiss = "<C-]>",
        },
      },
      -- filetypes = { markdown = true },
    },
    config = function(_, opts)
      -- local cmp = require 'cmp'
      -- local copilot = require 'copilot.suggestion'
      -- local luasnip = require 'luasnip'
      --
      require('copilot').setup(opts)
      -- require('copilot').setup()
      --
      -- local function set_trigger(trigger)
      --   vim.b.copilot_suggestion_auto_trigger = trigger
      --   vim.b.copilot_suggestion_hidden = not trigger
      -- end
      --
      -- -- Hide suggestions when the completion menu is open.
      -- cmp.event:on('menu_opened', function()
      --   if copilot.is_visible() then
      --     copilot.dismiss()
      --   end
      --   set_trigger(false)
      -- end)
      --
      -- -- Disable suggestions when inside a snippet.
      -- cmp.event:on('menu_closed', function()
      --   set_trigger(not luasnip.expand_or_locally_jumpable())
      -- end)
      -- vim.api.nvim_create_autocmd('User', {
      --   pattern = { 'LuasnipInsertNodeEnter', 'LuasnipInsertNodeLeave' },
      --   callback = function()
      --     set_trigger(not luasnip.expand_or_locally_jumpable())
      --   end,
      -- })
    end,
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "main",
    dependencies = {
      { "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
      { "nvim-lua/plenary.nvim" },  -- for curl, log wrapper
    },
    keys = {
      { "<leader>cc", "<cmd>CopilotChatToggle<cr>", mode = "n", desc = "Toggle Copilot Chat" },
      { "<leader>cc", "<cmd>CopilotChatToggle<cr>", mode = "v", desc = "Toggle Copilot Chat" },
      {
        "<leader>cq",
        function()
          require("CopilotChat").open({
            window = {
              layout = 'float',
              relative = 'cursor',
              width = 0.8,
              height = 0.4,
              row = 1,
              col = 0
            }
          })
        end,
        desc = "Copilot Quick Chat"
      },
    },
    build = "make tiktoken", -- Only on MacOS or Linux
    opts = {
      highlight_headers = false,
      separator = '---',
      error_header = '> [!ERROR] Error',
      chat_autocomplete = true,
      debug = false, -- Enable debugging
      mappings = {
        complete = {
          insert = '',
        },
      },
      window = {
        layout = 'vertical', -- 'vertical', 'horizontal', 'float', 'replace'
        border = 'rounded',  -- 'none', single', 'double', 'rounded', 'solid', 'shadow'
      },
    },
  },
}
