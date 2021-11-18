local treesitter = require 'nvim-treesitter'

treesitter.setup {
  ensure_installed = "maintained",
  highlight = {
    enable = true,
  },
}
