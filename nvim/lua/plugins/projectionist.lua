vim.pack.add({ 'https://github.com/tpope/vim-projectionist' })

vim.g.projectionist_heuristics = {
  ['*.go'] = {
    ['*.go'] = { alternate = '{}_test.go', type = "source" },
    ['*_test.go'] = { alternate = '{}.go', type = "test" },
  }
}
