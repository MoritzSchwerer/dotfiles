return {
    {
        'navarasu/onedark.nvim',
        opts = {
            code_style = {
                comments = 'italic',
                keywords = 'italic',
                functions = 'none',
                strings = 'none',
                variables = 'none'
            },

        },

    },
    {
        'nvim-treesitter/nvim-treesitter',
        opts = {
            ensure_installed = { 'rust', 'python', 'lua', 'bash' },
            highlight = {
                enable = true,
            },
        },
        requires = { 'nvim-treesitter/nvim-treesitter-context' },
        event = "BufReadPre",
    },
}
