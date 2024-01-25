return {
  "folke/noice.nvim",
  event = "VeryLazy",
  enabled = true,
  opts = {
    messages = {
      enabled = false,
    },
    notify = {
      enabled = false,
    },
    lsp = {
      -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
        ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
      },
    },
  },
  dependencies = {
    "MunifTanjim/nui.nvim",
  }
}
