return {
  cmd = { 'gopls' },
  root_markers = { 'go.mod', 'go.sum' },
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
        shadow = false,
        unreachable = true
      },
      hints = {
        parameterNames = true,
        -- functionTypeParameters
        -- constantValues
        -- compositeLiteralTypes
        -- compositeLiteralFields
        -- assignVariableTypes
        -- rangeVariableTypes
      },
      completeUnimported = true,
      deepCompletion = true,
      usePlaceholders = false,
      staticcheck = true,
      gofumpt = false,
    }
  }
}
