local status_ok, lsp_installer = pcall(require, 'nvim-lsp-installer')
if not status_ok then
  return
end

lsp_installer.on_server_ready(function(server)
  local opts = {
    on_attach = require('lsp.handlers').on_attach,
    capabilities = require('lsp.handlers').capabilities,
  }

  if server.name == 'sumneko_lua' then
    local sumneko_settings = require('lsp.settings.sumneko_lua')
    opts = vim.tbl_deep_extend('force', sumneko_settings, opts)
  end

  if server.name == 'tsserver' then
    local tsserver_settings = require('lsp.settings.tsserver')
    opts = vim.tbl_deep_extend('force', tsserver_settings, opts)
  end

  if server.name == 'pyright' then
    local pyright_settings = require('lsp.settings.pyright')
    opts = vim.tbl_deep_extend('force', pyright_settings, opts)
  end

  server:setup(opts)
end)
