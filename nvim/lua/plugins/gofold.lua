-- =========================================
-- Go folding: `if err != nil { … }` + import blocks
-- + right-aligned fold icons in statuscolumn
-- Requires: Tree-sitter + go parser
-- =========================================

-- 1) Tree-sitter folds query for Go
do
  local query = [[
;; --- if err != nil { ... } ---
(if_statement
  (binary_expression
    left: ((identifier) @err (#match? @err "^err$"))
    operator: "!="
    right: (nil)
  )
  (block) @fold
)

;; --- if err := foo(); err != nil { ... } ---
(if_statement
  (short_var_declaration
    left: (expression_list
            ((identifier) @decl_err (#match? @decl_err "^err$")))
    right: (_)
  )?
  (binary_expression
    left: ((identifier) @cond_err (#match? @cond_err "^err$"))
    operator: "!="
    right: (nil)
  )
  (block) @fold
)

;; --- import blocks: fold `import ( ... )` but not single-line imports ---
(import_declaration
  (import_spec_list) @fold
)
  ]]

  -- Neovim 0.10+
  local ok_new, ts_query = pcall(require, "vim.treesitter.query")
  if ok_new and ts_query.set then
    ts_query.set("go", "folds", query)
  else
    -- Older nvim-treesitter API
    local ok_old, nq = pcall(require, "nvim-treesitter.query")
    if ok_old and nq.set_query then
      nq.set_query("go", "folds", query)
    end
  end
end

-- 3) Folding options
-- Global-only option: where new windows start (0 = start folded; 99 = open)
vim.o.foldlevelstart = 0

-- Per-window Tree-sitter folding for Go buffers
local aug = vim.api.nvim_create_augroup("go_err_import_folds", { clear = true })

local function set_win_folds_for_go(buf)
  -- Decide foldexpr string based on availability (0.10+ vs plugin expr)
  local expr = (vim.treesitter and vim.treesitter.foldexpr) and
      "v:lua.vim.treesitter.foldexpr()" or
      "nvim_treesitter#foldexpr()"

  for _, win in ipairs(vim.fn.win_findbuf(buf)) do
    -- The following are WINDOW-LOCAL
    vim.api.nvim_set_option_value("foldmethod", "expr", { scope = "local", win = win })
    vim.api.nvim_set_option_value("foldexpr", expr, { scope = "local", win = win })
    vim.api.nvim_set_option_value("foldenable", true, { scope = "local", win = win })
    vim.api.nvim_set_option_value("foldlevel", 0, { scope = "local", win = win })
  end
end

vim.api.nvim_create_autocmd("FileType", {
  group = aug,
  pattern = "go",
  callback = function(ev)
    set_win_folds_for_go(ev.buf)
  end,
})

vim.api.nvim_create_autocmd({ "BufWinEnter", "WinEnter", "TextChanged", "TextChangedI", "InsertLeave", "BufWritePost" },
  {
    group = aug,
    callback = function(ev)
      if vim.bo[ev.buf].filetype == "go" then
        set_win_folds_for_go(ev.buf)
      end
    end,
  })
