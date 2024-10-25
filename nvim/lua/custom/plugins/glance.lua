return {
  "dnlhc/glance.nvim",
  keys = {
    { "gr", "<cmd>Glance references<cr>",       desc = "Show references" },
    { "gi", "<cmd>Glance implementations<cr>",  desc = "Show implementations" },
    { "gd", "<cmd>Glance definitions<cr>",      desc = "Show definitions" },
    { "gy", "<cmd>Glance type_definitions<cr>", desc = "Show type definitions" },
  },
  config = function()
    require('glance').setup({
      detached = function(winid)
        return vim.api.nvim_win_get_width(winid) < 160
      end,
      height = 25,
      winbar = {
        enable = true, -- Available strating from nvim-0.8+
      },
      hooks = {
        before_open = function(results, open, jump, _)
          if #results == 1 then
            jump(results[1]) -- argument is optional
          else
            open(results)    -- argument is optional
          end
        end,
      }
    })
  end,
}
