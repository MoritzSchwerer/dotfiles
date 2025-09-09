return {
    {
        'saghen/blink.nvim',
        build = 'cargo build --release',
        dependencies = {
        },
        keys = {},
        lazy = false,
        opts = {
            tree = { enabled = false },
        }
    },
    {
        'saghen/blink.cmp',
        dependencies = { 'rafamadriz/friendly-snippets' },
        event = "BufReadPost",
        version = '1.*',
        opts = {
            keymap = { preset = 'default' },
            appearance = {
                use_nvim_cmp_as_default = true,
                nerd_font_variant = 'mono'
            },
            signature = { enabled = true },
            fuzzy = { implementation = "prefer_rust_with_warning" }
        },
    },
    {
        'saghen/blink.indent',
        event = "BufReadPost",
        opts = {
            enabled = true,
            static = { enabled = false },
            scope = {
                enabled = true,
                char = '|',
                -- char = '▎',
                priority = 1024,
                highlights = { 'BlinkIndent' },
            },
        },
    }
}
