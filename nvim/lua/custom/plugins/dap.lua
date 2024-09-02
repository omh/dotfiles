return {
  'leoluz/nvim-dap-go',
  ft = 'go',
  dependencies = { "mfussenegger/nvim-dap", "rcarriga/nvim-dap-ui" },
  keys = {
    { "<leader>ds", "<cmd>DapNew<cr>",              desc = "New debug session..." },
    { "<leader>db", "<cmd>DapToggleBreakpoint<cr>", desc = "Toggle breakpoint at line" },
    { "<leader>dj", "<cmd>DapStepOver<cr>",         desc = "Step over" },
    { "<leader>dk", "<cmd>DapStepOut<cr>",          desc = "Step out" },
    { "<leader>dl", "<cmd>DapStepInto<cr>",         desc = "Step into" },
    { "<leader>dc", "<cmd>DapContinue<cr>",         desc = "Continue" },
    { "<leader>dS", "<cmd>DapTerminate<cr>",        desc = "Stop session" },
    {
      "<leader>du",
      function()
        -- local widgets = require('dap.ui.widgets');
        -- local sidebar = widgets.sidebar(widgets.scopes);
        -- sidebar.open();
        require("dapui").toggle()
      end,
      desc = "Open debug sidebar"
    },
    {
      "<leader>dt",
      function()
        require('dap-go').debug_test()
      end,
      desc = "Add breakpoint at line"
    },
    {
      "<leader>dr",
      function()
        require('dap-go').debug_last()
      end,
      desc = "Debug last test"
    },
    {
      "<leader>df",
      function()
        require("dapui").float_element("scopes", { enter = true })
      end,
      desc = "Show variable info in float"
    },
  },
  config = function(_, opts)
    require('dap-go').setup(opts)
    require("dapui").setup({
      controls = {
        element = "scopes",
      },
      mappings = {
        expand = { "<tab>", "<2-LeftMouse>" },
      },
      floating = {
        border = "rounded",
      },

      layouts = { {
        elements = {
          {
            id = "repl",
            size = 0.25
          },
          {
            id = "breakpoints",
            size = 0.25
          }, {
          id = "stacks",
          size = 0.25
        }, {
          id = "watches",
          size = 0.25
        } },
        position = "left",
        size = 40
      }, {
        elements = {
          {
            id = "scopes",
            size = 0.50
          }, {
          id = "console",
          size = 0.25
        } },
        position = "bottom",
        size = 10
      } },

    })
  end
}
