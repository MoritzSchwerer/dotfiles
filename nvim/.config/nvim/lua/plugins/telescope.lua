return {
    {
        "nvim-telescope/telescope.nvim",
        cmd = "Telescope",
        version = false,
        keys = {
            { "<leader>af", "<cmd>Telescope find_files hidden=True<cr>", desc = "Find Files" },
            { "<leader>ax", "<cmd>Telescope git_files<cr>", desc = "Git Files" },
            { "<leader>ag", "<cmd>Telescope live_grep<cr>", desc = "Live Grep" },
            { "<leader>ab", "<cmd>Telescope buffers<cr>", desc = "Find Buffer" },
            { "<leader>ac", "<cmd>Telescope file_browser<cr>", desc = "File Browser" },
        },
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope-file-browser.nvim"
        },
        config = function ()
            require('telescope').load_extension('file_browser')
        end
    },
}
