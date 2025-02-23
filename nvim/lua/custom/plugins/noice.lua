return {
  'folke/noice.nvim',
  enabled = true,
  dependencies = {
    "MunifTanjim/nui.nvim",
  },
  event = 'VeryLazy',
  opts = {
    messages = {
      enabled = false,
    },
    notify = {
      enabled = true,
    },
    lsp = {
      -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
      override = {
        ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
        ['vim.lsp.util.stylize_markdown'] = true,
        ['cmp.entry.get_documentation'] = true, -- requires hrsh7th/nvim-cmp
      },
      -- signature = {
      --   auto_open = { enabled = false },
      -- },
    },
    -- status = {
    --   -- Statusline component for LSP progress notifications.
    --   lsp_progress = { event = 'lsp', kind = 'progress' },
    -- },
    -- you can enable a preset for easier configuration
    presets = {
      bottom_search = true,         -- use a classic bottom cmdline for search
      command_palette = false,      -- position the cmdline and popupmenu together
      long_message_to_split = true, -- long messages will be sent to a split
      inc_rename = false,           -- enables an input dialog for inc-rename.nvim
      lsp_doc_border = true,        -- add a border to hover docs and signature help
    },
  },
}
