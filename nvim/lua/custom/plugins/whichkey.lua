-- show/browse keybindings
return {
  'folke/which-key.nvim',
  event = "VeryLazy",
  opts = {
    preset = 'modern',
    delay = function(ctx)
      return ctx.plugin and 0 or 400
    end,
    win = {
      wo = {
        winblend = 3,
      }
    },
  },
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer Local Keymaps (which-key)",
    },
  },
}
