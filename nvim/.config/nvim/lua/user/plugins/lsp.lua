local config = require('lspconfig')
--local keymap = vim.api.nvim_set_keymap
local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

vim.diagnostic.config({
    virtual_text = false
})
vim.o.updatetime = 100
vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]

on_attach = function()
    keymap("n", "gd", function() vim.lsp.buf.definition() end, opts)
    keymap("n", "K", function() vim.lsp.buf.hover() end, opts)
    keymap("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
    keymap("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
    keymap("n", "[d", function() vim.diagnostic.goto_next() end, opts)
    keymap("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    keymap("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
    keymap("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
    keymap("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
    keymap("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end

local capabilities = require('cmp_nvim_lsp').default_capabilities()

config.pyright.setup {
    capabilities = capabilities,
    on_attach = on_attach

}

config.rust_analyzer.setup {
    capabilities = capabilities,
    on_attach = on_attach,
    settings = {
        ["rust_analyzer"] = {
            imports = {
                granularity = {
                    group = "module",
                },
                prefix = "self",
            },
            cargo = {
                buildScripts = {
                    enable = true,
                },
            },
            procMacro = {
                enable = true,
            },
        }
    }
}
config.hls.setup {
    capabilities = capabilities,
    on_attach = on_attach,
    settings = {
        haskell = {
            hlintOn = true,

        }
    }
}

vim.lsp.handlers["textDocument/publishDiagnostics"] =
    vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics,
                 {update_in_insert = true})
