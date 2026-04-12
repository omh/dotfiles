vim.pack.add({
  { src = 'https://github.com/nvim-treesitter/nvim-treesitter',             version = 'main' },
  { src = 'https://github.com/nvim-treesitter/nvim-treesitter-textobjects', version = 'main' }
})

-- require 'nvim-treesitter'.setup {}
require'nvim-treesitter'.install { 'markdown', 'markdown_inline', 'go', 'lua', 'http' }
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'go', 'http', 'help', 'lua' },
  callback = function() 
    vim.treesitter.start()
     vim.wo[0][0].foldexpr = 'v:lua.vim.treesitter.foldexpr()'
     vim.wo[0][0].foldmethod = 'expr'
     vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"

  end,
})

-- vim.api.nvim_create_autocmd('User', {
--   pattern = 'TSUpdate',
--   callback = function()
--     require('nvim-treesitter.parsers').lua.install_info.generate = true
--   end
-- })
--

vim.keymap.set({ "n", "x", "o" }, "]m", function()
  require("nvim-treesitter-textobjects.move").goto_next_start("@function.outer", "textobjects")
end)
vim.keymap.set({ "n", "x", "o" }, "[m", function()
  require("nvim-treesitter-textobjects.move").goto_previous_start("@function.outer", "textobjects")
end)

-- Defer Treesitter setup after first render to improve startup time of 'nvim {filename}'
-- vim.defer_fn(function()
--   require 'nvim-treesitter.configs'.setup({
--     ensure_installed = {
--       'go',
--       'lua',
--       'python',
--       'tsx',
--       'javascript',
--       'typescript',
--       'vimdoc',
--       'vim',
--       'bash',
--       'elixir',
--       'heex',
--       'eex',
--       'html',
--       'css',
--     },
--     highlight = {
--       enable = true,
--     },
--     indent = { enable = true },
--     textobjects = {
--       select = {
--         enable = true,
--         lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
--         keymaps = {
--           -- You can use the capture groups defined in textobjects.scm
--           ['aa'] = '@parameter.outer',
--           ['ia'] = '@parameter.inner',
--           ['af'] = '@function.outer',
--           ['if'] = '@function.inner',
--           ['ac'] = '@class.outer',
--           ['ic'] = '@class.inner',
--         },
--       },
--       move = {
--         enable = true,
--         set_jumps = true, -- whether to set jumps in the jumplist
--         goto_next_start = {
--           [']m'] = '@function.outer',
--           [']r'] = '@return.inner',
--           [']]'] = '@class.outer',
--         },
--         goto_next_end = {
--           [']M'] = '@function.outer',
--           [']['] = '@class.outer',
--         },
--         goto_previous_start = {
--           ['[m'] = '@function.outer',
--           ['[r'] = '@return.inner',
--           ['[['] = '@class.outer',
--         },
--         goto_previous_end = {
--           ['[M'] = '@function.outer',
--           ['[]'] = '@class.outer',
--         },
--       },
--       swap = {
--         enable = true,
--         swap_next = {
--           ['<leader>a'] = '@parameter.inner',
--         },
--         swap_previous = {
--           ['<leader>A'] = '@parameter.inner',
--         },
--       },
--     },
--   })
-- end, 100)
