vim.api.nvim_buf_set_keymap(
  0,
  "n",
  "<CR>",
  "<cmd>lua require('kulala').run()<cr>",
  { noremap = true, silent = true, desc = "Execute the request" }
)

vim.api.nvim_buf_set_keymap(
  0,
  "n",
  "[r",
  "<cmd>lua require('kulala').jump_prev()<cr>",
  { noremap = true, silent = true, desc = "Jump to the previous request" }
)

vim.api.nvim_buf_set_keymap(
  0,
  "n",
  "]r",
  "<cmd>lua require('kulala').jump_next()<cr>",
  { noremap = true, silent = true, desc = "Jump to the next request" }
)

vim.api.nvim_buf_set_keymap(
  0,
  "n",
  "<leader>kt",
  "<cmd>lua require('kulala').toggle_view()<cr>",
  { noremap = true, silent = true, desc = "Toggle view" }
)

vim.api.nvim_buf_set_keymap(
  0,
  "n",
  "<leader>ks",
  "<cmd>lua require('kulala').search()<cr>",
  { noremap = true, silent = true, desc = "Search requests" }
)

vim.api.nvim_buf_set_keymap(
  0,
  "n",
  "<leader>ke",
  "<cmd>lua require('kulala').set_selected_env()<cr>",
  { noremap = true, silent = true, desc = "Set selected env" }
)

vim.api.nvim_buf_set_keymap(
  0,
  "n",
  "<leader>ki",
  "<cmd>lua require('kulala').inspect()<cr>",
  { noremap = true, silent = true, desc = "Inspect the current request" }
)

vim.api.nvim_buf_set_keymap(
  0,
  "n",
  "<leader>kcc",
  "<cmd>lua require('kulala').copy()<cr>",
  { noremap = true, silent = true, desc = "Copy the current request as a curl command" }
)

vim.api.nvim_buf_set_keymap(
  0,
  "n",
  "<leader>kci",
  "<cmd>lua require('kulala').from_curl()<cr>",
  { noremap = true, silent = true, desc = "Paste curl from clipboard as http request" }
)
