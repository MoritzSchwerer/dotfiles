require('nvim-treesitter.configs').setup {
    ensure_installed = { "python", "lua", "haskell", "java" },
    auto_install = true,
    ignore_install = { "javascript", "css", "html", "bash", "zsh" },
    highlight = {
        enable = true
    },
    indent = {
        enable = true
    },
    rainbow = {
        enable = true
    },
}
