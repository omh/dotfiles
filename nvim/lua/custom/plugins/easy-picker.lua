return {
  'axkirillov/easypick.nvim',
  dependencies = { 'nvim-telescope/telescope.nvim' },
  keys = {
    { "<leader>gc", "<cmd>Easypick changed_files<CR>", desc = "View changed files in branch" },
  },
  config = function()
    local easypick = require("easypick")
    easypick.setup({
      pickers = {
        -- diff current branch with base_branch and show files that changed with respective diffs in preview
        {
          name = "changed_files",
          command = "git diff --name-only $(git merge-base HEAD " .. vim.g.base_branch .. " )",
          previewer = easypick.previewers.branch_diff({ base_branch = vim.g.base_branch })
        },
      }
    })
  end
}
