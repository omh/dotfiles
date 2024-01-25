return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local harpoon = require("harpoon")
    harpoon.setup()
    vim.keymap.set("n", "<leader>ha", function() harpoon:list():append() end, { desc = "Add file to Harpoon" })
    vim.keymap.set("n", "<leader>hh", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end,
      { desc = "Show Harpoon" })
    vim.keymap.set("n", "<leader>1", function() harpoon:list():select(1) end, { desc = "Switch to file 1 in Harpoon" })
    vim.keymap.set("n", "<leader>2", function() harpoon:list():select(2) end, { desc = "Switch to file 2 in Harpoon" })
    vim.keymap.set("n", "<leader>3", function() harpoon:list():select(3) end, { desc = "Switch to file 3 in Harpoon" })
    vim.keymap.set("n", "<leader>4", function() harpoon:list():select(4) end, { desc = "Switch to file 4 in Harpoon" })
  end
}
