vim.g.mapleader      = ' '                             -- <space> all the way
vim.g.maplocalleader = ','                             -- local leader
vim.o.laststatus     = 0                               -- hiden statusline
vim.o.showcmd        = false                           -- don't show current cmd
vim.o.cmdheight      = 0                               -- no command line by default
vim.o.statusline     = " "                             -- no statusline text
vim.o.winborder      = 'rounded'                       -- roudned border for all popups
vim.o.winblend       = 6                               -- a bit of transparency
vim.o.shell          = "/bin/bash -i"                  -- make switching in tmux faster
vim.o.breakindent    = true                            -- indent wrapped lines
vim.o.expandtab      = true                            -- use the appropriate number of spaces to insert a tab
vim.o.shiftwidth     = 2                               -- number of columns for one level of indentation
vim.o.smartindent    = true                            -- indent when starting a new line
vim.o.autoindent     = true                            -- copy indent from current line when starting new line
vim.o.tabstop        = 2                               -- how big a tab is
vim.o.softtabstop    = 2                               -- move to next tab instead of inserting <tab> chars.
vim.o.mouse          = 'a'                             -- enable mouse mode
vim.o.clipboard      = 'unnamedplus'                   -- os clipboard
vim.o.number         = true                            -- show line numbers
vim.o.relativenumber = true                            -- relative line numberes
vim.o.scrolloff      = 20                              -- scroll before hitting top/bottom
vim.o.splitright     = true                            -- split to the right and move to it
vim.o.title          = true                            -- set window title
vim.o.cursorline     = true                            -- enable cursorline
vim.o.foldenable     = false                           -- don't fold by default
vim.o.foldmethod     = "expr"                          -- use expr to determine folds
vim.o.foldcolumn     = '0'                             -- don't show the annoying fold dept
vim.o.foldtext       = ''                              -- use normal highlighting for folded text
vim.o.ignorecase     = true                            -- case insensitive search
vim.o.smartcase      = true                            -- unless we start with a capital letter
vim.o.hlsearch       = true                            -- highlight search as you type
vim.o.inccommand     = 'nosplit'                       -- show search/replace preview in buffer
vim.o.undofile       = true                            -- save undo history
vim.o.hidden         = true                            -- don't discard hidden terminals
vim.o.completeopt    = 'menuone,nearest,preview,fuzzy' -- better autocomp
vim.g.showtabline    = 1                               -- show if two or more tabs
vim.o.pumheight      = 14                              -- Limits completion items to 10
vim.o.pumblend       = 8                               -- A bit of transparency
vim.g.pummaxwidth    = 120                             -- not too wide completion menu.
vim.o.swapfile       = false                           -- no swap files please
vim.o.wildmode       = 'noselect:lastused,full'
vim.o.wildoptions    = 'fuzzy,pum,tagfile'             -- fuzzy cmd line matching

vim.bo.indentexpr    =
"v:lua.require'nvim-treesitter'.indentexpr()" -- how to indent
vim.o.foldexpr       =
"v:lua.vim.treesitter.foldexpr()"             -- how to do folds
vim.o.completeopt    = 'menuone,noselect,fuzzy'

vim.opt.fillchars    = {
  eob = " ",
  diff = "╱",
  foldopen = "", -- open fold arrow (down)
  foldclose = ">", -- closed fold arrow (right)
  foldsep = " ", -- separator
  fold = " ", -- filler inside foldcolumn
  msgsep = "━",
  horiz = "━",
  horizup = "┻",
  horizdown = "┳",
  vert = "┃",
  vertleft = "┫",
  vertright = "┣",
  verthoriz = "╋",
}
-- Use fancy disclosure triangles
vim.o.foldcolumn     = "auto"

-- -- use nice color highlighting in the command line
-- require('vim._extui').enable({ enable = true })

vim.opt.listchars    = {
  nbsp = "␣",
  tab = "  ",
  trail = "·",
}
vim.opt.diffopt      = {
  "internal",
  "filler",
  "linematch:60",
  "vertical",
  "inline:word",
  "algorithm:histogram",
}

require("config.globals")
require("config.autocmds")
require("config.lsp")

require("plugins.icons")
require("plugins.treesitter")

require("plugins.colorscheme")
require("plugins.dap")
require("plugins.git")
require("plugins.glance")
require("plugins.kulala")
require("plugins.logging")
require("plugins.mini")
require("plugins.oil")
require("plugins.other")
require("plugins.projectionist")
require("plugins.quickfix")
require("plugins.rainbow")
require("plugins.snacks")
require("plugins.testing")
require("plugins.treesitter-context")

require('ui.statusline')

require("config.keys")
