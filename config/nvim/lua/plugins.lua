return require('packer').startup(function()
  use 'wbthomason/packer.nvim'

  use 'Mofiqul/vscode.nvim'
  use { 'kyazdani42/nvim-tree.lua', requires = { 'kyazdani42/nvim-web-devicons', opt = true } }

  use 'dstein64/vim-startuptime'

  use { 'nvim-telescope/telescope.nvim', requires = { 'nvim-lua/plenary.nvim' } }

  use 'nvim-treesitter/nvim-treesitter'

  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'

  use 'windwp/nvim-autopairs'
  use 'windwp/nvim-ts-autotag'
end)
