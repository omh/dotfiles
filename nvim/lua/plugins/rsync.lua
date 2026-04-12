vim.pack.add({
  { src = 'https://github.com/nvim-lua/plenary.nvim' },
  { src = 'https://github.com/OscarCreator/rsync.nvim' },
})

require("rsync").setup()

-- {
--   'OscarCreator/rsync.nvim',
--   build = 'make',
--   dependencies = 'nvim-lua/plenary.nvim',
--   keys = {
--     { "<leader>ua", "<cmd>RsyncUp<cr>",     desc = "Rsync up all" },
--     { "<leader>uf", "<cmd>RsyncUpFile<cr>", desc = "Rsync up file" },
--   },
--   config = function()
--     require("rsync").setup()
--   end,
-- },
--
