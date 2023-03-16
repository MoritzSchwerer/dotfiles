return {
    {
        "nvim-telescope/telescope.nvim",
        cmd = "Telescope",
        version = false,
        keys = {
            { "<leader>af", "<cmd>Telescope find_files hidden=True<cr>", desc = "Find Files" },
            { "<leader>ax", "<cmd>Telescope git_files<cr>",              desc = "Git Files" },
            { "<leader>ag", "<cmd>Telescope live_grep<cr>",              desc = "Live Grep" },
            { "<leader>ab", "<cmd>Telescope buffers<cr>",                desc = "Find Buffer" },
            { "<leader>ac", "<cmd>Telescope file_browser<cr>",           desc = "File Browser" },
            { "<leader>ak", "<cmd>Telescope keymaps<cr>",                desc = "Show Keymaps" },
            { "<leader>ah", "<cmd>Telescope hoogle list<cr>",            desc = "Search Hoogle" },
        },
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope-file-browser.nvim",
            "psiska/telescope-hoogle.nvim",
            {
                "nvim-telescope/telescope-fzf-native.nvim",
                build = { 'make' }
            }
        },
        config = function()
            local telescope = require("telescope")
            telescope.setup({
                extensions = {
                    fzf = {
                        fuzzy = true,
                        override_generic_sorter = true,
                        override_file_sorter = true,
                        case_mode = "smart_case",
                    },
                    hoogle = {
                        render = 'default',
                        renders = {
                            treesitter = {
                                remove_wrap = false
                            }
                        }
                    }
                }
            })
            telescope.load_extension('file_browser')
            telescope.load_extension('fzf')
            telescope.load_extension('hoogle')
        end
    },
}
