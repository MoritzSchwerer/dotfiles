return {
    "theprimeagen/harpoon",
    lazy = true,
    keys = {
        { "<leader>a", function() require('harpoon.mark').add_file() end, desc = "" },
        { "<C-e>", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", desc = "" },
        { "<C-h>", "<cmd>lua require('harpoon.ui').nav_file(1)<cr>", desc = "" },
        { "<C-t>", "<cmd>lua require('harpoon.ui').nav_file(2)<cr>", desc = "" },
        { "<C-n>", "<cmd>lua require('harpoon.ui').nav_file(3)<cr>", desc = "" },
        { "<C-s>", "<cmd>lua require('harpoon.ui').nav_file(4)<cr>", desc = "" },
    },
    config = true,
    dependencies = {
        "nvim-lua/plenary.nvim"
    },
}
