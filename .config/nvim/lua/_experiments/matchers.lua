local M = {}

function M.has_keyword(keyword, str)
  return str.match(str, keyword) and true or false
end

function M.has_substr(substr, str)
  return str.match(str, '['..substr..']') and true or false
end

function M.find_function(bufnr, lang)
  local parser = vim.treesitter.get_parser(bufnr, lang)
  local tstree = parser:parse()
  print(vim.inspect(parser))
end

return M
