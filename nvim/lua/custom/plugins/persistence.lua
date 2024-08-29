return {
  "folke/persistence.nvim",
  event = "BufReadPre", -- this will only start session saving when an actual file was opened
  opts = {},
  keys = {
    {
      "<leader>sl",
      function() require("persistence").load() end,
      desc = 'Load session for the current directory'
    },
    {
      "<leader>sL",
      function() require("persistence").select() end,
      desc = 'Select a session to load'
    },
    {
      "<leader>sO",
      function() require("persistence").load({ last = true }) end,
      desc = 'Load last session'
    },
    {
      "<leader>sD",
      function() require("persistence").stop() end,
      desc = "Don't save session on exist"
    },
  }
}
