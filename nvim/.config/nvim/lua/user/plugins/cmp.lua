local cmp = require "cmp"
local lspkind = require "lspkind"
local ls = require "luasnip"
lspkind.init()

cmp.setup {
    snippet = {
        expand = function(args)
            require'luasnip'.lsp_expand(args.body)
        end
    },
    window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    },
    mapping = {
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-e>'] = cmp.mapping.close(),
        ['C-y'] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Insert,
            select = true 
        })
    },
    sources = cmp.config.sources({
        { name = "nvim_lsp_signature_help"},
        { name = "cmp_tabnine" },
        { name = "nvim_lsp" },
        { name = "buffer", keyword_length=5 },
        { name = "path" },
        { name = "luasnip" },
    }),
    formatting = {
        format = lspkind.cmp_format {
            with_text = true,
            menu = {
                buffer = "[BUF]",
                nvim_lsp = "[LSP]",
                path = "[PATH]",
                luasnip = "[SNIP]",
                cmp_tabnine = "[AI]"
            }
        }
    }
}

vim.keymap.set("i", "<C-f>", function()
    if ls.expand_or_jumpable() then
        ls.expand_or_jump()
    end
end, {silent = true})
