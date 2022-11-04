-- typescript indentation
local opt = vim.o
opt.tabstop = 2
opt.shiftwidth = 2
vim.b.ale_linters = {'prettier', 'eslint'}
vim.b.ale_fixers = {'prettier', 'eslint'}
