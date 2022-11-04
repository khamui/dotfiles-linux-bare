-- json indentation
local opt = vim.o
opt.tabstop = 4
opt.shiftwidth = 4
vim.b.ale_linters = {'fixjson'}
vim.b.ale_fixers = {'fixjson'}
