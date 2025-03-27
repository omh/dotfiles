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
            zindex = 3,
            height = 25,
            winbar = {
                enable = true,   -- Available strating from nvim-0.8+
            },
            preview_win_opts = { -- Configure preview window options
                number = false,
                wrap = true,
            },
            border = {
                enable = true, -- Show window borders. Only horizontal borders allowed
                top_char = '―',
                bottom_char = '―',
            },
            theme = {
                enable = false, -- Generate colors based on current colorscheme
            },
            hooks = {
                before_open = function(results, open, jump, _)
                    if #results == 1 then
                        jump(results[1]) -- argument is optional
                    else
                        open(results, jump)
                        -- local preview_win = vim.api.nvim_get_current_win()
                        -- local context_ranges, context_lines = require("treesitter-context.context").get(0, preview_win)
                        -- if not context_ranges or #context_ranges == 0 then
                        --   return
                        -- end

                        -- vim.defer_fn(function()
                        --     -- vim.cmd("TSContextEnable")
                        --     -- require("treesitter-context.render").open(0, preview_win, context_ranges, context_lines)
                        -- end, 100)
                    end
                end,
            }
        })
    end,
}
