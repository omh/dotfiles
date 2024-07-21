return {
  'stevearc/oil.nvim',
  keys = {
    { "-", "<cmd>Oil --float<cr>", { desc = "Open file explorer" } },
  },
  -- Optional dependencies
  dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
  config = function()
    require("oil").setup({
      keymaps = {
        ["q"] = "actions.close",
      },
      view_options = {
        show_hidden = true
      },
      columns = {
        "icon",
      },
      float = {
        padding = 4,
        max_width = 120,
        max_height = 80,
      },
      win_options = {
        winblend = 10,
      },
    })
  end
}
