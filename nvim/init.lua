vim.g.mapleader = ' '
vim.g.maplocalleader = ','
vim.o.termguicolors = true
vim.g.timeoutlen = 500

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

-- [[ Configure plugins ]]
require('lazy').setup({
  -- require 'kickstart.plugins.debug',
  { import = 'custom.plugins' },
}, {
  change_detection = {
    notify = false, -- get a notification when changes are found
  },
})

-- Set highlight on search
vim.o.hlsearch = true

-- Make line numbers default
vim.wo.number = true
vim.wo.relativenumber = true

-- Enable mouse mode
vim.o.mouse = 'a'

-- Sync clipboard between OS and Neovim.
vim.o.clipboard = 'unnamedplus'

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 400
vim.o.timeoutlen = 300

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- Misc
vim.o.scrolloff = 8
vim.o.swapfile = false
vim.o.showcmd = false
vim.o.showmode = false
vim.o.splitright = true -- split to the right and move to it
vim.o.hidden = true
vim.o.autoindent = true

-- Indenting
vim.o.expandtab = true
vim.o.shiftwidth = 2
vim.o.smartindent = true
vim.o.tabstop = 2
vim.o.softtabstop = 2

-- Searching
vim.cmd [[
  let &grepprg = 'rg --vimgrep'
  let &grepformat = '%f:%l:%c:%m,%f:%l:%m'
]]
-- Folding
vim.o.foldenable = false
vim.o.foldmethod = "expr"
vim.o.foldexpr = "nvim_treesitter#foldexpr()"
vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
-- vim.o.foldopen = vim.o.foldopen - "block"

-- function MyFoldtext()
--   local text = vim.treesitter.foldtext()
--
--   local n_lines = vim.v.foldend - vim.v.foldstart
--   local text_lines = " lines"
--
--   if n_lines == 1 then
--     text_lines = " line"
--   end
--
--   table.insert(text, { " - " .. n_lines .. text_lines, { "Folded" } })
--   table.insert(text, 1, { vim.fn.getline(vim.v.folddashes) .. " ⏵ ", { "Folded" } })
--
--   return text
-- end

-- vim.opt.foldtext = "v:lua.MyFoldtext()"

-- cursorline only in the current window
vim.cmd [[
augroup CursorLine
  au!
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  au WinLeave * setlocal nocursorline
  au FileType TelescopePrompt setlocal nocursorline
augroup END
]]

-- Auto resize panes when resizing nvim window
local autocmd = vim.api.nvim_create_autocmd
autocmd("VimResized", {
  pattern = "*",
  command = "tabdo wincmd =",
})

-- Diagnostics
vim.diagnostic.config {
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = '',
      [vim.diagnostic.severity.WARN] = '',
      [vim.diagnostic.severity.INFO] = '',
      [vim.diagnostic.severity.HINT] = '',
    }
  },
  underline = {
    severity = { min = vim.diagnostic.severity.HINT }
  },
  virtual_text = true,
  float = {
    focusable = true,
  }
}

-- Keymaps for better default experience
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
vim.keymap.set('n', '<esc>', '<CMD> noh <CR>', { desc = "Clear highlights" })

vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = "Page up with cursor in the center" })
vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = "Page down with cursor in the center" })

vim.keymap.set('n', '<leader>Q', ':qa!<CR>', { silent = true, desc = "Quit everything, now!" })
vim.keymap.set('n', '<leader>q', ':q<CR>', { noremap = true, silent = true, desc = "Close window" })
vim.keymap.set('x', 'p', 'p:let @+=@0<CR>:let @"=@0<CR>', { silent = true, desc = "Dont copy replaced text" })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

vim.keymap.set('n', 'p', 'p`[v`]=', { desc = "Paste and format" })
vim.keymap.set('n', 'P', 'P`[v`]=', { desc = "Paste and format" })

-- better indenting
vim.keymap.set('v', '<', '<gv', { noremap = true, silent = true })
vim.keymap.set('v', '>', '>gv', { noremap = true, silent = true })

