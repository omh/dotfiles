return {
  "dnlhc/glance.nvim",
  keys = {
    { "gr", "<cmd>Glance references<cr>",  { desc = "Show references" } },
    { "gD", "<cmd>Glance definitions<cr>", { desc = "Show definitions" } },
  },
  config = function()
    require('glance').setup({
      detached = true,
    })
  end,
}
