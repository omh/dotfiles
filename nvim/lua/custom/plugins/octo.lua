return {
  'pwntester/octo.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope.nvim',
    'nvim-tree/nvim-web-devicons',
  },
  lazy = true,
  keys = {
    { "<leader>glp", "<cmd>Octo pr list<CR>",      { desc = "List repo PRs" } },
    { "<leader>grb", "<cmd>Octo repo browser<CR>", { desc = "Open repo in browser" } },
  },
  commit = 'c6b0084',
  config = function()
    require "octo".setup({})
  end
}
