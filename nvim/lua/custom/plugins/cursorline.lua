return {
  'yamatsum/nvim-cursorline',
  config = function()
    require('nvim-cursorline').setup {
      cursorline = {
        enable = false,
      },
      cursorword = {
        enable = true,
        min_length = 3,
        -- hl = { underline = true, sp = "#fab387" },
        hl = { bg = "#2e2e2e", underline = false },
      }
    }
  end
}
