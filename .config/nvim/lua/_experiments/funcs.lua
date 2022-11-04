local M = {}

local matchers = require('matchers')

local function get_curr_line_text(curr_pos)
  return pcall(vim.api.nvim_buf_get_lines, 0, curr_pos - 1, curr_pos, false)
end

local function get_next_pos(curr_pos, direction)
  if direction == 'down' then
    return curr_pos + 1
  else
    return curr_pos - 1
  end
end

local function paste_from_last_register()
  -- local register0 = vim.fn.getreg('"0')
  vim.cmd[[normal p]]
  vim.cmd[[normal o]]
  vim.cmd[[normal jk]]
end

local function set_cursor_to(curr_pos)
  vim.api.nvim_win_set_cursor(0, { curr_pos, 0 })
end

local function get_last_line_of_buffer()
  return vim.api.nvim_buf_line_count(0)
end

local function get_next_empty_line(prev_pos, curr_pos, direction)
  local ok, retval = get_curr_line_text(curr_pos)
  local last_line = get_last_line_of_buffer()
  if ok then
    local curr_line = retval[1]
    if curr_line == '' and prev_pos ~= nil then
      return curr_pos
    else
      prev_pos = curr_pos
      curr_pos = get_next_pos(curr_pos, direction)
      if curr_pos > last_line then
        return nil
      else
        return get_next_empty_line(prev_pos, curr_pos, direction)
      end
    end
  else
    print('No new line available anymore (EOF?)')
  end
end

function M.go_to_next_empty_line(direction)
  local curr_pos, _ = unpack(vim.api.nvim_win_get_cursor(0))
  local prev_pos = nil
  local cursor_pos = get_next_empty_line(prev_pos, curr_pos, direction)
  if cursor_pos ~= nil and cursor_pos > 0 then
    set_cursor_to(cursor_pos)
  else
    print('No new line available anymore (BOF or EOF)')
  end
end

function M.copy_to_next_empty_line(direction)
  M.go_to_next_empty_line(direction)
  paste_from_last_register()
end

function M.is_function_def()
  local curr_pos, _ = unpack(vim.api.nvim_win_get_cursor(0))
  local ok, retval = get_curr_line_text(curr_pos)
  if ok then
    local curr_line = retval[1]
    if (matchers.has_keyword('function', curr_line)) then
      print('Yes, is function definition')
    else
      print('No, is not a function definition')
    end
  end
end

function M.get_function()
  local thisbufnr = vim.api.nvim_get_current_buf()
  matchers.find_function(thisbufnr, 'lua')
end

return M
