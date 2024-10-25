-- Autocompletion
return {
  -- "hrsh7th/nvim-cmp",
  "iguanacucumber/magazine.nvim",
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
    "zbirenbaum/copilot-cmp",
  },
  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")
    require("copilot_cmp").setup()

    vim.keymap.set({ "i", "s" }, "<C-e>", function() luasnip.jump(1) end, { silent = true })
    vim.keymap.set({ "i", "s" }, "<C-q>", function() luasnip.jump(-1) end, { silent = true })

    vim.o.pumheight = 15

    require("luasnip.loaders.from_vscode").lazy_load()
    local types = require("cmp.types")

    cmp.setup({
      -- performance = {
      --   debounce = 0, -- default is 60ms
      --   throttle = 0, -- default is 30ms
      -- },
      preselect = cmp.PreselectMode.None,
      completion = { completeopt = "menu,menuone,noselect" },
      experimental = { ghost_text = true },
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end
      },
      window = {
        completion = cmp.config.window.bordered({
          winblend = 5,
        }),
        documentation = cmp.config.window.bordered({
          winblend = 5,
        })
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-j>"] = cmp.mapping.select_next_item(),
        ["<C-k>"] = cmp.mapping.select_prev_item(),
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-u>"] = cmp.mapping.scroll_docs(4),
        ["<C-space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            -- if luasnip.expandable() then
            --   luasnip.expand()
            if cmp.get_active_entry() then
              cmp.confirm({ select = false })
            else
              fallback()
            end
          else
            fallback()
          end
        end),
        ['<Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            if #cmp.get_entries() == 1 then
              cmp.confirm({ select = true })
            else
              cmp.select_next_item()
            end
          elseif luasnip.jumpable(1) then
            luasnip.jump(1)
          else
            fallback()
          end
        end, { 'i', 's' }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.locally_jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
      }),
      sources = cmp.config.sources({
        { name = "nvim_lsp", group_index = 1 },
        { name = "luasnip",  group_index = 2 },
        { name = "buffer",   group_index = 2, keyword_length = 5, max_item_count = 5 },
        { name = "path",     group_index = 3 },
        { name = "copilot",  group_index = 4 },
      }),
      sorting = {
        comparators = {
          cmp.config.compare.score,
          cmp.config.compare.order,
          cmp.config.compare.offset,
          cmp.config.compare.exact,
          cmp.config.compare.kind,
          cmp.config.compare.sort_text,
          -- cmp.config.compare.length,
        }
      },
      formatting = {
        fields = {
          cmp.ItemField.Abbr,
          cmp.ItemField.Kind,
          cmp.ItemField.Menu,
        },
        format = function(entry, vim_item)
          return require("lspkind").cmp_format({
            mode = "symbol_text",
            maxwidth = 60,
            symbol_map = { Copilot = "" },
            before = function(_, vim_item2)
              if string.sub(vim_item2.abbr, -1) == "~" then
                vim_item2.abbr = string.sub(vim_item2.abbr, 0, -2)
              end
              return vim_item2
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
