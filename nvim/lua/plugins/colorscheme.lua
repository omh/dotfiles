-- vim.pack.add({ 'https://github.com/xeind/nightingale.nvim' })
-- require('nightingale').setup({
--   commentStyle = { italic = false },
--   functionStyle = { italic = false },
--   keywordStyle = { italic = false, bold = true },
-- })
-- vim.cmd("colorscheme nightingale")

-- vim.api.nvim_create_autocmd({ "ColorScheme", "VimEnter" }, {
--   group = vim.api.nvim_create_augroup('Color', {}),
--   pattern = "*",
--   callback = function()
--   end
-- })

vim.pack.add({ 'https://github.com/Mofiqul/vscode.nvim' })
vim.cmd("colorscheme vscode")

vim.api.nvim_create_autocmd({ "ColorScheme", "VimEnter" }, {
  group = vim.api.nvim_create_augroup('Color', {}),
  pattern = "*",
  callback = function()
    local c = require('vscode.colors').get_colors()
    local cursor = '#282828'
    local indentHighlight = "#787878"
    local indent = "#424242"
    local number = c.vscLineNumber
    local context = "#000000"
    local popupBg = "#343434"
    local folded = "#242429"

    if vim.o.background == 'light' then
      cursor = c.vscCursorDarkDark
      context = "#ececec"
      number = "#237893"
      indentHighlight = c.vscContextCurrent
      indent = c.vscSplitLight
      popupBg = c.vscPopupBack
      folded = c.vscFoldBackground
    end

    local hl = vim.api.nvim_set_hl

    hl(0, "CursorLine", { bg = cursor })
    hl(0, "CursorLineNr", { bg = cursor })
    hl(0, "FloatBorder", { fg = c.vscBlue, bg = 'none' })
    hl(0, "Folded", { bg = folded })
    hl(0, "LineNr", { fg = number })
    hl(0, "LspInlayHint", { fg = "#969696", bg = "#262626" })
    hl(0, "Pmenu", { bg = popupBg })
    hl(0, "PmenuSel", { fg = "#ffffff", bg = c.vscSelection })
    hl(0, "StatusLine", { fg = c.vscSplitDark, bg = 'none', strikethrough = true })
    hl(0, "StatusLineNC", { fg = c.vscSplitDark, bg = 'none', strikethrough = true })
    -- hl(0, "TabLine", { fg = c.vscGitIgnored, bg = "NONE" })
    -- hl(0, "TabLineSel", { fg = "#FFFFFF", bg = "NONE" })
    -- hl(0, "TabLineFill", { fg = c.vscSplitDark, bg = "NONE" })
    -- hl(0, "VisualNonText", { fg = number, bg = c.vscSelection })
    hl(0, "WinBar", { bg = 'none' })
    hl(0, "WinBarNC", { bg = 'none' })

    hl(0, "DapBreakpoint", { fg = c.vscPink })
    hl(0, "DapStopped", { bg = c.vscPopupHighlightBlue })
    hl(0, "DapStoppedLine", { bg = c.vscPopupHighlightBlue })

    hl(0, "NeogitFloatBorder", { link = "FloatBorder" })

    hl(0, "RainbowDelimiterRed", { fg = c.vscDarkYellow })
    hl(0, "RainbowDelimiterYellow", { fg = c.vscPink })
    hl(0, "RainbowDelimiterBlue", { fg = c.vscBlue })
    hl(0, "RainbowDelimiterOrange", { fg = c.vscDarkYellow })
    hl(0, "RainbowDelimiterGreen", { fg = c.vscPink })
    hl(0, "RainbowDelimiterViolet", { fg = c.vscBlue })
    hl(0, "RainbowDelimiterCyan", { fg = c.vscDarkYellow })

    hl(0, "SnacksIndent", { fg = indent })
    hl(0, "SnacksIndentScope", { fg = indentHighlight })
    hl(0, "SnacksIndentChunk", { fg = indent })


    hl(0, "SnacksPickerBorder", { link = "FloatBorder" })
    hl(0, "SnacksPickerInputCursorLine", { fg = "NONE", bg = c.vscBack })
    hl(0, "SnacksPickerListCursorLine", { fg = "#ffffff", bg = c.vscPopupHighlightBlue })
    hl(0, "SnacksPickerDir", { fg = c.vscGray })
    hl(0, "SnacksPickerCol", { fg = c.vscGray, bg = "NONE" })
    -- hl(0, "SnacksPickerTitle", { fg = c.vscBlue })
    -- hl(0, "SnacksPickerInputSearch", { fg = c.vscBlue })
    -- hl(0, "SnacksPickerInput", { fg = c.vscBlue })
    hl(0, "SnacksPickerMatch", { fg = c.vscBlue, bold = true })
    hl(0, "SnacksPickerPrompt", { bg = c.vscBack })

    hl(0, 'TreesitterContext', { bg = "none" })
    hl(0, 'TreesitterContextBottom', { bg = "none" })
    hl(0, 'TreesitterContextSeparator',
      { fg = context, bg = "none", bold = true })


    hl(0, "NavicIconsFile", { link = "Directory" })
    hl(0, "NavicIconsModule", { link = "@module" })
    hl(0, "NavicIconsNamespace", { link = "@module" })
    hl(0, "NavicIconsPackage", { link = "@module" })
    hl(0, "NavicIconsClass", { link = "Type" })
    hl(0, "NavicIconsMethod", { link = "Keyword" })
    hl(0, "NavicIconsProperty", { link = "@property" })
    hl(0, "NavicIconsField", { link = "@variable.member" })
    hl(0, "NavicIconsConstructor", { link = "@constructor" })
    hl(0, "NavicIconsEnum", { link = "Type" })
    hl(0, "NavicIconsInterface", { link = "Type" })
    hl(0, "NavicIconsFunction", { link = "Keyword" })
    hl(0, "NavicIconsVariable", { link = "@variable" })
    hl(0, "NavicIconsConstant", { link = "Constant" })
    hl(0, "NavicIconsString", { link = "String" })
    hl(0, "NavicIconsNumber", { link = "Number" })
    hl(0, "NavicIconsBoolean", { link = "Boolean" })
    hl(0, "NavicIconsArray", { link = "Type" })
    hl(0, "NavicIconsObject", { link = "Type" })
    hl(0, "NavicIconsKey", { link = "Identifier" })
    hl(0, "NavicIconsNull", { link = "Type" })
    hl(0, "NavicIconsEnumMember", { link = "Constant" })
    hl(0, "NavicIconsStruct", { link = "Structure" })
    hl(0, "NavicIconsEvent", { link = "Structure" })
    hl(0, "NavicIconsOperator", { link = "Operator" })
    hl(0, "NavicIconsTypeParameter", { link = "Type" })
    hl(0, "NavicText", { fg = c.vscFront })
    hl(0, "NavicSeparator", { link = "Comment" })


    local sign = vim.fn.sign_define
    sign("DapBreakpoint", { text = "", texthl = "DapBreakpoint", linehl = "", numhl = "" })
    sign("DapBreakpointCondition", { text = "●", texthl = "DapBreakpointCondition", linehl = "", numhl = "" })
    sign("DapLogPoint", { text = "◆", texthl = "DapLogPoint", linehl = "", numhl = "" })
    sign('DapStopped', { text = '󰐊', texthl = 'DapStopped', linehl = 'DapStoppedLine' })

    hl(0, "DapBreakpoint", { fg = c.vscPink })
    hl(0, "DapStopped", { bg = c.vscPopupHighlightBlue })
    hl(0, "DapStoppedLine", { bg = c.vscPopupHighlightBlue })
  end
})
