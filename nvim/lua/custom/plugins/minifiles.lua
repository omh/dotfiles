return {
  {
    'echasnovski/mini.files',
    version = '*',
    keys = {
      { "<leader>fe", "<cmd>lua MiniFiles.open(vim.api.nvim_buf_get_name(0), false) <CR>", desc = "Open Mini Files at current file's directory" },
    },
    config = function()
      require('mini.files').setup({
        windows = {
          preview = true,
          width_preview = 50,
        },
        mappings = {
          synchronize = 's'
        },
      })
    end
  },
}
