return {
    {
        'iamcco/markdown-preview.nvim',
        lazy = false,
        run = function() vim.fn["mkdp#util#install"]() end,
    },
}
