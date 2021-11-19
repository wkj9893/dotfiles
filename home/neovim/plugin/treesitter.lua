local treesitter = require 'nvim-treesitter.configs'

treesitter.setup {
  ensure_installed = "maintained",
  autotag = {
    enable = true,
  },
  highlight = {
    enable = true,
  },
}
