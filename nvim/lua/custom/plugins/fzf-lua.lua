return {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  keys = {
    { "<leader>ff", "<cmd>FzfLua files<CR>",                      desc = "Find Files" },
    { "<leader>ss", "<cmd>FzfLua live_grep<CR>",                  desc = "Search for text" },
    { "<leader>ss", "<cmd>FzfLua grep_visual<CR>",                mode = "x",                 desc = "Search for text" },
    { "<leader>se", "<cmd>FzfLua resume<CR>",                     desc = "Resume last search" },
    { "<leader>fr", "<cmd>FzfLua oldfiles<CR>",                   desc = "Recent files" },
    { "H",          "<cmd>FzfLua buffers<CR>",                    desc = "Open buffers" },
    { "<leader>o",  "<cmd>FzfLua lsp_document_symbols<CR>",       desc = "Document Symbols" },
    { "<leader>O",  "<cmd>FzfLua lsp_live_workspace_symbols<CR>", desc = "Workspace Symbols" },
    { "<leader>lf", "<cmd>FzfLua lsp_finder<CR>",                 desc = "LSP finder" },
  },
  config = function()
    -- calling `setup` is optional for customization
    require("fzf-lua").setup({
      "telescope",
      fzf_colors = true,
      fzf_opts = {
        ["--layout"] = "reverse",
      },
      grep = {
        winopts = {
          preview    = {
            layout = 'horizontal',
          },
          win_height = 0.5,
          win_width  = 1,
          win_row    = 1,
          win_col    = 0,
        },
      },
      lsp = {
        symbols = {
          symbol_style = 2, -- icon only
          symbol_fmt   = function(s, _) return " " .. s .. " " end,
        }
      },
      files = {
        formatter = { "path.filename_first", 2 },
      },
      oldfiles = {
        cwd_only                = true,
        stat_file               = true,  -- verify files exist on disk
        include_current_session = false, -- include bufs from current session
        formatter               = { "path.filename_first", 2 },
      },
      winopts = {
        backdrop   = 100,
        winblend   = 90,
        border     = 'rounded',
        preview    = {
          vertical = 'down:35%',
          layout = 'vertical',
        },
        win_height = 0.7,
        win_width  = 0.30,
        --   win_row = 0.30,
        --   win_col = 0.50,
      },
    })
  end
}
