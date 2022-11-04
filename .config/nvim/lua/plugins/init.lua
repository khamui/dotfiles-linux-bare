local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.config/nvim/plugged')

-- parser
Plug('nvim-treesitter/nvim-treesitter', {['do'] = ':TSUpdate'})
Plug 'nvim-treesitter/playground'

-- code completion & lsp
-- Plug 'github/copilot.vim'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'saadparwaiz1/cmp_luasnip'

Plug 'L3MON4D3/LuaSnip'
Plug 'rafamadriz/friendly-snippets'

Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'

Plug 'dense-analysis/ale'

Plug 'chemzqm/vim-jsx-improve'

Plug('nvim-lua/plenary.nvim')
Plug('nvim-telescope/telescope.nvim', { ['tag'] = '0.1.0' })

-- appearance
Plug('sonph/onehalf', {['rtp'] = 'vim/'})

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

-- navigation
Plug 'christoomey/vim-tmux-navigator'

-- zoxide (telescope extension)
Plug 'nvim-lua/popup.nvim'
Plug 'jvgrootveld/telescope-zoxide'

-- neoclip (telescope extension)
Plug 'AckslD/nvim-neoclip.lua'

vim.call ('plug#end')

require('plugins.config-luasnip')
require('plugins.config-cmp')
require('plugins.config-treesitter')
require('plugins.config-telescope')
