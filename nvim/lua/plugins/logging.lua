vim.pack.add({ 'https://github.com/Goose97/timber.nvim' })

vim.defer_fn(function()
  require('timber').setup({
    log_templates = {
      default = {
        go = [[log.Printf("==========> %log_target: %v\n", %log_target)]],
      }
    },
    highlight = {
      -- After a log statement is inserted
      on_insert = true,
      -- After a log target is added to a batch
      on_add_to_batch = true,
      -- After a log entry is shown/jumped to in the summary panel
      on_summary_show_entry = true,
      -- The duration of the flash highlight
      duration = 100,
    },
  })
end, 500)
