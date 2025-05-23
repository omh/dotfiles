return {
  'jgdavey/tslime.vim',
  keys = {
    { "<leader>ro", "<cmd>Tmux !!<CR>", desc = "Run previous command in tmux" },
  },
  config = function()
    vim.cmd [[
            let g:tslime_always_current_session = 1
            let g:tslime_always_current_window = 1
        ]]
  end,
}
