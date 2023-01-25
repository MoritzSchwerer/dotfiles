local fn = vim.fn

local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system {
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    }
    print "Installing packer close and reopen Neovim..."
    vim.cmd [[packadd packer.nvim]]
end

vim.cmd [[
  augroup packer_user_config
  autocmd!
  autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float { border = "rounded" }
        end,
    },
}

return packer.startup(function(use)
    use "wbthomason/packer.nvim"

    use 'lewis6991/impatient.nvim'

    use "nvim-lua/popup.nvim"
    use "nvim-lua/plenary.nvim"

    use "navarasu/onedark.nvim"
    use {
        "nvim-telescope/telescope.nvim",
        tag = '0.1.0',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }

    use "neovim/nvim-lspconfig"

    use 'ThePrimeagen/harpoon'

    use { "p00f/nvim-ts-rainbow", requires = { {"nvim-treesitter"} } }

    use "windwp/nvim-autopairs"

    use "numToStr/Comment.nvim"

    use {
        "hrsh7th/nvim-cmp",
        requires = { {"L3MON4D3/LuaSnip"} }
    }
    use {"hrsh7th/cmp-buffer", after="nvim-cmp"}
    use {"hrsh7th/cmp-nvim-lsp"}
    use {"hrsh7th/cmp-path", after="nvim-cmp"}
    use {"hrsh7th/cmp-cmdline", after="nvim-cmp"}
    use {"hrsh7th/cmp-nvim-lsp-signature-help", after="nvim-cmp"}
    use {"tzachar/cmp-tabnine", run= "./install.sh", after="nvim-cmp" }
    use "onsails/lspkind.nvim"

    use {"L3MON4D3/LuaSnip"}
    use {"saadparwaiz1/cmp_luasnip", after="nvim-cmp"}

    use 'rafamadriz/friendly-snippets'

    use "ggandor/leap.nvim"

    -- markdown stuff
    use {
        "iamcco/markdown-preview.nvim",
        run = function() vim.fn["mkdp#util#install"]() end,
    }
    use "junegunn/goyo.vim"

    use {
      "folke/twilight.nvim",
      config = function()
        require("twilight").setup {}
      end
    }   
    use "junegunn/limelight.vim"

    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
    require("luasnip.loaders.from_vscode").lazy_load()
end)
