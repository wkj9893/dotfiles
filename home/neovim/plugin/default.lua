require('onedark').setup()
require('lualine').setup {
  options = {
    theme = 'onedark'
  }
}

require('nvim-autopairs').setup()

vim.api.nvim_set_keymap('n', '<space>ff', [[<cmd>lua require('telescope.builtin').find_files()<CR>]], { noremap = true, silent = true })
