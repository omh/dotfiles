return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    enabled = true,
    event = "InsertEnter",
    opts = {
      -- I don't find the panel useful.
      panel = { enabled = true },
      suggestion = {
        enabled = true,
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
      require('copilot').setup(opts)
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
      model = 'gpt-4.1',
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
