local M = {}

local api, fn, bo = vim.api, vim.fn, vim.bo
local get_opt = api.nvim_get_option_value

local icons = tools.ui.icons
-- local icons = tools.ui.kind_icons_spaced
local mini_icons = require("mini.icons")

local HL = {
  branch = { "DiagnosticOk", icons.branch },
  file = { "NonText", icons.node },
  nomodifiable = { "DiagnosticWarn", icons.bullet },
  modified = { "DiagnosticError", icons.bullet },
  readonly = { "DiagnosticWarn", icons.lock },
  error = { "DiagnosticError", icons.error },
  warn = { "DiagnosticWarn", icons.warning },
  info = { "DiagnosticInfo", icons.info },
  hint = { "DiagnosticHint", icons.hint },
  visual = { "DiagnosticInfo", "‹› " },
  dir = { "Directory", tools.ui.kind_icons.Folder }
}

local ICON = {}
for k, v in pairs(HL) do
  ICON[k] = tools.hl_str(v[1], v[2])
end

local ORDER = {
  "statuscol_pad",
  "path",
  "breadcrumbs",
  "mod",
  "ro",
  "sep",
  "recording",
  "pad",
  "diag",
  "git",
  "pad",
}

local PAD = " "
local SEP = "%="
local SBAR =
{ "▔", "🮂", "🬂", "🮃", "▀", "▄", "▃", "🬭", "▂", "▁" }

-- utilities -----------------------------------------
local function concat(parts)
  local out, i = {}, 1
  for _, k in ipairs(ORDER) do
    local v = parts[k]
    if v and v ~= "" then
      out[i] = v
      i = i + 1
    end
  end
  return table.concat(out, " ")
end

-- status column padding -----------------------------------------
local function statuscol_padding()
  local win = api.nvim_get_current_win()
  local wininfo = vim.fn.getwininfo(win)[1]
  if not wininfo then return "" end

  -- textoff gives us the exact width of the status column (sign + number + fold columns)
  return string.rep(" ", wininfo.textoff - 2) .. "%#Constant#%#Normal#"
end

-- path -----------------------------------------
local function path_widget(root, fname)
  local file_name = fn.fnamemodify(fname, ":t")

  local path, icon, hl
  icon, hl = mini_icons.get("file", file_name)

  if fname == "" then file_name = "[No Name]" end
  path = tools.hl_str(hl, icon) .. " %#Title#" .. file_name

  if bo.buftype == "help" then return ICON.file .. path end

  local dir_path = fn.fnamemodify(fname, ":.:h") .. "/"
  if dir_path == "./" then dir_path = "" end

  local elements = {}
  for element in string.gmatch(dir_path, "[^/]+") do
    table.insert(elements, element)
  end
  if #elements >= 1 then
    dir_path = table.concat(elements, "%#Comment# > %#Normal#") .. "%#Comment#" .. " > "
  end

  local win_w = api.nvim_win_get_width(0)
  local need = #dir_path + #path
  if win_w < need + 5 then dir_path = "" end

  -- if dir_path ~= "" then
  --   dir_path = ICON.dir .. "" .. dir_path
  -- end

  return "%#Normal#" .. dir_path .. path
end

-- navic breadcrumbs -----------------------------------------
local function breadcrumbs()
  local b = require 'nvim-navic'.get_location()
  if b == "" then
    return b
  end
  return "%#Comment#->%#normal# " .. b
end

-- show recording -----------------------------------------
local function recording()
  local reg = vim.fn.reg_recording()
  if reg == "" then return "" end -- not recording
  return "%#ErrorMsg# " .. reg .. "%#Normal#"
end


-- git status -----------------------------------------
local function git()
  local git_info = vim.b.gitsigns_status_dict
  if not git_info or git_info.head == "" then
    return ""
  end
  local added = git_info.added and ("%#GitSignsAdd#+" .. git_info.added .. " ") or ""
  local changed = git_info.changed and ("%#GitSignsChange#~" .. git_info.changed .. " ") or ""
  local removed = git_info.removed and ("%#GitSignsDelete#-" .. git_info.removed .. " ") or ""
  if git_info.added == 0 then
    added = ""
  end
  if git_info.changed == 0 then
    changed = ""
  end
  if git_info.removed == 0 then
    removed = ""
  end

  return table.concat {
    " ",
    added,
    changed,
    removed,
    "%#Normal#",
  }
end


-- diagnostics ---------------------------------------------
local function diagnostics_widget()
  if not tools.diagnostics_available() then return "" end
  local diag_count = vim.diagnostic.count(0)
  local diags = {}

  if diag_count[vim.diagnostic.severity.ERROR] then
    table.insert(diags, ICON.error .. "" .. tools.hl_str("DiagnosticError", diag_count[vim.diagnostic.severity.ERROR]))
  end
  if diag_count[vim.diagnostic.severity.WARN] then
    table.insert(diags, ICON.warn .. "" .. tools.hl_str("DiagnosticWarn", diag_count[vim.diagnostic.severity.WARN]))
  end
  if diag_count[vim.diagnostic.severity.INFO] then
    table.insert(diags, ICON.info .. "" .. tools.hl_str("DiagnosticInfo", diag_count[vim.diagnostic.severity.INFO]))
  end
  if diag_count[vim.diagnostic.severity.HINT] then
    table.insert(diags, ICON.hint .. "" .. tools.hl_str("DiagnosticHint", diag_count[vim.diagnostic.severity.HINT]))
  end

  if #diags == 0 then
    return ""
  end

  return table.concat(diags, " ")
end

-- render ---------------------------------------------
function M.render()
  local fname = api.nvim_buf_get_name(0)
  local root = (bo.buftype == "" and tools.get_path_root(fname)) or nil
  if bo.buftype ~= "" and bo.buftype ~= "help" then fname = bo.ft end
  if bo.buftype ~= "" and bo.buftype == "snacks_layout_box" then return "" end
  if bo.buftype ~= "" and bo.buftype == "quickfix" then return "  󱐋 Quickfix" end
  if bo.buftype == "nofile" then
    return ""
  end

  local buf = api.nvim_win_get_buf(0)

  local parts = {
    statuscol_pad = statuscol_padding(),
    pad = PAD,
    path = path_widget(root, fname),
    breadcrumbs = breadcrumbs(),
    git = git(),
    recording = recording(),
    mod = get_opt("modifiable", { buf = buf })
        and (get_opt("modified", { buf = buf }) and ICON.modified or " ")
        or ICON.nomodifiable,
    ro = get_opt("readonly", { buf = buf }) and ICON.readonly or "",
    sep = SEP,
    diag = diagnostics_widget(),
  }

  return concat(parts)
end

vim.o.winbar = "%{%v:lua.require('ui.statusline').render()%}"

function CustomTabline()
  local tabline = ''
  for i = 1, vim.fn.tabpagenr('$') do
    local tab_page_number = i
    local tab_page_name = vim.fn.tabpagebuflist()[i]
    local buf_name = vim.fn.bufname(tab_page_name)

    -- Check if the buffer is active
    if i == vim.fn.tabpagenr() then
      tabline = tabline .. '%#TabLineSel#' .. ' ' .. buf_name .. ' ' .. '%*'
    else
      tabline = tabline .. '%#TabLine#' .. ' ' .. buf_name .. ' ' .. '%*'
    end
  end
  return tabline
end

-- Set the tabline option
-- vim.o.tabline = '%!v:lua.CustomTabline()'

return M
