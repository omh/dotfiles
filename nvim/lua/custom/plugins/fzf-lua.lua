return {
  "ibhagwan/fzf-lua",
  enabled = false,
  dependencies = { "echasnovski/mini.icons" },
  keys = {
    { "<leader>pf", "<cmd>FzfLua files<CR>", desc = "Find Files" },
    -- { "<leader>ss", "<cmd>FzfLua live_grep<CR>",                  desc = "Search for text" },
    -- { "<leader>ss", "<cmd>FzfLua grep_visual<CR>",                mode = "x",                 desc = "Search for text" },
    -- { "<leader>se", "<cmd>FzfLua resume<CR>",                     desc = "Resume last search" },
    -- { "<leader>fe", "<cmd>FzfLua resume<CR>",                     desc = "Resume last search" },
    -- { "<leader>fr", "<cmd>FzfLua oldfiles<CR>",                   desc = "Recent files" },
    -- { "<leader>fh", "<cmd>FzfLua highlights<CR>",                 desc = "Find highlights" },
    -- { "H",          "<cmd>FzfLua buffers<CR>",                    desc = "Open buffers" },
    -- { "<leader>o",  "<cmd>FzfLua lsp_document_symbols<CR>",       desc = "Document Symbols" },
    -- { "<leader>O",  "<cmd>FzfLua lsp_live_workspace_symbols<CR>", desc = "Workspace Symbols" },
    -- { "<leader>lf", "<cmd>FzfLua lsp_finder<CR>",                 desc = "LSP finder" },
  },
  config = function()
    -- calling `setup` is optional for customization
    local big_window_cfg = {
      preview  = {
        vertical = "down:50%",
      },
      height   = 0.8,
      width    = 0.8,
      row      = 0.2,
      col      = 0.5,
      backdrop = false,
    }

    local fzflua = require("fzf-lua")
    fzflua.register_ui_select()

    fzflua.setup({
      "border-fused",
      fzf_colors = true,
      fzf_opts = {
        ["--layout"] = "reverse",
      },
      grep = {
        winopts = big_window_cfg,
        formatter = { "path.filename_first", 2 },
      },
      lsp = {
        finder = {
          separator = " │  ", -- separator after provider prefix, `false` to disable
          winopts   = big_window_cfg,
        },
        symbols = {
          symbol_style = 1, -- icon only
          symbol_fmt   = function(s, _) return " " .. s .. " " end,
          -- winopts      = big_window_cfg,
        },
      },
      buffers = {
        formatter = { "path.filename_first", 2 },
        -- winopts = {
        --   preview = {
        --     hidden = true
        --   },
        -- }
      },
      files = {
        formatter = { "path.filename_first", 2 },
        git_icons = true,
      },
      oldfiles = {
        cwd_only                = true,
        stat_file               = true,  -- verify files exist on disk
        include_current_session = false, -- include bufs from current session
        formatter               = { "path.filename_first", 2 },
      },
      blame = {
        winopts = big_window_cfg,
      },
      winopts = {
        backdrop = false,
        preview  = {
          vertical = 'down:45%',
          layout   = 'vertical',
        },
        height   = 0.55,
        width    = 0.40,
        row      = 0.1,
        --   win_row = 0.30,
        --   win_col = 0.50,
      },
    })
  end
}
