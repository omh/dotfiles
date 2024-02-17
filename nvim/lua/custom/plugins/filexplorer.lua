return {
  'simonmclean/triptych.nvim',
  keys = {
    { "<leader>fe", "<cmd>Triptych<CR>", { desc = "Open file explorer" } },
  },
  dependencies = {
    'nvim-lua/plenary.nvim',       -- required
    'nvim-tree/nvim-web-devicons', -- optional
  },
  config = function()
    require 'triptych'.setup()
  end
}
