local set = vim.keymap.set

-- General maps
set('n', '<esc>', '<CMD> noh <CR>', { desc = "Clear highlights" })
set('n', '<leader>q', ':q<CR>', { desc = "Close window" })
set('n', '<leader>Q', ':qa!<CR>', { desc = "Quit now!" })

-- Buffers
set('n', '<leader>bd', function() require("mini.bufremove").delete() end, { desc = "Buffer delete" })

-- Auto complete
local imap_expr = function(lhs, rhs)
  vim.keymap.set('i', lhs, rhs, { expr = true })
end
imap_expr('<Tab>', [[pumvisible() ? "\<C-n>" : "\<Tab>"]])
imap_expr('<S-Tab>', [[pumvisible() ? "\<C-p>" : "\<S-Tab>"]])

-- Tabs
set('n', "<leader><tab><tab>", '<CMD>tabnew<CR>', { desc = "Open new tab" })
set('n', "<leader><tab>c", '<CMD>tabclose<CR>', { desc = "Close tab" })
set("n", "<leader><tab>h", "<cmd>tabprev<CR>", { desc = "Previous tab" })
set("n", "<leader><tab>l", "<cmd>tabnext<CR>", { desc = "Next tab" })
set("n", "<leader><tab>j", "<cmd>tabm -1<CR>", { desc = "Move tab left" })
set("n", "<leader><tab>k", "<cmd>tabm +1<CR>", { desc = "Move tab right" })
set("n", "<leader><tab>r", function()
  local bufname = vim.fn.input("New tab name: ")
  if bufname ~= "" then
    local cmd = ":TabRename " .. bufname
    vim.cmd(cmd)
  end
end, { desc = "Rename tab" })

-- LSP
set("n", "<leader>lh", "<cmd>checkhealth lsp<CR>", { desc = "LSP health" })
set("n", "<leader>ll", function()
  local file = vim.lsp.log.get_filename()
  if file then
    vim.cmd("edit " .. file)
  else
    vim.notify("No filename returned from LSP log.", vim.log.levels.ERROR)
  end
end, { desc = "Open LSP logfile" })

-- Packages
set("n", "<leader>pu", "<cmd>lua vim.pack.update()<CR>", { desc = "Update packages" })

-- Toggles
set('n', '<leader>tn', '<cmd>set number! relativenumber!<cr>', { desc = 'Toggle line numbers' })
set('n', '<leader>ti', function()
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end, { desc = 'Toggle inline hints' })
set("n", "<leader>tb", function() require('gitsigns').toggle_current_line_blame() end, { desc = "Toggle git blame line" })

-- DAP
set('n', '<leader>ds', '<cmd>DapNew<cr>', { desc = 'New debug session' })
set('n', '<leader>dr', '<cmd>DapRerun<cr>', { desc = 'Rerun debug session' })
set('n', '<leader>dx', '<cmd>DapTerminate<cr>', { desc = 'End debug session' })
set('n', '<leader>db', '<cmd>DapToggleBreakpoint<cr>', { desc = 'Toggle breakpoint' })
set('n', '<leader>du', '<cmd>DapViewOpen<cr>', { desc = 'DapView toggle' })

-- Oil
set("n", "-", function() require('oil').toggle_float() end, { desc = "Open parent directory" })

-- Git
set("n", "<leader>gB", function() require('gitsigns').blame() end, { desc = "Git blame file" })
set("n", "<leader>ggv", function() require('pr').view() end, { desc = "View PR in browser" })

set("n", "<leader>gs", function() require('neogit').open({ kind = "floating" }) end, { desc = "Git status" })
set("n", "<leader>ggp", "<cmd>!gh pr view --web <cr>", { desc = "Open current pr in browser" })
set("n", "<leader>ggo", function() require('snacks').gitbrowse() end, { desc = "Open file on github" })
set("n", "<leader>ggc", function() require('snacks').gitbrowse.get_url() end, { desc = "Copy file's GitHub URL" })
set("x", "<leader>ggo", function() require('snacks').gitbrowse() end, { desc = "Open selection on github" })
set("x", "<leader>ggc", function() require('snacks').gitbrowse.get_url() end, { desc = "Copy selection's GitHub URL" })

-- Projectionist
set('n', '<leader>fa', '<cmd>A<CR>', { desc = 'Alternate file' })

-- Kulala (API testing)
set("n", "<leader>ko", function()
    local dir = vim.fs.basename(vim.fn.getcwd())
    vim.cmd.tabnew()
    vim.cmd("e ~/code/http/" .. dir .. ".http")
  end,
  { desc = "Kulala in new tab" })
set("n", "<leader>kO",
  function()
    local dir = vim.fs.basename(vim.fn.getcwd())
    vim.cmd("e ~/code/http/" .. dir .. ".http")
  end,
  { desc = "Kulala in current window" })

-- Testing
set('n', '<leader>rr', '<cmd>TestLast<CR>', { desc = 'Run previous test' })
set('n', '<leader>ra', '<cmd>TestSuite<CR>', { desc = 'Run all tests' })
set('n', '<leader>rn', '<cmd>TestNearest<CR>', { desc = 'Run nearest test' })
set('n', '<leader>rf', '<cmd>TestNearest<CR>', { desc = 'Run current file' })
set('n', '<leader>ro', '<cmd>Tmux !!<CR>', { desc = 'Run previous command in Tmux' })
set('n', '<leader>rd', function()
  require('dap-go').debug_test()
end, { desc = 'Debug current test' })

-- Pickers
set("n", "<leader>ff", function() require('snacks').picker.smart({ layout = _G.vscode }) end, { desc = "Find files" })
set("n", "<leader>fe", "<cmd>Pick resume<cr>", { desc = "Resume last picker" })
set("n", "<leader>fr", function() require('snacks').picker.recent({ layout = _G.vscode }) end,
  { desc = "Find recent files" })
set("n", "<leader>fs",
  function() require('snacks').picker.grep({ layout = { preset = 'ivy_split' }, args = { "--trim" } }) end,
  { desc = "Search files" })
set("v", "<leader>fs",
  function() require('snacks').picker.grep_word({ layout = { preset = 'ivy_split' }, args = { "--trim" } }) end,
  { desc = "Search selection" })
set("n", "<leader>fh",
  function() require('snacks').picker.help({ layout = _G.vscode, pattern = vim.fn.expand("<cword>") }) end,
  { desc = "Search help" })
set("n", "H", function() require('snacks').picker.buffers({ layout = _G.vscode }) end, { desc = "Buffers" })
set("n", "<leader>fk", function() require('snacks').picker.keymaps() end, { desc = "Search keymaps" })
set("n", "<leader>fH", function() require('snacks').picker.highlights() end, { desc = "Search highlights" })

-- LSP (Glance/Snacks)
set("n", "grr", "<cmd>Glance references<cr>", { desc = "Show references" })
set("n", "gri", "<cmd>Glance implementations<cr>", { desc = "Show implementations" })
set("n", "gd", "<cmd>Glance definitions<cr>", { desc = "Show definitions" })
set("n", "grt", "<cmd>Glance type_definitions<cr>", { desc = "Show type definitions" })
set("n", "go", function() require('snacks').picker.lsp_symbols({ layout = _G.vscode }) end, { desc = "Symbols" })
set("n", "gO", function() require('snacks').picker.lsp_workspace_symbols({ layout = _G.vscode_med }) end,
  { desc = "Workspace symbols" })
