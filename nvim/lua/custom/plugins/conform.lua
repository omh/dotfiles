return {
  'stevearc/conform.nvim',
  config = function()
    require("conform").setup({
      default_format_opts = {
        lsp_format = "fallback",
      },
    })
  end
}
