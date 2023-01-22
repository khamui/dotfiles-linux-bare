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
map('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
map('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- split navigation
map('n', '¬', ':vsp<CR>')
map('n', '∆', ':sp<CR>')
map('n', '<C-L>', '<C-W><C-L>')
map('n', '<C-H>', '<C-W><C-H>')
map('n', '<C-J>', '<C-W><C-J>')
map('n', '<C-K>', '<C-W><C-K>')

-- line altering
map('n', '-', 'ddp')
map('n', '_', 'ddkP')
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

-- telescope
map('n', '<leader>?', function() return require('telescope.builtin').oldfiles() end)
map('n', '<leader>ff', function() return require("telescope.builtin").find_files() end)
map('n', '<leader>fg', function() return require("telescope.builtin").live_grep() end)
map('n', '<C-p>', function() return require("telescope.builtin").git_files() end)
map('n', '<leader>fh', function() return require("telescope.builtin").help_tags() end)
map('n', '<leader>fb', function() return require("telescope.builtin").buffers() end)
map('n', '<leader>fz', function() return require("telescope").extensions.zoxide.list() end)
map('n', '<leader>fw', function() return require('telescope.builtin').grep_string() end)
map('n', '<leader>fd', function() return require('telescope.builtin').diagnostics() end)
map('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
})
end)

map('n', '<leader>p', function() return require("telescope").extensions.neoclip.default() end)
map('n', '<leader>P', ':Telescope neoclip star<CR>')

-- lsp
-- these keymappings are wrapped in a function because it is set conditionally.
LSPMAPS = {}
function LSPMAPS.lsp_keymaps(bufnr)
  local opts = { buffer = bufnr, silent = true }
  map("n", "gD", function() return vim.lsp.buf.declaration() end, opts)
  map("n", "gd", function() return vim.lsp.buf.definition() end, opts)
  map("n", "gr", require('telescope.builtin').lsp_references, opts)
  map("n", "K", function() return vim.lsp.buf.hover() end, opts)
  map("n", "gi", function() return vim.lsp.buf.implementation() end, opts)
  map("n", "<leader>K", function() return vim.lsp.buf.signature_help() end, opts)
  map("n", "<leader>rn", function() return vim.lsp.buf.rename() end, opts)
  map("n", "<leader>ca", function() return vim.lsp.buf.code_action() end, opts)
  -- map("n", "<leader>f", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
  map("n", "[d", function() vim.diagnostic.goto_prev({ border = "rounded" }) end, opts)
  map("n", "gl", function() vim.diagnostic.open_float() end, opts)
  map("n", "]d", function() vim.diagnostic.goto_next({ border = "rounded" }) end, opts)
  map("n", "<leader>q", function() vim.diagnostic.setloclist() end, opts)
end
return LSPMAPS
