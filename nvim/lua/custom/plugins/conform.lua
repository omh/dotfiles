return {
  'stevearc/conform.nvim',
  enabled = false,
  config = function()
    require("conform").setup({
      default_format_opts = {
        lsp_format = "fallback",
      },
    })
  end
}
