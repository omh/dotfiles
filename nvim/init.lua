vim.g.mapleader = ' '
vim.g.maplocalleader = ','
vim.o.termguicolors = true
vim.g.timeoutlen = 500
vim.g.base_branch = 'origin/main'


vim.cmd [[
  set noshowmode
  set noruler
  set laststatus=3
  set noshowcmd
  set cmdheight=1

  set statusline=\         " hide file name in statusline
  set fillchars=stl:\      " fill active window's statusline with empty space
  set fillchars+=stlnc:\   " also fill inactive windows
  set fillchars+=diff:\

  set formatoptions-=a
  set diffopt+=linematch:60,algorithm:histogram,foldcolumn:0

  set mousemoveevent
  "let &stc='%s%=%{v:relnum?v:relnum:v:lnum} '

  set bg=dark
]]

if vim.g.neovide then
  vim.o.guifont = "Victor Mono:h13"

  vim.g.neovide_scroll_animation_length = 0.01
  vim.g.neovide_theme = 'dark'
  vim.g.neovide_cursor_animation_length = 0
  vim.g.neovide_cursor_vfx_mode = ""

  vim.g.neovide_padding_top = 4
  vim.g.neovide_padding_bottom = 4
  vim.g.neovide_padding_right = 4
  vim.g.neovide_padding_left = 4

  vim.g.neovide_floating_shadow = true
  vim.g.neovide_floating_z_height = 10
  vim.g.neovide_light_angle_degrees = 45
  vim.g.neovide_light_radius = 5
end

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
  rocks = {
    enabled = false
  },
  change_detection = {
    notify = false, -- get a notification when changes are found
  },
})

-- Set highlight on search
vim.o.hlsearch = true

-- line numbers
vim.wo.number = false
vim.wo.relativenumber = false

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
vim.o.signcolumn = 'yes:2'

-- Decrease update time
vim.o.updatetime = 400
vim.o.timeoutlen = 300

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menu,menuone,noselect'

-- Misc
vim.o.scrolloff = 20
vim.o.swapfile = false
vim.o.showcmd = false
vim.o.showmode = true
vim.o.splitright = true -- split to the right and move to it
vim.o.hidden = true
vim.o.autoindent = true
vim.o.winborder = 'rounded'

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
vim.o.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.o.foldcolumn = '0'
vim.o.foldtext = ''
vim.o.fillchars = 'eob: ,fold: ,foldopen:,foldclose:,diff:╱'

-- cursorline only in the current window
vim.cmd [[
augroup CursorLine
  au!
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  "au VimEnter,WinEnter,BufWinEnter * echo &filetype
  au WinLeave * setlocal nocursorline
  au FocusLost * setlocal nocursorline
  au FocusGained * setlocal cursorline
  "au FileType TelescopePrompt setlocal nocursorline
  au FileType snacks_picker_input set nocursorline
augroup END
]]

vim.api.nvim_create_autocmd("VimResized", {
  pattern = "*",
  callback = function()
    vim.cmd [[
      let savetab = tabpagenr()
      tabdo wincmd =
      execute 'tabnext' savetab
    ]]
  end
})
--
-- close some filetypes with <q>
vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("close_with_q", { clear = true }),
  pattern = {
    "PlenaryTestPopup",
    "checkhealth",
    "dbout",
    "gitsigns-blame",
    "grug-far",
    "help",
    "lspinfo",
    "neotest-output",
    "neotest-output-panel",
    "neotest-summary",
    "notify",
    "qf",
    "spectre_panel",
    "startuptime",
    "tsplayground",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.schedule(function()
      vim.keymap.set("n", "q", function()
        vim.cmd("close")
        pcall(vim.api.nvim_buf_delete, event.buf, { force = true })
      end, {
        buffer = event.buf,
        silent = true,
        desc = "Quit buffer",
      })
    end)
  end,
})

-- LSP
vim.keymap.set('n', '<leader>ti', function()
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end, { desc = 'Toggle inline hints' })

vim.lsp.enable({ 'luals', 'gopls' })

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client and client:supports_method('textDocument/foldingRange') then
      local win = vim.api.nvim_get_current_win()
      vim.wo[win][0].foldmethod = 'expr'
      vim.wo[win][0].foldexpr = 'v:lua.vim.lsp.foldexpr()'
    end
  end,
})
vim.api.nvim_create_autocmd('LspDetach', { command = 'setl foldexpr<' })

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('my.lsp', {}),
  callback = function(args)
    vim.diagnostic.config({
      virtual_text = false,
      virtual_lines = {
        current_line = true
      },
      underline = true,
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = '',
          [vim.diagnostic.severity.WARN] = '',
          [vim.diagnostic.severity.INFO] = '',
          [vim.diagnostic.severity.HINT] = '',
        }
      }
    })

    local client = assert(vim.lsp.get_client_by_id(args.data.client_id))

    if client.server_capabilities.documentSymbolProvider then
      require("nvim-navic").attach(client, args.buf)
    end

    if client.server_capabilities.documentHighlightProvider then
      local group = vim.api.nvim_create_augroup("LSPDocumentHighlight", { clear = false })
      vim.api.nvim_clear_autocmds({ buffer = args.buf, group = group })

      vim.opt.updatetime = 300

      vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
        buffer = args.buf,
        group = group,
        callback = function()
          vim.lsp.buf.document_highlight()
        end,
      })
      vim.api.nvim_create_autocmd({ "CursorMoved" }, {
        buffer = args.buf,
        group = group,
        callback = function()
          vim.lsp.buf.clear_references()
        end,
      })
    end

    -- Auto-format ("lint") on save.
    -- Usually not needed if server supports "textDocument/willSaveWaitUntil".
    if not client:supports_method('textDocument/willSaveWaitUntil')
        and client:supports_method('textDocument/formatting') then
      vim.api.nvim_create_autocmd('BufWritePre', {
        group = vim.api.nvim_create_augroup('my.lsp', { clear = false }),
        buffer = args.buf,
        callback = function()
          if vim.bo.filetype == "go" then
            local params = vim.lsp.util.make_range_params(0, "utf-8")
            params.context = { only = { "source.organizeImports" } }
            -- buf_request_sync defaults to a 1000ms timeout. Depending on your
            -- machine and codebase, you may want longer. Add an additional
            -- argument after params if you find that you have to write the file
            -- twice for changes to be saved.
            -- E.g., vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 3000)
            local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params)
            for cid, res in pairs(result or {}) do
              for _, r in pairs(res.result or {}) do
                if r.edit then
                  local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding or "utf-16"
                  vim.lsp.util.apply_workspace_edit(r.edit, enc)
                end
              end
            end
          end

          vim.lsp.buf.format({ bufnr = args.buf, id = client.id, timeout_ms = 1000 })
        end,
      })
    end
  end,
})

