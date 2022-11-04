local cmd = vim.cmd
cmd "syntax enable"
cmd "colorscheme onehalflight"
cmd "let g:airline_theme='onehalflight'"
cmd "highlight ColorColumn ctermbg=255"
cmd "let g:ale_fix_on_save = 0"

local opt = vim.o
opt.ruler = true
opt.backup = false
opt.writebackup = false
opt.swapfile = false
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true
opt.number = true
opt.relativenumber = true
opt.numberwidth = 4
opt.foldcolumn = "2"
opt.hls = false
opt.splitbelow = true
opt.splitright = true
opt.backspace = "indent,eol,start"
opt.colorcolumn="80"
opt.mouse="a"
opt.guicursor="n-c:block,i-ci:ver50,r-cr-v-ve:hor80,o:hor50,a:blinkwait100-blinkoff150-blinkon150-Cursor"
