vim.defer_fn(function()
  vim.pack.add({
    { src = 'https://github.com/mfussenegger/nvim-dap' },
    { src = 'https://github.com/leoluz/nvim-dap-go' },
    { src = 'https://github.com/igorlfs/nvim-dap-view' },
  })

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
  require('dap-view').setup({
    winbar = {
      controls = {
        enabled = true
      }
    },
    auto_toggle = true,
  })
end, 150)
