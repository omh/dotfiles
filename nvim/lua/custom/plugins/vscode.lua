return {
  'Mofiqul/vscode.nvim',
  priority = 4000,
  enabled = false,
  config = function()
    local c = require('vscode.colors').get_colors()

    require('vscode').setup {
      group_overrides = {
        TabLine                     = { fg = c.vscGitIgnored, bg = 'NONE' },
        TabLineSel                  = { fg = c.vscFront, bg = 'NONE' },
        TabLineFill                 = { fg = c.vscSplitDark, bg = 'NONE', strikethrough = true },

        TreesitterContext  = { bg = 'none' },
        TreesitterContextSeparator  = { fg = c.vscSplitDark, bg = 'none', strikethrough = true },
        TreesitterContextLineNumber = { fg = c.vscLineNumber, bg = 'none' },
        LocalHighlight              = { underline = true },
        IblIndent                   = { fg = '#2A2A2A' },
      },
    }
    vim.cmd.colorscheme "vscode"
  end,
}
