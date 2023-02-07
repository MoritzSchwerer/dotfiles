return {
    {
        "theprimeagen/harpoon",
        keys = {
            { "<leader>x", function() require('harpoon.mark').add_file() end, desc = "Add file to harpoon" },
            { "<C-e>", function() require('harpoon.ui').toggle_quick_menu() end, desc = "Show harpoon menu" },
            { "<C-h>", function() require('harpoon.ui').nav_file(1) end, desc = "Navigate to file 1" },
            { "<C-t>", function() require('harpoon.ui').nav_file(2) end, desc = "Navigate to file 2" },
            { "<C-n>", function() require('harpoon.ui').nav_file(3) end, desc = "Navigate to file 3" },
            { "<C-s>", function() require('harpoon.ui').nav_file(4) end, desc = "Navigate to file 4" },
        },
        config = true,
        dependencies = {
            "nvim-lua/plenary.nvim"
        },
    },
    {
        'alexghergh/nvim-tmux-navigation',
        event = "VeryLazy",
        opts = {
            disable_when_zoomed = true,
        }
    }
}
