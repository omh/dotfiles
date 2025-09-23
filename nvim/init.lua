vim.g.mapleader      = ' '                             -- <space> all the way
vim.g.maplocalleader = ','                             -- local leader
vim.o.laststatus     = 0                               -- hiden statusline
vim.o.showcmd        = false                           -- don't show current cmd
vim.o.cmdheight      = 0                               -- no command line by default
vim.o.statusline     = " "                             -- no statusline text
vim.o.winborder      = 'rounded'                       -- roudned border for all popups
vim.o.shell          = "/bin/bash -i"                  -- make switching in tmux faster
vim.o.breakindent    = true                            -- indent wrapped lines
vim.o.expandtab      = true                            -- use the appropriate number of spaces to insert a tab
vim.o.shiftwidth     = 2                               -- number of columns for one level of indentation
vim.o.smartindent    = true                            -- indent when starting a new line
vim.o.autoindent     = true                            -- copy indent from current line when starting new line
vim.o.tabstop        = 2                               -- how big a tab is
vim.o.softtabstop    = 2                               -- move to next tab instead of inserting <tab> chars.
vim.o.mouse          = 'a'                             -- enable mouse mode
vim.o.clipboard      = 'unnamedplus'                   -- os clipboard
vim.o.number         = true                            -- show line numbers
vim.o.relativenumber = true                            -- relative line numberes
vim.o.scrolloff      = 20                              -- scroll before hitting top/bottom
vim.o.splitright     = true                            -- split to the right and move to it
vim.o.title          = true                            -- set window title
vim.o.cursorline     = true                            -- enable cursorline
vim.o.foldenable     = false                           -- don't fold by default
vim.o.foldmethod     = "expr"                          -- use expr to determine folds
vim.o.foldcolumn     = '0'                             -- don't show the annoying fold dept
vim.o.foldtext       = ''                              -- use normal highlighting for folded text
vim.o.ignorecase     = true                            -- case insensitive search
vim.o.smartcase      = true                            -- unless we start with a capital letter
vim.o.hlsearch       = true                            -- highlight search as you type
vim.o.inccommand     = 'nosplit'                       -- show search/replace preview in buffer
vim.o.undofile       = true                            -- save undo history
vim.o.hidden         = true                            -- don't discard hidden terminals
vim.o.completeopt    = 'menuone,nearest,preview,fuzzy' -- better autocomp
vim.g.showtabline    = 1                               -- show if two or more tabs
vim.o.pumheight      = 10                              -- Limits completion items to 10
vim.g.pummaxwidth    = 120                             -- not too wide completion menu.
vim.o.swapfile       = false                           -- no swap files please
vim.o.wildmode       = 'noselect:lastused,full'
vim.o.wildoptions    = 'fuzzy,pum,tagfile'             -- fuzzy cmd line matching

vim.bo.indentexpr    =
"v:lua.require'nvim-treesitter'.indentexpr()" -- how to indent
vim.o.foldexpr       =
"v:lua.vim.treesitter.foldexpr()"             -- how to do folds
vim.o.completeopt    = 'menuone,noselect,fuzzy'

vim.opt.fillchars    = {
  eob = " ",
  diff = "╱",
  foldopen = "", -- open fold arrow (down)
  foldclose = ">", -- closed fold arrow (right)
  foldsep = " ", -- separator
  fold = " ", -- filler inside foldcolumn
  msgsep = "━",
  horiz = "━",
  horizup = "┻",
  horizdown = "┳",
  vert = "┃",
  vertleft = "┫",
  vertright = "┣",
  verthoriz = "╋",
}
-- Use fancy disclosure triangles
vim.o.foldcolumn     = "auto"

-- -- use nice color highlighting in the command line
-- require('vim._extui').enable({ enable = true })

vim.opt.listchars    = {
  nbsp = "␣",
  tab = "  ",
  trail = "·",
}
vim.opt.diffopt      = {
  "internal",
  "filler",
  "linematch:60",
  "vertical",
  "inline:word",
  "algorithm:histogram",
}

require("config.globals")
require("config.autocmds")
require("config.lsp")

require("plugins.icons")
require("plugins.treesitter")

require("plugins.colorscheme")
require("plugins.complete")
require("plugins.dap")
require("plugins.git")
-- require("plugins.gofold")
require("plugins.glance")
require("plugins.kulala")
require("plugins.logging")
require("plugins.mini")
require("plugins.oil")
require("plugins.other")
require("plugins.projectionist")
require("plugins.quickfix")
require("plugins.rainbow")
require("plugins.snacks")
require("plugins.testing")
require("plugins.treesitter-context")

require('ui.statusline')

require("config.keys")



-- nvim <-> tmux: set tmux cwd to current Neovim cwd (for all windows & future ones)
local function tmux_set_cwd_to_nvim()
  if not os.getenv("TMUX") then
    vim.notify("Not inside tmux.", vim.log.levels.WARN)
    return
  end

  local cwd = vim.loop.cwd() or vim.fn.getcwd(0, 0)
  local function sh(cmd)
    return vim.fn.system(cmd):gsub("%s+$", "")
  end
  local function q(s) -- shell-escape with double-quotes
    return '"' .. tostring(s):gsub('"', '\\"') .. '"'
  end

  -- find current tmux session name
  local session = sh([[tmux display-message -p "#S"]])
  if session == "" then
    vim.notify("Could not detect tmux session.", vim.log.levels.ERROR)
    return
  end

  -- 1) New windows should start in this path
  -- set session-level default-path (affects new windows/panes in this session)
  sh(string.format([[tmux set-option -t %s default-path %s]], session, q(cwd)))

  -- also set window-level default-path for all existing windows (belt & suspenders)
  local wins = sh([[tmux list-windows -t ]] .. session .. [[ -F "#{window_id}"]])
  for wid in wins:gmatch("[^\n]+") do
    sh(string.format([[tmux set-window-option -t %s default-path %s]], wid, q(cwd)))
  end

  -- 2) For existing panes, cd if they look like an interactive shell
  -- We only touch panes whose current command is a typical shell.
  local panes = sh([[tmux list-panes -s -F "#{session_name}:#{window_index}.#{pane_index} #{pane_current_command}"]])
  local is_shell = { bash = true, zsh = true, fish = true, sh = true, ksh = true, nu = true }
  for line in panes:gmatch("[^\n]+") do
    local target, cmd = line:match("^(%S+)%s+(%S+)$")
    if target and cmd and is_shell[cmd] then
      local cd_cmd
      if cmd == "fish" then
        cd_cmd = 'cd ' .. q(cwd)
      elseif cmd == "nu" then
        cd_cmd = 'cd ' .. q(cwd)
      else
        cd_cmd = 'cd -- ' .. q(cwd)
      end
      -- send 'cd <cwd>' and Enter
      sh(string.format([[tmux send-keys -t %s %s C-m]], target, q(cd_cmd)))
    end
  end

  vim.notify("tmux working directory set to: " .. cwd, vim.log.levels.INFO)
end

vim.api.nvim_create_user_command("TmuxSetCwd", tmux_set_cwd_to_nvim, {})
