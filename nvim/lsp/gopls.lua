return {
  cmd = { 'gopls' },
  root_markers = { 'go.mod', 'go.sum' },
  filetypes = { "go", "gomod", "gowork", "gotmpl", "gotexttmpl" },
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
        shadow = false,
        unreachable = true
      },
      hints = {
        assignVariableTypes = true,
        compositeLiteralFields = true,
        compositeLiteralTypes = true,
        constantValues = true,
        functionTypeParameters = true,
        parameterNames = true,
        rangeVariableTypes = true,
      },
      completeUnimported = true,
      deepCompletion = true,
      usePlaceholders = false,
      staticcheck = true,
      gofumpt = false,
    }
  }
}
