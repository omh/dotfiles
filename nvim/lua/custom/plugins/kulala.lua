return {
  'mistweaverco/kulala.nvim',
  keys = {
    {
      "<leader>ko",
      function()
        local dir = vim.fs.basename(vim.fn.getcwd())
        vim.cmd.tabnew()
        vim.cmd(":TabRename API Testing")
        vim.cmd("e ~/code/http/" .. dir .. ".http")
      end,
      desc = "Open project Kulala file in new tab"
    },
    {
      "<leader>kO",
      function()
        local dir = vim.fs.basename(vim.fn.getcwd())
        vim.cmd("e ~/code/http/" .. dir .. ".http")
      end,
      desc = "Open project Kulala file in current window"
    },
    {
      "<leader>kq", "<CMD>lua require('kulala').close()<CR>", desc = "Close Kulala"
    }
  },
  opts = {}
}
