return {
  "NeogitOrg/neogit",
  keys = {
    -- { "<leader>gs", "<cmd>Neogit<cr>",                                        desc = "Neogit status" },
    -- { "<leader>gp", "<cmd>Neogit push<cr>",                                   desc = "Git push" },
    -- { "<leader>gP", "<cmd>Neogit push --force-with-lease<cr>",                desc = "Git push forcw" },
    { "<leader>dd", "<cmd>DiffviewOpen<cr>",                                  desc = "Open diff view against current branch" },
    { "<leader>dc", "<cmd>DiffviewClose<cr>",                                 desc = "Close diff view" },
    { "<leader>gl", "<cmd>DiffviewFileHistory %<CR>",                         desc = "Git log for current file" },
    { "<leader>gL", "<cmd>DiffviewFileHistory<CR>",                           desc = "Git log for repo" },
    { "<leader>dm", "<cmd>DiffviewOpen origin/HEAD...HEAD --imply-local<cr>", desc = "Open diff view for branch" },
  },
  dependencies = {
    "nvim-lua/plenary.nvim",  -- required
    "sindrets/diffview.nvim", -- optional - Diff integration

    -- Only one of these is needed, not both.
    "nvim-telescope/telescope.nvim", -- optional
  },
  config = function()
    local neogit = require("neogit")
    neogit.setup {
      graph_style = "unicode",
      signs = {
        -- { CLOSED, OPENED }
        hunk = { "", "" },
        item = { "", "" },
        section = { "", "" },
      },
      mappings = {
        popup = {
          ["p"] = "PushPopup",
          ["P"] = "PullPopup",
        } },
    }

    local diffview = require("diffview")
    diffview.setup {
      file_panel = {
        win_config = { -- See |diffview-config-win_config|
          position = "left",
          width = 55,
          win_opts = {},
        },
      },
    }

    local theme = require("kanagawa.colors").setup().theme
    local palette = require("kanagawa.colors").setup().palette
    vim.api.nvim_set_hl(0, "DiffviewFilePanelSelected", { fg = palette.carpYellow, bg = theme.ui.bg_p1, bold = true })
  end
}
