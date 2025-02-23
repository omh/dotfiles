return {
  {
    'echasnovski/mini.ai',
    version = '*',
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require('mini.ai').setup()
    end
  },
  {
    'echasnovski/mini.cursorword',
    version = '*',
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require('mini.cursorword').setup()
    end
  },
}
