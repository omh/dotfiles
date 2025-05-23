return {
  {
    'vim-test/vim-test',
    keys = {
      { "<leader>rr", "<cmd>TestLast<CR>",    desc = "Run previous test" },
      { "<leader>ra", "<cmd>TestSuite<CR>",   desc = "Run all tests" },
      { "<leader>rn", "<cmd>TestNearest<CR>", desc = "Run nearest test" },
      { "<leader>rf", "<cmd>TestFile<CR>",    desc = "Run current file" },
    },
    config = function()
      vim.cmd [[
        let g:test#strategy = 'vimux'
        let g:test#preserve_screen = 1
        let g:test#echo_command = 0
      ]]
    end,
  },
}
