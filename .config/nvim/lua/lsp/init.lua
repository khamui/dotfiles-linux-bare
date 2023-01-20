local status_ok, lspconfig = pcall(require, 'lspconfig')
if not status_ok then
  return
end

lspconfig.tsserver.setup{
  function() return require('lsp.settings.tsserver') end
}
lspconfig.pyright.setup{
  function() return require('lsp.settings.pyright') end
}
-- fix: extract to own file
lspconfig.sumneko_lua.setup {
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
      },
      some = 'blablub',
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  }
}

require('lsp.handlers').setup()
