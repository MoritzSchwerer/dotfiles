vim.opt.backup = false                          -- creates a backup file
vim.opt.clipboard = "unnamedplus"               -- allows neovim to access the system clipboard
vim.opt.completeopt = { "menuone", "noselect" } -- mostly just for cmp
vim.opt.conceallevel = 0                        -- so that `` is visible in markdown files
vim.opt.fileencoding = "utf-8"                  -- the encoding written to a file
vim.opt.hlsearch = false                        -- highlight all matches on previous search pattern
vim.opt.ignorecase = true                       -- ignore case in search patterns
vim.opt.pumheight = 8                           -- pop up menu height
vim.opt.showmode = false                        -- we don't need to see things like -- INSERT -- anymore
vim.opt.showtabline = 2                         -- always show tabs
vim.opt.smartcase = true                        -- smart case
vim.opt.smartindent = true                      -- make indenting smarter again
vim.opt.splitbelow = true                       -- force all horizontal splits to go below current window
vim.opt.splitright = true                       -- force all vertical splits to go to the right of current window
vim.opt.swapfile = false                        -- creates a swapfile
vim.opt.termguicolors = true                    -- set term gui colors (most terminals support this)
vim.opt.timeoutlen = 500                        -- time to wait for a mapped sequence to complete (in milliseconds)
vim.opt.undofile = true                         -- enable persistent undo
vim.opt.updatetime = 100                        -- faster completion (4000ms default)
vim.opt.writebackup = false                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
vim.opt.cursorline = false                      -- highlight the current line
vim.opt.number = true                           -- set numbered lines
vim.opt.relativenumber = true                   -- set relative numbered lines
vim.opt.numberwidth = 2                         -- set number column width to 2 {default 4}
vim.opt.signcolumn =
"yes"                                           -- always show the sign column, otherwise it would shift the text each time
vim.opt.wrap = false                            -- display lines as one long line
vim.opt.scrolloff = 20                          -- is one of my fav
vim.opt.sidescrolloff = 4

-- disable status line
vim.o.ls = 0

-- disable command line
-- vim.o.ch = 0



-- make it so yanked texit is highlighted
vim.api.nvim_exec([[au TextYankPost * silent! lua vim.highlight.on_yank({timeout=20})]], false)


-- Disable some builtin vim plugins
local disabled_built_ins = {
    "2html_plugin",
    "getscript",
    "getscriptPlugin",
    "gzip",
    "logipat",
    -- "netrw",
    -- "netrwPlugin",
    -- "netrwSettings",
    -- "netrwFileHandlers",
    -- "matchit",
    -- "matchparen",
    "tar",
    "tarPlugin",
    "rrhelper",
    "vimball",
    "vimballPlugin",
    "zip",
    "zipPlugin",
}

for _, plugin in pairs(disabled_built_ins) do
    vim.g["loaded_" .. plugin] = 1
end

vim.opt.expandtab = true -- convert tabs to spaces
vim.opt.shiftwidth = 4   -- the number of spaces inserted for each indentation
vim.opt.tabstop = 4      -- insert 2 spaces for a tab

-- vim.api.nvim_create_autocmd("FileType", {
--     pattern = { "c", "cpp" },
--     callback = function()
--         vim.bo.tabstop = 2
--         vim.bo.shiftwidth = 2
--         vim.bo.expandtab = true
--         vim.bo.softtabstop = 2
--     end,
-- })

vim.api.nvim_create_autocmd("BufEnter", {
    pattern = { "/home/moritz/uni/cpp/**/*.cpp", "/home/moritz/uni/cpp/**/*.h" },
    callback = function()
        vim.bo.tabstop = 2
        vim.bo.shiftwidth = 2
        vim.bo.expandtab = true
        vim.bo.softtabstop = 2
    end,
})
