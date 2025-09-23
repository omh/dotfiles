vim.defer_fn(function()
  vim.pack.add({
    { src = 'https://github.com/dnlhc/glance.nvim' },
  })
  require('glance').setup {
    detached = function(winid)
      return vim.api.nvim_win_get_width(winid) < 160
    end,
    zindex = 3,
    height = 25,
    winbar = {
      enable = true,     -- Available strating from nvim-0.8+
    },
    preview_win_opts = { -- Configure preview window options
      number = true,
      wrap = true,
    },
    border = {
      enable = true, -- Show window borders. Only horizontal borders allowed
      top_char = '―',
      bottom_char = '―',
    },
    hooks = {
      before_open = function(results, open, jump, method)
        if method == "definitions" then
          if #results == 1 then
            return jump(results[1]) -- argument is optional
          end
        elseif method == "references" then
          if #results == 2 then
            return jump(results[2]) -- argument is optional
          end
        end
        open(results, jump)
      end
    },
    theme = {
      enable = false, -- Generate colors based on current colorscheme
    },
  }
end, 400)
