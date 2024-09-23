return {
  {
    'stevearc/quicker.nvim',
    event = "FileType qf",
    opts = {},
  },

  -- nice quicklist preview
  "kevinhwang91/nvim-bqf",
  config = function()
    require("bqf").setup {
      preview = {
        winblend = 0,
      },
    }
  end,
}
