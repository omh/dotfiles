return {
  "lukas-reineke/indent-blankline.nvim",
  version = "2.20.7",
  event = "BufRead",
  config = function()
    require("indent_blankline").setup({
      show_trailing_blankline_indent = false,
      show_first_indent_level = false,
      show_current_context = false,
      show_current_context_start = false,
      use_treesitter = true,
    })
  end
}
