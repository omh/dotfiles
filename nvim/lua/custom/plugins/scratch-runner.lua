return {
    "DestopLine/scratch-runner.nvim",
    dependencies = "folke/snacks.nvim",
    opts = {
        sources = {
            javascript = { "node" },
            python = { "python3" },
            go = function(file_path)
                return {
                    "go",
                    "run",
                    file_path,
                }
            end
        },
    },
}