-- Keymaps for better default experience
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
vim.keymap.set('n', '<esc>', '<CMD> noh <CR>', { desc = "Clear highlights" })

vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = "Page up with cursor in the center" })
vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = "Page down with cursor in the center" })

vim.keymap.set('n', '<leader>Q', ':qa!<CR>', { silent = true, desc = "Quit now!" })
vim.keymap.set('n', '<leader>fs', ':w<CR>', { silent = true, desc = "Save file" })
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

-- Window navigation
vim.keymap.set('n', '<leader>wv', [[<Cmd>wincmd v<CR>]], { noremap = true, silent = true })
vim.keymap.set('n', '<leader>ws', [[<Cmd>wincmd s<CR>]], { noremap = true, silent = true })

-- Kill buffers
vim.keymap.set('n', '<leader>bd', require("snacks").bufdelete.delete,
  { desc = "Delete buffer" })
vim.keymap.set('n', '<leader>bD', require("snacks").bufdelete.other,
  { desc = "Delete other buffers" })

-- Window sizing
vim.keymap.set('n', "<M-left>", [[<cmd>vertical resize +10<CR>]], { desc = "Grow vertical split" })
vim.keymap.set('n', "<M-up>", [[<cmd>resize -5<CR>]], { desc = "Shrink horizontal split" })
vim.keymap.set('n', "<M-down>", [[<cmd>resize +5<CR>]], { desc = "Grow horisontal split" })
vim.keymap.set('n', "<M-right>", [[<cmd>vertical resize -10<CR>]], { desc = "Shrink vertical split" })

-- tabs
vim.keymap.set('n', "<leader><tab><tab>", '<CMD>tabnew<CR>', { desc = "Open new tab" })
vim.keymap.set('n', "<leader><tab>c", '<CMD>tabclose<CR>', { desc = "Close tab" })
vim.keymap.set("n", "<leader><tab>h", "<cmd>tabprev<CR>", { desc = "Previous tab" })
vim.keymap.set("n", "<leader><tab>l", "<cmd>tabnext<CR>", { desc = "Next tab" })
vim.keymap.set("n", "<leader><tab>j", "<cmd>tabm -1<CR>", { desc = "Move tab left" })
vim.keymap.set("n", "<leader><tab>k", "<cmd>tabm +1<CR>", { desc = "Move tab right" })
vim.keymap.set("n", "<leader><tab>r", function()
  local bufname = vim.fn.input("New tab name: ")
  if bufname ~= "" then
    local cmd = ":TabRename " .. bufname
    vim.cmd(cmd)
  end
end, { desc = "Rename tab" })

vim.keymap.set('n', '<leader>tn', '<cmd>set number! relativenumber!<cr>', { desc = 'Toggle line numbers' })

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
require('which-key').add {
  { "<leader>b", group = "Buffer" },
  { "<leader>c", group = "Code" },
  { "<leader>d", group = "Diff | Debug" },
  { "<leader>f", group = "File | Find" },
  { "<leader>g", group = "Git | Commenting" },
  { "<leader>gg", group = "Github" },
  { "<leader>h", group = "Hunks" },
  { "<leader>l", group = "Language (LSP)", icon = '󰦨' },
  { "<leader>r", group = "Run tests", icon = '󰙨' },
  { "<leader>s", group = "Search | Sessions" },
  { "<leader>t", group = "Toggle" },
  { "<leader>v", group = "Vimux", icon = '' },
  { "<leader>w", group = "Workspace | Window" },
  { "<leader>x", group = "Trouble", icon = '' },
  { "<leader>!", group = "", hidden = true },
  { "<leader>q", group = "Quit" },
}

require('which-key').add({
  mode = { 'v' },
  { "<leader>g", group = '[G]it Hunk' },
})

-- vim.opt.titlestring = "[[%f %h%m%r%w %{v:progname} (%{tabpagenr()} of %{tabpagenr('$')})]]"
vim.opt.titlestring = "%{v:progname} :: %f %h%m%r%w"
vim.cmd [[
  if &term == "tmux"
    set t_ts=^[k
    set t_fs=^[\
  endif
]]
vim.cmd("set title")
vim.filetype.add({ extension = { http = 'http' } })

-- vim: ts=2 sts=2 sw=2 et
