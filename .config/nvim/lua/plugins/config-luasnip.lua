local snip_status_ok, luasnip = pcall(require, "luasnip")
if not snip_status_ok then
  return
else
  return luasnip
end
