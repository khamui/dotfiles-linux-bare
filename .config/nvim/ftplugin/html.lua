-- html indentation
local opt = vim.o
opt.tabstop = 4
opt.shiftwidth = 4
vim.b.ale_linters = {'html-beautify'}
vim.b.ale_fixers = {'html-beautify'}
