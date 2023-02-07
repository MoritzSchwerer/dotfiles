local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Normal --
-- Better window navigation
keymap("n", "<C-a>h", "<C-w>h", opts)
keymap("n", "<C-a>j", "<C-w>j", opts)
keymap("n", "<C-a>k", "<C-w>k", opts)
keymap("n", "<C-a>l", "<C-w>l", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Turn of highlights
keymap("n", "<leader>hl", ":nohlsearch<cr>", opts)

keymap("n", "<leader>lf", "<cmd>lua vim.lsp.buf.format()<cr>", opts)
