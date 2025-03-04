return {
  {
    'echasnovski/mini.ai',
    version = '*',
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require('mini.ai').setup()
    end
  },
}
