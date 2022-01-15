require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use 'LunarVim/onedarker.nvim'
  
  use "neovim/nvim-lspconfig"
  use 'hrsh7th/nvim-cmp' 
  use 'hrsh7th/cmp-nvim-lsp' 
  use 'saadparwaiz1/cmp_luasnip'
  use 'L3MON4D3/LuaSnip' 
end)

