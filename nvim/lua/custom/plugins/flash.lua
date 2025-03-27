return {
  "folke/flash.nvim",
  event = "VeryLazy",
  keys = {
    { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
  },
  opts = {
    modes = {
      char = {
        autohide = true
      }
    }
  },
}