-- Move selected line / block of text in visual mode
vim.keymap.set('x', 'K', ':move \'<-2<CR>gv-gv', { noremap = true, silent = true })
vim.keymap.set('x', 'J', ':move \'>+1<CR>gv-gv', { noremap = true, silent = true })

-- Window navigation
vim.keymap.set('n', '<leader>wv', [[<Cmd>wincmd v<CR>]], { noremap = true, silent = true })
vim.keymap.set('n', '<leader>ws', [[<Cmd>wincmd s<CR>]], { noremap = true, silent = true })

-- Kill buffers
vim.keymap.set('n', '<leader>bd', '<cmd>BD<cr>', { desc = "Delete buffer without closing the window" })

-- Window sizing
vim.keymap.set('n', "<M-left>", [[<cmd>vertical resize +10<CR>]], { desc = "Grow vertical split" })
vim.keymap.set('n', "<M-up>", [[<cmd>resize -5<CR>]], { desc = "Shrink horizontal split" })
vim.keymap.set('n', "<M-down>", [[<cmd>resize +5<CR>]], { desc = "Grow horisontal split" })
vim.keymap.set('n', "<M-right>", [[<cmd>vertical resize -10<CR>]], { desc = "Shrink vertical split" })

-- tabs
vim.keymap.set('n', "tn", '<CMD>tabnew<CR>', { desc = "Open new tab" })
vim.keymap.set('n', "tq", '<CMD>tabclose<CR>', { desc = "Close tab" })
vim.keymap.set("n", "th", "<cmd>tabprev<CR>", { desc = "Previous tab" })
vim.keymap.set("n", "tl", "<cmd>tabnext<CR>", { desc = "Next tab" })
vim.keymap.set("n", "tj", "<cmd>tabm -1<CR>", { desc = "Move tab left" })
vim.keymap.set("n", "tk", "<cmd>tabm +1<CR>", { desc = "Move tab right" })
vim.keymap.set("n", "tr", function()
  local bufname = vim.fn.input("New tab name: ")
  if bufname ~= "" then
    local cmd = ":TabRename " .. bufname
    vim.cmd(cmd)
  end
end, { desc = "Rename tab" })

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>le', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>lq', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

vim.keymap.set('n', '<leader>ec', [[<cmd>tabnew<CR><CMD>lcd ~/.config/nvim/<CR><CMD>Telescope find_files<CR>]],
  { desc = "Open nvim config in new tab" })

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- document existing key chains
require('which-key').register {
  ['<leader>b'] = { name = '[B]uffer', _ = 'which_key_ignore' },
  ['<leader>c'] = { name = '[C]ode', _ = 'which_key_ignore' },
  ['<leader>e'] = { name = '[E]xplorer', _ = 'which_key_ignore' },
  ['<leader>f'] = { name = '[F]ile | [F]ind', _ = 'which_key_ignore' },
  ['<leader>g'] = { name = '[G]it | Commenting | Movements (lsp)', _ = 'which_key_ignore' },
  ['<leader>gh'] = { name = '[H]unk', _ = 'which_key_ignore' },
  ['<leader>gg'] = { name = '[G]ithub', _ = 'which_key_ignore' },
  ['<leader>h'] = { name = '[H]arpoon', _ = 'which_key_ignore' },
  ['<leader>l'] = { name = '[L]SP', _ = 'which_key_ignore' },
  ['<leader>r'] = { name = '[R]run tests', _ = 'which_key_ignore' },
  ['<leader>s'] = { name = '[S]earch', _ = 'which_key_ignore' },
  ['<leader>t'] = { name = '[T]abs', _ = 'which_key_ignore' },
  ['<leader>v'] = { name = '[V]imux', _ = 'which_key_ignore' },
  ['<leader>w'] = { name = '[W]orkspace | [W]indow', _ = 'which_key_ignore' },
}

-- register which-key VISUAL mode
-- required for visual <leader>hs (hunk stage) to work
require('which-key').register({
  ['<leader>'] = { name = 'VISUAL <leader>' },
  ['<leader>g'] = { '[G]it Hunk' },
}, { mode = 'v' })

-- vim: ts=2 sts=2 sw=2 et
