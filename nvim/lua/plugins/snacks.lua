vim.defer_fn(function()
  vim.pack.add({
    { src = 'https://github.com/folke/snacks.nvim' },
  })

  require('snacks').setup({
    input = {
      enabled = true,
    },
    indent = {
      enabled = true,
      indent = {
        enabled = true, -- enable indent guides
        only_current = true,
        hl = 'SnacksIndent',
      },
      animate = {
        duration = {
          step = 25,   -- ms per step
          total = 200, -- maximum duration
        },
      },
      scope = {
        enabled = true,
      },
      chunk = {
        enabled = false,
        only_current = true,
      },
    },
    notifier = {
      enabled = true,
    },
    picker = {
      formatters = {
        file = {
          filename_first = true,
          truncate = 80
        },
      },
      win = {
        input = {
          keys = {
            ["<Esc>"] = { "close", mode = { "n", "i" } },
          }
        }
      }
    },
  })
end, 200)

_G.vscode = {
  preview = false,
  layout = {
    backdrop = false,
    row = 0.10,
    width = 0.30,
    min_width = 80,
    height = 0.35,
    min_height = 20,
    border = "rounded",
    box = "vertical",
    title = "{title} {live} {flags}",

    { win = "input",   height = 1,          border = "bottom" },
    { win = "list",    border = "none" },
    { win = "preview", title = "{preview}", border = "top",   height = 0.45 },
  }
}

_G.vscode_med = {
  preview = 'main',
  layout = {
    backdrop = false,
    row = 0.15,
    width = 0.60,
    min_width = 100,
    height = 0.35,
    min_height = 30,
    border = "rounded",
    box = "vertical",
    title = "{title} {live} {flags}",

    { win = "input",   height = 1,          border = "bottom" },
    { win = "list",    border = "none" },
    { win = "preview", title = "{preview}", border = "none",  height = 0.45 },
  },
}
