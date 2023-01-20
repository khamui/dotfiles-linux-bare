local g = vim.g
local map = vim.keymap.set

-- leader
g.mapleader = ";"

-- force remaps
map('n', 'v', '<C-v>', {}) -- entering Visual Block

-- general navigation
map('i', 'jk', '<ESC>')
map('v', '<Tab>', '<ESC>')
map('n', 'H', '0')
map('v', 'H', '0')
map('n', 'L', 'A<ESC>')
map('v', 'L', '$')
map('n', 'vv', '0v$')
map('n', '<C-A>', 'gg0vG$')

-- split navigation
map('n', '¬', ':vsp<CR>')
map('n', '∆', ':sp<CR>')
map('n', '<C-L>', '<C-W><C-L>')
map('n', '<C-H>', '<C-W><C-H>')
map('n', '<C-J>', '<C-W><C-J>')
map('n', '<C-K>', '<C-W><C-K>')

-- inserting
map('n', '<C-s>', ':call ShojiToggle()<CR>')
map('n', '-', 'ddp')
map('n', '_', 'ddkP')
map('n', '<leader>"', 'viw<ESC>a"<ESC>bi"<ESC>lel')
map('n', '<leader>\'', 'viw<ESC>a\'<ESC>bi\'<ESC>lel')
map('n', '<leader>o', 'o<ESC>')
map('n', '<leader>O', 'O<ESC>')
-- map('n', '<leader>p', ':lua require("funcs").copy_to_next_empty_line("down")<CR>', {noremap = true })
-- map('n', '<leader>P', ':lua require("funcs").copy_to_next_empty_line("up")<CR>', {noremap = true })
-- map('n', '<leader>j', ':lua require("funcs").go_to_next_empty_line("down")<CR>', {noremap = true })
-- map('n', '<leader>k', ':lua require("funcs").go_to_next_empty_line("up")<CR>', {noremap = true })
-- map('n', '<leader>p', ':lua require("funcs").is_function_def()<CR>', {noremap = true })

-- split resize
map('n', '<leader>+', ':vertical resize +5<CR>')
map('n', '<leader>-', ':vertical resize -5<CR>')

-- copilot overwrite
vim.cmd [[
imap <silent><script><expr> <leader><Tab> copilot#Accept("\<CR>")
let g:copilot_no_tab_map = v:true
]]

-- ale lint
map('n', '<leader>aj', ':ALENext<CR>')
map('n', '<leader>ak', ':ALEPrevious<CR>')

map('n', '<leader>ff', function() return require("telescope.builtin").find_files() end)
-- telescope
map('n', '<leader>fg', function() return require("telescope.builtin").live_grep() end)
map('n', '<C-p>', function() return require("telescope.builtin").git_files() end)
map('n', '<leader>fh', function() return require("telescope.builtin").help_tags() end)
map('n', '<leader>fb', function() return require("telescope.builtin").buffers() end)
map('n', '<leader>fz', function() return require("telescope").extensions.zoxide.list() end)
map('n', '<leader>p', function() return require("telescope").extensions.neoclip.default() end)
map('n', '<leader>P', ':Telescope neoclip star<CR>')

-- lsp
-- these keymappings are wrapped in a function because it is set conditionally.
M = {}
function M.lsp_keymaps(bufnr)
  local opts = {silent = true}
  map(bufnr, "n", "gD", function() vim.lsp.buf.declaration() end, opts)
  map(bufnr, "n", "gd", function() vim.lsp.buf.definition() end, opts)
  map(bufnr, "n", "K", function() vim.lsp.buf.hover() end, opts)
  map(bufnr, "n", "gi", function() vim.lsp.buf.implementation() end, opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, "n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
  map(bufnr, "n", "gr", function() vim.lsp.buf.references()end, opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>f", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
  map(bufnr, "n", "[d", function() vim.diagnostic.goto_prev({ border = "rounded" }) end, opts)
  map(bufnr, "n", "gl", function() vim.diagnostic.open_float() end, opts)
  map(bufnr, "n", "]d", function() vim.diagnostic.goto_next({ border = "rounded" }) end, opts)
  map(bufnr, "n", "<leader>q", function() vim.diagnostic.setloclist() end, opts)
  vim.cmd [[ command! Format execute 'lua vim.lsp.buf.formatting()' ]]
end
return M
