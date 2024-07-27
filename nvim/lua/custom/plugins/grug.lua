-- search/replace
return {
  'MagicDuck/grug-far.nvim',
  keys = {
    { "<leader>sr", "<cmd>GrugFar<cr>", desc = "Search and replace (Grug)" }
  },
  config = function()
    require('grug-far').setup({});
  end
}
