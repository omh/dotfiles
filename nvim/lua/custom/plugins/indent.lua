return {
  "lukas-reineke/indent-blankline.nvim",
  event = "BufRead",
  main = "ibl",
  config = function()
    require("ibl").setup({
      scope = {
        enabled = false,
      },
      indent = { char = "" },
    })
  end
}
