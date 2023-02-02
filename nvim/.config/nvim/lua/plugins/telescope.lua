return {
    {
        "nvim-telescope/telescope.nvim",
        cmd = "Telescope",
        version = false,
        keys = {
            { "<leader>,", "<cmd>Telescope buffers show_all_buffers=true<cr>", desc = "Switch Buffer" },
            { "<leader>af", "<cmd>Telescope find_files hidden=True<cr>", desc = "Find Files" },
            { "<leader>ax", "<cmd>Telescope git_files<cr>", desc = "Git Files" },
            { "<leader>ag", "<cmd>Telescope live_grep<cr>", desc = "Live Grep" },
            { "<leader>ab", "<cmd>Telescope buffers<cr>", "Find Buffer" },
        },
        dependencies = {
            "nvim-lua/plenary.nvim"
        },
        config = true
    }
}
