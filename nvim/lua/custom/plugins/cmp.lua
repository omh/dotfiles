-- Autocompletion
return {
  {
    {
      'saghen/blink.cmp',
      lazy = false, -- lazy loading handled internally
      -- optional: provides snippets for the snippet source
      dependencies = {
        'rafamadriz/friendly-snippets',
        'giuxtaposition/blink-cmp-copilot',
        'L3MON4D3/LuaSnip',
      },

      version = '1.*',

      ---@module 'blink.cmp'
      ---@type blink.cmp.Config
      opts = {
        keymap = {
          preset = 'super-tab',
          ['<C-j>'] = { 'select_next', 'fallback' },
          ['<C-k>'] = { 'select_prev', 'fallback' },
        },
        signature = {
          enabled = true,
          window = {
            border = 'rounded',
          }
        },
        completion = {
          list = {
            selection = {
              preselect = function(ctx) return ctx.mode ~= 'cmdline' end,
              auto_insert = function(ctx) return ctx.mode ~= 'cmdline' end
            }
          },
          menu = {
            border = "rounded",
            draw = {
              treesitter = { 'lsp' },
              columns = {
                { "kind_icon", gap = 2 },
                { "label",     "label_description", gap = 2, width = { max = 10 } },
              },
              components = {
                label = {
                  width = { max = 40 },
                },
                label_description = {
                  width = { max = 40 },
                }
              }
            },
          },
          documentation = {
            auto_show = true,
            auto_show_delay_ms = 0,
            window = {
              border = 'rounded',
            },
          },
          ghost_text = { enabled = true },
        },
        snippets = { preset = 'luasnip' },
        appearance = {
          use_nvim_cmp_as_default = true,
          kind_icons = {
            Copilot = " ",
            Text = "",
            Method = "",
            Function = "",
            Constructor = "",
            Field = "",
            Variable = "",
            Class = "",
            Interface = "",
            Module = "",
            Property = "",
            Unit = "",
            Value = "",
            Enum = "",
            Keyword = "",
            Snippet = "",
            Color = "",
            File = "",
            Reference = "",
            Folder = "",
            EnumMember = "",
            Constant = "",
            Struct = "",
            Event = "",
            Operator = "",
            TypeParameter = "",
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
}
