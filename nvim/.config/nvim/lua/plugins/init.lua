return {
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      'j-hui/fidget.nvim',
      'folke/neodev.nvim',
    },
  },
  {
    'hrsh7th/nvim-cmp',
    dependencies = { 'hrsh7th/cmp-nvim-lsp', 'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip' },
  },
  'lewis6991/gitsigns.nvim',
  'navarasu/onedark.nvim',
  'nvim-lualine/lualine.nvim',
  'lukas-reineke/indent-blankline.nvim',
  'numToStr/Comment.nvim',
}
