return require('packer').startup(function()
  use 'wbthomason/packer.nvim'

  use 'joshdick/onedark.vim'
  use 'itchyny/lightline.vim'

  use { 'nvim-telescope/telescope.nvim', requires = { 'nvim-lua/plenary.nvim' } }

  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/nvim-cmp'
  
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'
end)
