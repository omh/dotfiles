vim.pack.add({
  { src = 'https://github.com/folke/snacks.nvim' },
})

require('snacks').setup({
  input = {
    enabled = true,
  },
  dim = { enabled = false },
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
          -- ["<C-Q>"] = { "qflist_append", mode = { "n", "i" } },
        }
      },
      list = {
        keys = {
          ["<C-Q>"] = "qflist_append",
        },
      },
    },
    actions = {
      qflist_append = function(picker)
        local sel = picker:selected()
        local items = #sel > 0 and sel or picker:items()

        picker:close()

        -- append to existing quickfix list instead of replacing it
        vim.fn.setqflist({}, "a", { items = items })
        vim.cmd.copen()
      end,
    },
  },
})

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

_G.med_preview = {
  preview = 'bottom',
  layout = {
    backdrop = false,
    width = 0.60,
    min_width = 140,
    height = 0.80,
    min_height = 40,
    border = "rounded",
    box = "vertical",
    title = "{title} {live} {flags}",

    { win = "input",   height = 1,          border = "bottom" },
    { win = "list",    border = "none" },
    { win = "preview", title = "{preview}", border = "top",   height = 0.65 },
  },
}
