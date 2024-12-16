return {
    {
        "nvim-telescope/telescope.nvim",
        cmd = "Telescope",
        tag = "0.1.2",
        version = false,
        keys = {
            { "<leader>af", "<cmd>Telescope find_files hidden=True<cr>", desc = "Find Files" },
            { "<leader>ax", "<cmd>Telescope git_files<cr>",              desc = "Git Files" },
            { "<leader>ab", "<cmd>Telescope buffers<cr>",                desc = "Find Buffer" },
            { "<leader>ak", "<cmd>Telescope keymaps<cr>",                desc = "Show Keymaps" },
        },
        dependencies = {
            "nvim-lua/plenary.nvim",
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
                }
            })
            telescope.load_extension('fzf')
            local glob_grep = require("plugins.telescope.glob_grep").glob_grep
            vim.keymap.set("n", "<leader>ag", glob_grep)
        end
    },
    {
        'ThePrimeagen/harpoon',
        config = true,
        dependencies = {
            "nvim-lua/plenary.nvim"
        },
        keys = {
            { "<leader>x", function() require('harpoon.mark').add_file() end,        desc = "Add file to harpoon" },
            { "<C-e>",     function() require('harpoon.ui').toggle_quick_menu() end, desc = "Show harpoon menu" },
            { "<C-h>",     function() require('harpoon.ui').nav_file(1) end,         desc = "Navigate to file 1" },
            { "<C-t>",     function() require('harpoon.ui').nav_file(2) end,         desc = "Navigate to file 2" },
            { "<C-n>",     function() require('harpoon.ui').nav_file(3) end,         desc = "Navigate to file 3" },
            { "<C-s>",     function() require('harpoon.ui').nav_file(4) end,         desc = "Navigate to file 4" },
        },
    },
}
