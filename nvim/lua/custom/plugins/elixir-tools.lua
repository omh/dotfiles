-- included mainly for its projectionist support.
return {
  "elixir-tools/elixir-tools.nvim",
  version = "*",
  event = { "BufReadPre", "BufNewFile" },
  enabled = true,
  config = function()
    local elixir = require("elixir")
    local elixirls = require("elixir.elixirls")

    elixir.setup {
      nextls = { enable = false },
      credo = { enable = false },
      elixirls = {
        tag = "v0.20.0",
        enable = false,
        settings = elixirls.settings {
          dialyzerEnabled = false,
          fetchDeps = false,
          enableTestLenses = false,
          suggestSpecs = false,
        },
        -- on_attach = function(_client, bufnr)
        --   -- vim.keymap.set("n", "<space>fp", ":ElixirFromPipe<cr>", { buffer = true, noremap = true })
        --   -- vim.keymap.set("n", "<space>tp", ":ElixirToPipe<cr>", { buffer = true, noremap = true })
        --   -- vim.keymap.set("v", "<space>em", ":ElixirExpandMacro<cr>", { buffer = true, noremap = true })
        --   local nmap = function(keys, func, desc)
        --     if desc then
        --       desc = 'Elixir LSP: ' .. desc
        --     end
        --
        --     vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
        --   end
        --
        --   nmap('<leader>lr', vim.lsp.buf.rename, 'Rename')
        --   nmap('<leader>la', vim.lsp.buf.code_action, 'Code Action')
        --   nmap('gd', '<cmd>lua vim.lsp.buf.definition()<cr>', 'Goto Definition')
        --   nmap('gI', '<cmd>lua vim.lsp.buf.implementation()<cr>', 'Goto Implementation')
        --   nmap('<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<cr>', 'Type Definition')
        --   nmap('gh', vim.lsp.buf.hover, 'Hover Documentation')
        --   nmap('K', vim.lsp.buf.signature_help, 'Signature Documentation')
        --
        --   nmap('<leader>o', function()
        --     local drop_config = require('custom.telescope_config').drop
        --     require('telescope.builtin').lsp_document_symbols(drop_config)
        --   end, 'Document Symbols')
        --   nmap('<leader>O', function()
        --     local drop_config = require('custom.telescope_config').drop
        --     require('telescope.builtin').lsp_dynamic_workspace_symbols(drop_config)
        --   end, '[W]orkspace [S]ymbols')
        -- end
      }
    }
  end,
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
}
