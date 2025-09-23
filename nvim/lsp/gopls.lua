return {
  cmd = { 'gopls' },
  root_markers = { 'go.mod', 'go.sum' },
  filetypes = { "go", "gomod", "gowork", "gotmpl", "gotexttmpl" },
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
        shadow = false,
        unreachable = true,
        ST1000 = false, -- disable complaints about package docs
        ST1020 = false, -- disable complaints about exported docs
        ST1021 = false,
        ST1022 = false,
        ST1003 = false, -- disable complaints about _ in package names
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
