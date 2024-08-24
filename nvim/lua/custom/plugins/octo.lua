return {
  'pwntester/octo.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope.nvim',
    'nvim-tree/nvim-web-devicons',
  },
  event = 'VeryLazy',
  config = function()
    require "octo".setup({
      enable_builtin = true,
      suppress_missing_scope = {
        projects_v2 = true,
      }
    })
  end
}
