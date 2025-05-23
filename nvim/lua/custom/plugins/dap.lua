return {
  'leoluz/nvim-dap-go',
  ft = 'go',
  dependencies = { "mfussenegger/nvim-dap", "rcarriga/nvim-dap-ui", "nvim-neotest/nvim-nio" },
  keys = {
    { "<leader>ds", "<cmd>DapNew<cr>",              desc = "Debug: New Session..." },
    { "<leader>dc", "<cmd>DapContinue<cr>",         desc = "Debug: Continue" },
    { "<leader>db", "<cmd>DapToggleBreakpoint<cr>", desc = "Debug: Toggle Breakpoint at Line" },
    { "<leader>dj", "<cmd>DapStepOver<cr>",         desc = "Debug: Step Over" },
    { "<leader>dk", "<cmd>DapStepOut<cr>",          desc = "Debug: Step Out" },
    { "<leader>dl", "<cmd>DapStepInto<cr>",         desc = "Debug: Step Into" },
    { "<leader>dc", "<cmd>DapContinue<cr>",         desc = "Debug: Continue" },
    { "<leader>de", "<cmd>DapTerminate<cr>",        desc = "Debug: End Session" },
    { "<leader>dr", "<cmd>DapRerun<cr>",            desc = "Debug: Re-run Last Session" },

    {
      "<leader>dB", function()
      require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: '))
    end
    },

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
      "<leader>rdd",
      function()
        require('dap-go').debug_test()
      end,
      desc = "Test: debug current test"
    },
    {
      "<leader>rdl",
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
  config = function(_, _)
    require('dap-go').setup({
      dap_configurations = {
        {
          type = "go",
          name = "Attach remote",
          mode = "remote",
          request = "attach",
          port = "43000",
          host = "127.0.0.1",
        },
      },
    })

    local dap, dapui = require("dap"), require("dapui")
    -- dap.listeners.before.attach.dapui_config = function()
    --   -- @TODO: check if a tab called Debug Session exists already.
    --   vim.cmd("tabnew")
    --   vim.cmd("TabRename Debug Session")
    --   dapui.open()
    -- end
    -- dap.listeners.before.launch.dapui_config = function()
    --   -- @TODO: check if a tab called Debug Session exists already.
    --   vim.cmd("tabnew")
    --   vim.cmd("TabRename Debug Session")
    --   dapui.open()
    -- end
    dap.listeners.before.event_terminated.dapui_config = function()
      dapui.close()
    end
    dap.listeners.before.event_exited.dapui_config = function()
      dapui.close()
    end

    require("dapui").setup({
      expand_lines = true,
      mappings = {
        expand = { "<tab>", "<2-LeftMouse>" },
      },
      floating = {
        border = "rounded",
      },
      layouts = { {
        elements = { {
          id = "scopes",
          size = 0.25
        }, {
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
        size = 80
      }, {
        elements = { {
          id = "repl",
          size = 0.5
        }, {
          id = "console",
          size = 0.5
        } },
        position = "bottom",
        size = 15
      } },
    })
  end
}
