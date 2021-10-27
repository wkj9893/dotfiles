local opt = vim.opt

opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true

opt.number = true

opt.completeopt = 'menu,menuone,noselect'

opt.inccommand = 'nosplit'

opt.termguicolors = true
vim.cmd[[colorscheme onedark]]
vim.g.lightline = { colorscheme = 'onedark' }
