return {
  'leoluz/nvim-dap-go',
  ft = 'go',
  dependencies = { "mfussenegger/nvim-dap", "rcarriga/nvim-dap-ui" },
  keys = {
    { "<leader>db", "<cmd>DapToggleBreakpoint<cr>", desc = "Toggle breakpoint at line" },
    { "<leader>dj", "<cmd>DapStepOver<cr>",         desc = "Step over" },
    { "<leader>dk", "<cmd>DapStepOut<cr>",          desc = "Step out" },
    { "<leader>dl", "<cmd>DapStepInto<cr>",         desc = "Step into" },
    { "<leader>dc", "<cmd>DapContinue<cr>",         desc = "Continue" },
    { "<leader>dS", "<cmd>DapTerminate<cr>",        desc = "Stop session" },
    { "<leader>ds", function()
      -- local widgets = require('dap.ui.widgets');
      -- local sidebar = widgets.sidebar(widgets.scopes);
      -- sidebar.open();
      require("dapui").toggle()
    end, { desc = "Open debug sidebar" } },
    {
      "<leader>dt", function()
      require('dap-go').debug_test()
    end, { desc = "Add breakpoint at line" }
    },
    {
      "<leader>dr", function()
      require('dap-go').debug_last()
    end, { desc = "Debug last test" }
    },
    {
      "<leader>df", function()
      require("dapui").float_element("scopes", { enter = true })
    end, { desc = "Show variable info in float" }
    },
  },
  config = function(_, opts)
    require('dap-go').setup(opts)
    require("dapui").setup()
  end
}
