require('nvim-treesitter.configs').setup {
  modules = {},
  sync_install = false,
  auto_install = true,
  ignore_install = { 'help' },
  ensure_installed = {
    'lua',
    'python',
    'javascript',
    'typescript',
    'help',
    'vim',
    'html',
    'css',
    'markdown',
    'rust'
  },
  highlight = { enable = true },
  indent = {
    enable = true
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = '<leader><space>',
      node_incremental = '<leader><space>',
      scope_incremental = 'grc',
      node_decremental = 'grm',
    },
  },
  playground = {
    enable = true,
    disable = {}, -- List of disabled languages
    updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
    persist_queries = false, -- Whether the query persists across vim sessions
    keybindings = {
      toggle_query_editor = 'o',
      toggle_hl_groups = 'i',
      toggle_injected_languages = 't',
      toggle_anonymous_nodes = 'a',
      toggle_language_display = 'I',
      focus_language = 'f',
      unfocus_language = 'F',
      update = 'R',
      goto_node = '<cr>',
      show_help = '?',
    },
  },
  query_linter = {
    enable = true,
    use_virtual_text = true,
    lint_events = { 'BufWrite', 'CursorHold' }
  },
}
