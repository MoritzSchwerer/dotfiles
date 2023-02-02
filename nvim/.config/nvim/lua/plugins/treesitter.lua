return {
    {
        'nvim-treesitter/nvim-treesitter',
        version = false,
        build = ":TSUpdate",
        event = "BufReadPost",
        opts = {
            highlight = { enable = true },
            indent = { enable = true },
            ensure_installed = {
                "python",
                "javascript",
                "markdown",
                "bash",
                "lua",
            },
            rainbow = { enable = true },
        },
        config = function(_, opts)
            require("nvim-treesitter.configs").setup(opts)
        end,
    },
    {
        'p00f/nvim-ts-rainbow',
        event = "BufReadPost",
        dependencies = { 'nvim-treesitter' },
    },

}


