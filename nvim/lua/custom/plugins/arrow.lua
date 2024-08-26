return {
  "otavioschwanck/arrow.nvim",
  event = 'VeryLazy',
  opts = {
    show_icons = true,
    leader_key = ';',        -- Recommended to be a single key
    buffer_leader_key = 'm', -- Per Buffer Mappings
    window = {               -- controls the appearance and position of an arrow window (see nvim_open_win() for all options)
      border = "rounded",
    },
  },
}
