return {
  'echasnovski/mini.files',
  version = '*',
  keys = {
    { "<leader>fe", "<cmd>lua MiniFiles.open(vim.api.nvim_buf_get_name(0))<CR>", { desc = "Open file explorer" } },
  },
  config = function()
    require 'mini.files'.setup({
      mappings = {
        synchronize = 's',
      },
      windows = {
        width_preview = 50,
        preview = true,
      }
    })
  end,
}
