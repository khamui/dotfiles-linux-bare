-- python indentation
local opt = vim.o
opt.tabstop = 4
opt.shiftwidth = 4
vim.b.ale_linters = {'pyright', 'flake8'}
vim.b.ale_fixers = {'black', 'isort'}
