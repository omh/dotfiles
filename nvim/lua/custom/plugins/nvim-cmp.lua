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

    -- Icons
    'onsails/lspkind.nvim',

    -- Adds a number of user-friendly snippets
    'rafamadriz/friendly-snippets',
  },
  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")

    vim.keymap.set({ "i", "s" }, "<C-e>", function() luasnip.jump(1) end, { silent = true })
    vim.keymap.set({ "i", "s" }, "<C-q>", function() luasnip.jump(-1) end, { silent = true })

    require("luasnip.loaders.from_vscode").lazy_load()
    cmp.setup({
      window = {
        completion = {
          completeopt = "menu,menuone,noselect",
          winhighlight = 'Normal:CmpNormal,FloatBorder:CmpFloatBorder,CursorLine:Visual,Search:None',
        },
        documentation = {
          winhighlight = 'Normal:CmpNormal,FloatBorder:CmpFloatBorder,CursorLine:Visual,Search:None',
        }
      },
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
        ["<tab>"] = cmp.mapping.confirm({ select = true }),
        ["<cr>"] = cmp.mapping.confirm({ select = true }),
      }),
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "buffer" },
        { name = "path" },
      }),
      formatting = {
        format = function(entry, vim_item)
          local kind = require("lspkind").cmp_format({
            mode = "symbol_text",
            maxwidth = 30,
            ellipsis_char = '...',
            before = function(_entry, vim_item2)
              if string.sub(vim_item2.abbr, -1) == "~" then
                vim_item2.abbr = string.sub(vim_item2.abbr, 0, -2)
              end
              return vim_item
            end
          })(entry, vim_item)
          -- hide the menu stuff - the preview window shows all the details anyways
          kind.menu = ""
          return kind
        end
      }
    })
  end
}
