local g = vim.g
local o = vim.o

g.mapleader = ' '

o.tabstop = 2
o.shiftwidth = 2
o.expandtab = true
o.number = true
o.termguicolors = true

o.inccommand = 'nosplit'
o.completeopt = 'menu,menuone,noselect'
o.hlsearch = false
o.ignorecase = true
o.smartcase = true
o.signcolumn = 'yes'
g.vscode_style = "dark"
vim.cmd[[colorscheme vscode]]