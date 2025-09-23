vim.pack.add({ 'https://github.com/stevearc/oil.nvim' })
require("oil").setup({
  keymaps = {
    ["q"] = "actions.close",
  },
  view_options = {
    show_hidden = true
  },
  columns = {
    "icon",
  },
  float = {
    padding = 4,
    max_width = 80,
    max_height = 30,
  },
})
