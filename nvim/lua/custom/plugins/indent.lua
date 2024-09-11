return {
  "lukas-reineke/indent-blankline.nvim",
  event = "BufRead",
  main = "ibl",
  config = function()
    require("ibl").setup({
      scope = {
        enabled = true,
        show_start = false,
        show_end = false,
      },
      indent = { char = "│" },
    })
  end
}
