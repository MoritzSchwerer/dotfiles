return {
    -- {
    --     'nvim-lualine/lualine.nvim',
    --     lazy = false,
    --     opts = {
    --         options = {
    --             icons_enabled = false,
    --             theme = 'onedark',
    --             component_deparator = '|',
    --             section_separators = '',
    --         }
    --     }
    -- },
    {
        'lewis6991/gitsigns.nvim',
        event = "VeryLazy",
        config = true,
        -- opts = {
        --     signs = {
        --         add = { text = '+' },
        --         change = { text = '~' },
        --         delete = { text = '_' },
        --         topdelete = { text = '‾' },
        --         changedelete = { text = '~' },
        --     },
        -- }
    }
}
