local vscode = {
  preview = 'main',
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
  },
}

local vscode_med = {
  preview = 'main',
  layout = {
    backdrop = false,
    row = 0.15,
    width = 0.50,
    min_width = 100,
    height = 0.55,
    min_height = 30,
    border = "rounded",
    box = "vertical",
    title = "{title} {live} {flags}",

    { win = "input",   height = 1,          border = "bottom" },
    { win = "list",    border = "none" },
    { win = "preview", title = "{preview}", border = "top",   height = 0.45 },
  },
}

local wide = {
  layout = {
    backdrop = false,
    width = 0.8,
    min_width = 80,
    height = 0.8,
    min_height = 30,
    box = "vertical",
    border = "rounded",
    title = "{title} {live} {flags}",
    title_pos = "center",
    { win = "input",   height = 1,          border = "bottom" },
    { win = "list",    border = "none" },
    { win = "preview", title = "{preview}", height = 0.4,     border = "top" },
  },
}

return {
  'folke/snacks.nvim',
  lazy = false,
  enabled = true,
  priority = 1000,
  keys = {
    { "<leader>ff", function() require('snacks').picker.smart({ layout = vscode }) end,                   desc = "Find files" },
    { "<leader>ss", function() require('snacks').picker.grep({ layout = wide, args = { "--trim" } }) end, desc = "Search" },
    {
      "<leader>ss",
      function()
        require('snacks').picker.grep_word({
          layout = wide,
          regex = false,
        })
      end,
      desc = "Search selected",
      mode = "x"
    },
    { "<leader>fe", function() require('snacks').picker.resume() end,     desc = "Resume" },
    { "<leader>se", function() require('snacks').picker.resume() end,     desc = "Resume" },
    { "<leader>fh", function() require('snacks').picker.highlights() end, desc = "Highlights" },
    {
      "H",
      function()
        require('snacks').picker.buffers({
          layout = vscode,
          win = {
            input = {
              keys = {
                ['d'] = "bufdelete",
              },
              list = {
                ['d'] = "bufdelete",
              },
            }
          }
        })
      end,
      desc = "Buffers"
    },
    {
      "<leader>o",
      function()
        require('snacks').picker.lsp_symbols({
          layout = vscode,
        })
      end,
      desc = "Symbols"
    },
    {
      "<leader>O",
      function()
        require('snacks').picker.lsp_workspace_symbols({
          layout = vscode_med,
        })
      end,
      desc = "Workspace Symbols"
    },
    -- { "<leader>gb", function() require("snacks").git.blame_line() end, desc = "Git blame for current line" },
  },
  opts = {
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
    quickfile = { enabled = false },
    gitbrowse = { enabled = false },
    dashboard = { enabled = false },
    input = { enabled = false },
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
      enabled = false,
    },
    statuscolumn = { enabled = false },
    words = { enabled = false },
  },
}
