local g = vim.g
local map = vim.api.nvim_set_keymap

-- leader
g.mapleader = ";"

-- force remaps
map('n', 'v', '<C-v>', {}) -- entering Visual Block

-- general navigation
map('i', 'jk', '<ESC>', {noremap = true})
map('v', '<Tab>', '<ESC>', {noremap = true})
map('n', 'H', '0', {noremap = true})
map('v', 'H', '0', {noremap = true})
map('n', 'L', 'A<ESC>', {noremap = true})
map('v', 'L', '$', {noremap = true})
map('n', 'vv', '0v$', {noremap = true})
map('n', '<C-A>', 'gg0vG$', {noremap = true})

-- split navigation
map('n', '¬', ':vsp<CR>', {noremap = true})
map('n', '∆', ':sp<CR>', {noremap = true})
map('n', '<C-L>', '<C-W><C-L>', {noremap = true})
map('n', '<C-H>', '<C-W><C-H>', {noremap = true})
map('n', '<C-J>', '<C-W><C-J>', {noremap = true})
map('n', '<C-K>', '<C-W><C-K>', {noremap = true})

-- inserting
map('n', '<C-s>', ':call ShojiToggle()<CR>', {noremap = true})
map('n', '-', 'ddp', {noremap = true})
map('n', '_', 'ddkP', {noremap = true})
map('n', '<leader>"', 'viw<ESC>a"<ESC>bi"<ESC>lel', {noremap = true})
map('n', '<leader>\'', 'viw<ESC>a\'<ESC>bi\'<ESC>lel', {noremap = true})
map('n', '<leader>o', 'o<ESC>', {noremap = true})
map('n', '<leader>O', 'O<ESC>', {noremap = true})
-- map('n', '<leader>p', ':lua require("funcs").copy_to_next_empty_line("down")<CR>', {noremap = true })
-- map('n', '<leader>P', ':lua require("funcs").copy_to_next_empty_line("up")<CR>', {noremap = true })
-- map('n', '<leader>j', ':lua require("funcs").go_to_next_empty_line("down")<CR>', {noremap = true })
-- map('n', '<leader>k', ':lua require("funcs").go_to_next_empty_line("up")<CR>', {noremap = true })
-- map('n', '<leader>p', ':lua require("funcs").is_function_def()<CR>', {noremap = true })

-- split resize
map('n', '<leader>+', ':vertical resize +5<CR>', {noremap = true})
map('n', '<leader>-', ':vertical resize -5<CR>', {noremap = true})

-- copilot overwrite
vim.cmd [[
imap <silent><script><expr> <leader><Tab> copilot#Accept("\<CR>")
let g:copilot_no_tab_map = v:true
]]

-- ale lint
map('n', '<leader>aj', ':ALENext<CR>', {noremap = true})
map('n', '<leader>ak', ':ALEPrevious<CR>', {noremap = true})

-- telescope
map('n', '<leader>ff', ':lua require("telescope.builtin").find_files()<CR>', { noremap = true })
map('n', '<leader>fg', ':lua require("telescope.builtin").live_grep()<CR>', { noremap = true })
map('n', '<leader>fb', ':lua require("telescope.builtin").buffers()<CR>', { noremap = true })
map('n', '<leader>fh', ':lua require("telescope.builtin").help_tags()<CR>', { noremap = true })
map('n', '<leader>fz', ':lua require("telescope").extensions.zoxide.list()<CR>', { noremap = true })
map('n', '<leader>p', ':lua require("telescope").extensions.neoclip.default()<CR>', { noremap = true })
map('n', '<leader>P', ':Telescope neoclip star<CR>', { noremap = true })

-- lsp
-- these keymappings are wrapped in a function because it is set conditionally.
M = {}
function M.lsp_keymaps(bufnr)
  local bufmap = vim.api.nvim_buf_set_keymap
  local opts = { noremap = true, silent = true }
  bufmap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
  bufmap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
  bufmap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
  bufmap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, "n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
  bufmap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>f", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
  bufmap(bufnr, "n", "[d", '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>', opts)
  bufmap(bufnr, "n", "gl", '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
  bufmap(bufnr, "n", "]d", '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>', opts)
  bufmap(bufnr, "n", "<leader>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
  vim.cmd [[ command! Format execute 'lua vim.lsp.buf.formatting()' ]]
end
return M
