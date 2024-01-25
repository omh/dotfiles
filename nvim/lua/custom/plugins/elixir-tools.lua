-- included mainly for its projectionist support.
return {
  "elixir-tools/elixir-tools.nvim",
  version = "*",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local elixir = require("elixir")

    elixir.setup {
      nextls = { enable = false },
      credo = {},
      elixirls = {
        enable = false,
      }
    }
  end,
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
}
