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
-- these mappings are wrapped in a function because it is set conditionally.
LSPMAPS = {}
function LSPMAPS.lsp_maps(bufnr)
  local opts = { buffer = bufnr, silent = true }
  map("n", "gD", function() return vim.lsp.buf.declaration() end, opts)
  -- map("n", "gd", function() return vim.lsp.buf.definition() end, opts)
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

-- lspsaga
-- LSP finder - Find the symbol's definition
-- If there is no definition, it will instead be hidden
-- When you use an action in finder like "open vsplit",
-- you can use <C-t> to jump back
map("n", "gh", "<cmd>Lspsaga lsp_finder<CR>")

-- Code action
map({"n","v"}, "<leader>ca", "<cmd>Lspsaga code_action<CR>")

-- Rename all occurrences of the hovered word for the entire file
map("n", "gr", "<cmd>Lspsaga rename<CR>")

-- Rename all occurrences of the hovered word for the selected files
-- map("n", "gr", "<cmd>Lspsaga rename ++project<CR>")

-- Peek definition
-- You can edit the file containing the definition in the floating window
-- It also supports open/vsplit/etc operations, do refer to "definition_action_keys"
-- It also supports tagstack
-- Use <C-t> to jump back
map("n", "gp", "<cmd>Lspsaga peek_definition<CR>")

-- Go to definition
map("n","gd", "<cmd>Lspsaga goto_definition<CR>")

-- Peek type definition
-- You can edit the file containing the type definition in the floating window
-- It also supports open/vsplit/etc operations, do refer to "definition_action_keys"
-- It also supports tagstack
-- Use <C-t> to jump back
map("n", "gt", "<cmd>Lspsaga peek_type_definition<CR>")

-- Go to type definition
map("n","gt", "<cmd>Lspsaga goto_type_definition<CR>")


-- Show line diagnostics
-- You can pass argument ++unfocus to
-- unfocus the show_line_diagnostics floating window
map("n", "<leader>sl", "<cmd>Lspsaga show_line_diagnostics<CR>")

-- Show buffer diagnostics
map("n", "<leader>sb", "<cmd>Lspsaga show_buf_diagnostics<CR>")

-- Show workspace diagnostics
map("n", "<leader>sw", "<cmd>Lspsaga show_workspace_diagnostics<CR>")

-- Show cursor diagnostics
map("n", "<leader>sc", "<cmd>Lspsaga show_cursor_diagnostics<CR>")

-- Diagnostic jump
-- You can use <C-o> to jump back to your previous location
map("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>")
map("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>")

-- Diagnostic jump with filters such as only jumping to an error
map("n", "[E", function()
  require("lspsaga.diagnostic"):goto_prev({ severity = vim.diagnostic.severity.ERROR })
end)
map("n", "]E", function()
  require("lspsaga.diagnostic"):goto_next({ severity = vim.diagnostic.severity.ERROR })
end)

-- Toggle outline
map("n","<C-t>", "<cmd>Lspsaga outline<CR>")

-- Hover Doc
-- If there is no hover doc,
-- there will be a notification stating that
-- there is no information available.
-- To disable it just use ":Lspsaga hover_doc ++quiet"
-- Pressing the key twice will enter the hover window
map("n", "K", "<cmd>Lspsaga hover_doc<CR>")

-- If you want to keep the hover window in the top right hand corner,
-- you can pass the ++keep argument
-- Note that if you use hover with ++keep, pressing this key again will
-- close the hover window. If you want to jump to the hover window
-- you should use the wincmd command "<C-w>w"
map("n", "K", "<cmd>Lspsaga hover_doc ++keep<CR>")

-- Call hierarchy
map("n", "<Leader>ci", "<cmd>Lspsaga incoming_calls<CR>")
map("n", "<Leader>co", "<cmd>Lspsaga outgoing_calls<CR>")

-- Floating terminal
map({"n", "t"}, "<A-d>", "<cmd>Lspsaga term_toggle<CR>")

return LSPMAPS
