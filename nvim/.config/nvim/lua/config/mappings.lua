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
keymap("n", "<leader>wh", "<C-w>h", opts)
keymap("n", "<leader>wj", "<C-w>j", opts)
keymap("n", "<leader>wk", "<C-w>k", opts)
keymap("n", "<leader>wl", "<C-w>l", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Turn of highlights
keymap("n", "<leader>hl", ":nohlsearch<cr>", opts)

--  Telescope
keymap("n", "<leader>pf", ":Telescope find_files hidden=True<cr>", opts)
keymap("n", "<leader>pg", ":Telescope git_files<cr>", opts)
keymap("n", "<leader>ps", ":Telescope live_grep<cr>", opts)
keymap("n", "<leader>pb", ":Telescope buffers<cr>", opts)
-- see also user.plugins.telescope

-- harpoon
keymap("n", "<leader>a", "<cmd>lua require('harpoon.mark').add_file()<cr>", opts)
keymap("n", "<C-e>", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", opts)
keymap("n", "<C-h>", "<cmd>lua require('harpoon.ui').nav_file(1)<cr>", opts)
keymap("n", "<C-t>", "<cmd>lua require('harpoon.ui').nav_file(2)<cr>", opts)
keymap("n", "<C-n>", "<cmd>lua require('harpoon.ui').nav_file(3)<cr>", opts)
keymap("n", "<C-s>", "<cmd>lua require('harpoon.ui').nav_file(4)<cr>", opts)


keymap("n","<leader>lf", "<cmd>lua vim.lsp.buf.format()<cr>", opts)
