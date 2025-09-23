vim.pack.add({
  { src = 'https://github.com/vim-test/vim-test' },
  { src = 'https://github.com/jgdavey/tslime.vim' },
})

vim.cmd [[
  let g:test#strategy = 'tslime'
  let g:test#preserve_screen = 1
  let g:test#echo_command = 0
  let g:tslime_always_current_session = 1
  let g:tslime_always_current_window = 1
]]
