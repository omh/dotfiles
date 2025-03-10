return {
  'neovim/nvim-lspconfig',
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    -- { 'hrsh7th/nvim-cmp' },
    -- { "iguanacucumber/magazine.nvim" },
    { 'saghen/blink.cmp' },
    -- Useful status updates for LSP
    { 'j-hui/fidget.nvim', opts = {} },
    -- Additional lua configuration, makes nvim stuff amazing!
    'folke/neodev.nvim',
  },

  config = function()
    local lsp = require("lspconfig")
    -- local configs = require("lspconfig/configs")

    -- if not configs.golangcilsp then
    --   configs.golangcilsp = {
    --     default_config = {
    --       cmd = { 'golangci-lint-langserver' },
    --       root_dir = lsp.util.root_pattern('.git', 'go.mod'),
    --       init_options = {
    --         command = { "golangci-lint", "run", "--enable-all", "--disable", "lll", "--out-format", "json", "--issues-exit-code=1" },
    --       }
    --     },
    --   }
    -- end

    vim.fn.sign_define('DiagnosticSignError', { text = '', texthl = 'DiagnosticSignError' })
    vim.fn.sign_define('DiagnosticSignWarn', { text = '', texthl = 'DiagnosticSignWarn' })
    vim.fn.sign_define('DiagnosticSignInfo', { text = '', texthl = 'DiagnosticSignInfo' })
    vim.fn.sign_define('DiagnosticSignHint', { text = '', texthl = 'DiagnosticSignHint' })

    local navic = require("nvim-navic")



    local on_attach = function(client, bufnr)
      vim.diagnostic.config({
        virtual_text = false,
        underline = true,
        signs = false,
        update_in_insert = false,
        -- float = {
        --   border = 'rounded',
        --   source = 'always',
        -- }
      })

      if client.server_capabilities.documentSymbolProvider then
        navic.attach(client, bufnr)
      end

      if client.server_capabilities.documentHighlightProvider then
        local group = vim.api.nvim_create_augroup("LSPDocumentHighlight", { clear = false })
        vim.api.nvim_clear_autocmds({ buffer = bufnr, group = group })

        vim.opt.updatetime = 200

        vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
          buffer = bufnr,
          group = group,
          callback = function()
            vim.lsp.buf.document_highlight()
          end,
        })
        vim.api.nvim_create_autocmd({ "CursorMoved" }, {
          buffer = bufnr,
          group = group,
          callback = function()
            vim.lsp.buf.clear_references()
          end,
        })
      end


      local nmap = function(keys, func, desc)
        if desc then
          desc = 'LSP: ' .. desc
        end

        vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
      end

      nmap('<leader>lr', vim.lsp.buf.rename, 'Rename')
      nmap('<leader>la', vim.lsp.buf.code_action, 'Code Action')
      nmap('<leader>li', "<cmd>LspInfo<cr>", 'LSP Info')

      nmap('<leader>ti', function()
        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
      end, 'Toggle inline hints')

      -- See `:help K` for why this keymap
      nmap('gh', vim.lsp.buf.hover, 'Hover Documentation')
      nmap('K', vim.lsp.buf.signature_help, 'Signature Documentation')

      -- nmap('[d', function()
      --   vim.diagnostic.goto_prev()
      --   vim.diagnostic.open_float()
      -- end, 'Go to previous diagnostic')
      --
      -- nmap(']d', function()
      --   vim.diagnostic.goto_next()
      --   vim.diagnostic.open_float()
      -- end, 'Go to next diagnostic')

      -- Diagnostic keymaps
      vim.keymap.set('n', '<leader>le', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
      vim.keymap.set('n', '<leader>lq', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

      -- Lesser used LSP functionality
      nmap('<leader>lwa', vim.lsp.buf.add_workspace_folder, 'Workspace Add Folder')
      nmap('<leader>lwr', vim.lsp.buf.remove_workspace_folder, 'Workspace Remove Folder')
      nmap('<leader>lwl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      end, 'Workspace List Folders')

      -- Create a command `:Format` local to the LSP buffer
      vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
        vim.lsp.buf.format()
      end, { desc = 'Format current buffer with LSP' })
    end

    -- local capabilities = vim.lsp.protocol.make_client_capabilities()
    -- capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
    -- capabilities = require('blink.cmp').get_lsp_capabilities(capabilities)
    local capabilities = require('blink.cmp').get_lsp_capabilities()


    lsp["html"].setup({ capabilities = capabilities, on_attach = on_attach })
    lsp["cssls"].setup({ capabilities = capabilities, on_attach = on_attach })
    lsp["emmet_ls"].setup({ capabilities = capabilities, on_attach = on_attach })
    lsp["gopls"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
      settings = {
        gopls = {
          analyses = {
            unusedparams = true,
            shadow = false,
            unreachable = true
          },
          hints = {
            parameterNames = true,
            -- functionTypeParameters
            -- constantValues
            -- compositeLiteralTypes
            -- compositeLiteralFields
            -- assignVariableTypes
            -- rangeVariableTypes
          },
          completeUnimported = true,
          usePlaceholders = false,
          staticcheck = true,
          semanticTokens = false,
          semanticTokenTypes = {
            namespace = false,
            type = false,
          },
          -- gofumpt = true,
        }
      }
    })

    lsp["elixirls"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
      cmd = { "/opt/elixirls/release/language_server.sh" },
      elixirLS = {
        dialyzerEnabled = false,
        fetchDeps = false,
        enableTestLenses = false,
        suggestSpecs = false,
      }
    })

    lsp["lua_ls"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
      settings = {
        Lua = {
          workspace = { checkThirdParty = false },
          telemetry = { enable = false },
          hint = { enable = true },
          diagnostics = {
            -- Get the language server to recognize the `vim` global
            globals = { 'vim' },
          },
          -- NOTE: toggle below to ignore Lua_LS's noisy `missing-fields` warnings
          -- diagnostics = { disable = { 'missing-fields' } },
        },
      }
    })

    lsp["golangci_lint_ls"].setup({
      filetypes = { 'go', 'gomod' }
    })

    -- auto config

    -- Switch for controlling whether you want autoformatting.
    --  Use :KickstartFormatToggle to toggle autoformatting on or off
    local format_is_enabled = true
    vim.api.nvim_create_user_command('KickstartFormatToggle', function()
      format_is_enabled = not format_is_enabled
      print('Setting autoformatting to: ' .. tostring(format_is_enabled))
    end, {})

    -- Create an augroup that is used for managing our formatting autocmds.
    --      We need one augroup per client to make sure that multiple clients
    --      can attach to the same buffer without interfering with each other.
    local _augroups = {}
    local get_augroup = function(client)
      if not _augroups[client.id] then
        local group_name = 'kickstart-lsp-format-' .. client.name
        local id = vim.api.nvim_create_augroup(group_name, { clear = true })
        _augroups[client.id] = id
      end

      return _augroups[client.id]
    end

    -- Whenever an LSP attaches to a buffer, we will run this function.
    --
    -- See `:help LspAttach` for more information about this autocmd event.
    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('kickstart-lsp-attach-format', { clear = true }),
      -- This is where we attach the autoformatting for reasonable clients
      callback = function(args)
        local client_id = args.data.client_id
        local client = vim.lsp.get_client_by_id(client_id)
        local bufnr = args.buf

        -- Only attach to clients that support document formatting
        if not client.server_capabilities.documentFormattingProvider then
          return
        end

        -- Tsserver usually works poorly. Sorry you work with bad languages
        -- You can remove this line if you know what you're doing :)
        if client.name == 'tsserver' then
          return
        end

        -- vim.api.nvim_create_autocmd("CursorHold", {
        --   buffer = bufnr,
        --   callback = function()
        --     local opts = {
        --       focusable = false,
        --       close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
        --       border = 'rounded',
        --       source = 'always',
        --       prefix = ' ',
        --       scope = 'cursor',
        --     }
        --     vim.diagnostic.open_float(nil, opts)
        --   end
        -- })

        vim.api.nvim_create_autocmd("BufWritePre", {
          group = get_augroup(client),
          buffer = bufnr,
          callback = function()
            if not format_is_enabled then
              return
            end

            if vim.bo.filetype == "go" then
              local params = vim.lsp.util.make_range_params()
              params.context = { only = { "source.organizeImports" } }
              -- buf_request_sync defaults to a 1000ms timeout. Depending on your
              -- machine and codebase, you may want longer. Add an additional
              -- argument after params if you find that you have to write the file
              -- twice for changes to be saved.
              -- E.g., vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 3000)
              local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params)
              for cid, res in pairs(result or {}) do
                for _, r in pairs(res.result or {}) do
                  if r.edit then
                    local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding or "utf-16"
                    vim.lsp.util.apply_workspace_edit(r.edit, enc)
                  end
                end
              end
            end
            vim.lsp.buf.format({
              async = false,
              filter = function(c)
                return c.id == client.id
              end,
            })
          end
        })
      end,
    })
  end
}
