-- Autocompletion
return {
  {
    {
      'saghen/blink.cmp',
      lazy = false, -- lazy loading handled internally
      -- optional: provides snippets for the snippet source
      dependencies = {
        'rafamadriz/friendly-snippets',
        "giuxtaposition/blink-cmp-copilot",
      },

      -- use a release tag to download pre-built binaries
      version = 'v0.*',
      ---@module 'blink.cmp'
      ---@type blink.cmp.Config
      opts = {
        keymap = {
          preset = 'default',
          ['<C-j>'] = { 'select_next', 'fallback' },
          ['<C-k>'] = { 'select_prev', 'fallback' },
        },
        completion = {
          menu = {
            min_width = 20,
            max_height = 15,
            border = "rounded",
            winblend = 5,
            draw = {
              padding = 2,
              treesitter = { 'lsp' },
              columns = {
                { "kind_icon", "label", gap = 2 },
                { "kind" },
              },
            },
          },
          documentation = {
            auto_show = true,
            auto_show_delay_ms = 50,
            window = {
              winblend = 5,
              border = 'rounded',
            },
          },
        },
        appearance = {
          use_nvim_cmp_as_default = false,
          -- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
          -- Adjusts spacing to ensure icons are aligned
          nerd_font_variant = 'nerd',
          kind_icons = {
            Copilot = "",
            Text = '󰉿',
            Method = '󰊕',
            Function = '󰊕',
            Constructor = '󰒓',

            Field = '󰜢',
            Variable = '󰆦',
            Property = '󰖷',

            Class = '󱡠',
            Interface = '󱡠',
            Struct = '󱡠',
            Module = '󰅩',

            Unit = '󰪚',
            Value = '󰦨',
            Enum = '󰦨',
            EnumMember = '󰦨',

            Keyword = '󰻾',
            Constant = '󰏿',

            Snippet = ' ',
            Color = '󰏘',
            File = '󰈔',
            Reference = '󰬲',
            Folder = '󰉋',
            Event = '󱐋',
            Operator = '󰪚',
            TypeParameter = '󰬛',
          },
        },

        -- default list of enabled providers defined so that you can extend it
        -- elsewhere in your config, without redefining it, via `opts_extend`
        sources = {
          default = { 'lsp', 'path', 'snippets', 'buffer', 'copilot' },
          providers = {
            copilot = {
              name = "copilot",
              module = "blink-cmp-copilot",
              transform_items = function(_, items)
                local CompletionItemKind = require("blink.cmp.types").CompletionItemKind
                local kind_idx = #CompletionItemKind + 1
                CompletionItemKind[kind_idx] = "Copilot"
                for _, item in ipairs(items) do
                  item.kind = kind_idx
                end
                return items
              end,
            },
          },
        },
      },
      -- opts_extend = { "sources.default" }
    },
  },
  {
    enabled = false,
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
      -- "zbirenbaum/copilot-cmp",
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")
      -- require("copilot_cmp").setup()

      vim.keymap.set({ "i", "s" }, "<C-e>", function() luasnip.jump(1) end, { silent = true })
      vim.keymap.set({ "i", "s" }, "<C-q>", function() luasnip.jump(-1) end, { silent = true })

      vim.o.pumheight = 15

      vim.cmd [[
      command! LuaSnipEdit :lua require("luasnip.loaders").edit_snippet_files()
    ]]

      require("luasnip.loaders.from_vscode").lazy_load({ paths = { "./snippets" } })
      require("luasnip.loaders.from_vscode").lazy_load()

      local cmp_kinds = {
        Text = ' ',
        Method = ' ',
        Function = ' ',
        Constructor = ' ',
        Field = ' ',
        Variable = ' ',
        Class = ' ',
        Interface = ' ',
        Module = ' ',
        Property = ' ',
        Unit = ' ',
        Value = ' ',
        Enum = ' ',
        Keyword = ' ',
        -- Snippet = ' ',
        Snippet = ' ',
        Color = ' ',
        File = ' ',
        Reference = ' ',
        Folder = ' ',
        EnumMember = ' ',
        Constant = ' ',
        Struct = ' ',
        Event = ' ',
        Operator = ' ',
        TypeParameter = ' ',
      }
      cmp.setup({
        performance = {
          debounce = 100, -- default is 60ms
          throttle = 0,   -- default is 30ms
        },
        preselect = cmp.PreselectMode.None,
        completion = { completeopt = "menu,menuone,noselect,noinsert,popup" },
        experimental = { ghost_text = true },
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end
        },
        window = {
          completion = {
            border = 'rounded',
            winblend = 3,
            winhighlight = 'Normal:Normal,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None',
          },
          documentation = {
            border = 'rounded',
            winblend = 3,
            winhighlight = 'Normal:Normal,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None',
            side_padding = 5,
          }
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
              if luasnip.expandable() then
                luasnip.expand()
              elseif cmp.get_active_entry() then
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
          -- { name = "copilot",  group_index = 4 },
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
            cmp.ItemField.Kind,
            cmp.ItemField.Abbr,
            cmp.ItemField.Menu,
          },
          format = function(entry, item)
            local kind = item.kind
            item.kind = (" %s │ "):format(cmp_kinds[kind])

            item.menu = ("%s "):format(kind)
            item.menu_hl_group = "Comment"

            local source = entry.source.name
            if source == "buffer" then
              item.menu_hl_group = nil
              item.menu = nil
            end

            if string.sub(item.abbr, -1) == "~" then
              item.abbr = string.sub(item.abbr, 0, -2)
            end

            if item.menu then -- Add exta space to visually differentiate `abbr` and `menu`
              item.abbr = ("%s "):format(item.abbr)
            end

            return item
          end
          -- format = function(entry, vim_item)
          --   return require("lspkind").cmp_format({
          --     mode = "symbol",
          --     maxwidth = 60,
          --     symbol_map = { Copilot = "" },
          --     before = function(_, vim_item2)
          --       if string.sub(vim_item2.abbr, -1) == "~" then
          --         vim_item2.abbr = string.sub(vim_item2.abbr, 0, -2)
          --       end
          --       return vim_item2
          --     end
          --   })(entry, vim_item)
          -- end
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
}
