return {
    {
        "nvim-telescope/telescope.nvim",
        cmd = "Telescope",
        version = false,
        keys = {
            { "<leader>,", "<cmd>Telescope buffers show_all_buffers=true<cr>", desc = "Switch Buffer" },
            { "<leader>pf", "<cmd>Telescope find_files hidden=True<cr>", desc = "Find Files" },
            { "<leader>pg", "<cmd>Telescope git_files<cr>", desc = "Git Files" },
            { "<leader>ps", "<cmd>Telescope live_grep<cr>", desc = "Live Grep" },
            { "<leader>pb", "<cmd>Telescope buffers<cr>", "Find Buffer" },
        },
        dependencies = {
            "nvim-lua/plenary.nvim"
        },
        config = true
    }
}
