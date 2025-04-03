return {
  cmd = { 'lua-language-server' },
  root_markers = { '.luarc.json', '.git' },
  filetypes = { 'lua' },
  settings = {
    Lua = {
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
      hint = { enable = true },
      diagnostics = {
        globals = { 'vim' },
      },
    },
  }
}
