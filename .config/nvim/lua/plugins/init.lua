local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

require('packer').startup(function(use)
  --------------------------------
  ------------ PACKER ------------
  --------------------------------
  use 'wbthomason/packer.nvim'
  --------------------------------
  ------------- TMUX -------------
  --------------------------------
  use 'christoomey/vim-tmux-navigator'
  --------------------------------
  ------------- LSP --------------
  --------------------------------
  use {
    'neovim/nvim-lspconfig',
    requires = {
      -- Automatically install LSPs to stdpath for neovim
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',

      -- Useful status updates for LSP
      -- 'j-hui/fidget.nvim',

      -- Additional lua configuration, makes nvim stuff amazing
      -- 'folke/neodev.nvim',
    },
  }
  --------------------------------
  -------- CODE COMPLETION -------
  --------------------------------
  --use {
  --  'hrsh7th/nvim-cmp',
  --  requires = {
  --    'hrsh7th/cmp-buffer',
  --    'hrsh7th/cmp-calc',
  --    'hrsh7th/cmp-nvim-lsp',
  --    'hrsh7th/cmp-path',
  --    'hrsh7th/cmp-nvim-lsp-signature-help',
  --    'hrsh7th/cmp-vsnip',
  --    'hrsh7th/vim-vsnip'
  --  },
  --}
  --------------------------------
  ----------- COPILOT ------------
  --------------------------------
  use {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        suggestion = { enabled = true, auto_trigger = true },
        panel = { enabled = true },
      })
    end,
  }

  --------------------------------
  ----------- TELESCOPE ----------
  --------------------------------
  use { 'nvim-telescope/telescope.nvim', branch = '0.1.x', requires = { 'nvim-lua/plenary.nvim' } }
  -- fuzzy finder algorithm which requires local dependencies to be built. Only load if `make` is available
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', cond = vim.fn.executable 'make' == 1 }
  -- zoxide (telescope extension)
  use 'nvim-lua/popup.nvim'
  use 'jvgrootveld/telescope-zoxide'
  -- neoclip (telescope extension)
  use 'AckslD/nvim-neoclip.lua'
  --------------------------------
  ---------- NAVIGATION ----------
  --------------------------------
  use {
    'nvim-tree/nvim-tree.lua',
    -- requires = { 'nvim-tree/nvim-web-devicons' }
  }
  -- lsp saga
  use ({
    'nvimdev/lspsaga.nvim',
    after = 'nvim-lspconfig',
    config = function()
        require('lspsaga').setup({
          signature_help = { enable = false },
          lightbulb = { enable = false },
          code_action = { enable = false },
          symbol_in_winbar = {
            enable = false,
          }
      })
    end,
  })
  --------------------------------
  ----------- FORMATTER ----------
  --------------------------------
  use { 'mhartington/formatter.nvim' }
  --------------------------------
  ---------- TREESITTER ----------
  --------------------------------
  use { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    run = function()
      pcall(require('nvim-treesitter.install').update { with_sync = true })
    end,
  }
  --------------------------------
  ----------- APPEARANCE ---------
  --------------------------------
  -- colorscheme
  use "savq/melange-nvim"
  -- status line
  use {
    'nvim-lualine/lualine.nvim',
    --requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  -- git integration
  use 'lewis6991/gitsigns.nvim'
  --------------------------------
  ---------- RUST-TOOLS ----------
  --------------------------------
  use 'simrat39/rust-tools.nvim'
  --------------------------------
  ------------ DEBUGGER ----------
  --------------------------------
  use 'mfussenegger/nvim-dap'
  use "ldelossa/nvim-dap-projects"

  if packer_bootstrap then
    require('packer').sync()
  end
end)

require('plugins.configs.config-cmp')
require('plugins.configs.config-gitsigns')
require('plugins.configs.config-lsp')
require('plugins.configs.config-statusline')
require('plugins.configs.config-telescope')
require('plugins.configs.config-treesitter')
require('plugins.configs.config-formatter-prettier')
require('plugins.configs.config-nvim-tree')
require('plugins.configs.config-rust-tools')
require('plugins.configs.config-nvim-dap-projects')
