-- Autocompletion
return {
  "hrsh7th/nvim-cmp",
  event = { "InsertEnter", "CmdlineEnter" },
  dependencies = {
    -- Snippet Engine & its associated nvim-cmp source
    'L3MON4D3/LuaSnip',
    'saadparwaiz1/cmp_luasnip',

    -- Adds LSP completion capabilities
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-cmdline',

    -- Icons
    'onsails/lspkind.nvim',

    -- Adds a number of user-friendly snippets
    'rafamadriz/friendly-snippets',

    -- copilot integration
    -- "zbirenbaum/copilot-cmp",
  },
  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")
    -- require("copilot_cmp").setup()

    vim.keymap.set({ "i", "s" }, "<C-e>", function() luasnip.jump(1) end, { silent = true })
    vim.keymap.set({ "i", "s" }, "<C-q>", function() luasnip.jump(-1) end, { silent = true })

    require("luasnip.loaders.from_vscode").lazy_load()

    cmp.setup({
      preselect = cmp.PreselectMode.None,
      completion = { completeopt = "menu,menuone" },
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-j>"] = cmp.mapping.select_next_item(),
        ["<C-k>"] = cmp.mapping.select_prev_item(),
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-u>"] = cmp.mapping.scroll_docs(4),
        ["<C-space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        ['<Tab>'] = cmp.mapping(function(fallback)
          if luasnip.expandable() then
            luasnip.expand()
          elseif cmp.visible() then
            cmp.confirm({ select = true })
          elseif luasnip.jumpable(1) then
            luasnip.jump(1)
          else
            fallback()
          end
        end, { 'i', 's' }),
        ["<cr>"] = cmp.mapping.confirm({ select = false }),
      }),
      sources = cmp.config.sources({
        -- { name = "copilot" },
        { name = "luasnip" },
        { name = "nvim_lsp" },
        { name = "buffer",  keyword_length = 5, max_item_count = 5 },
        { name = "path" },
      }),
      formatting = {
        fields = {
          cmp.ItemField.Abbr,
          cmp.ItemField.Kind,
          cmp.ItemField.Menu,
        },
        format = function(entry, vim_item)
          return require("lspkind").cmp_format({
            mode = "symbol_text",
            maxwidth = 50,
            before = function(_, vim_item2)
              if string.sub(vim_item2.abbr, -1) == "~" then
                vim_item2.abbr = string.sub(vim_item2.abbr, 0, -2)
              end
              return vim_item
            end
          })(entry, vim_item)
        end
      }
    })
    -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline({ '/', '?' }, {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = 'buffer' }
      }
    })

    -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline(':', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = 'path' }
      }, {
        { name = 'cmdline' }
      })
    })
  end
}
