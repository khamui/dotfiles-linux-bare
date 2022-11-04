local cmd = vim.cmd

-- Directory Aliases (upper case)
cmd [[
  let $RTP=split(&runtimepath, ',')[0]
  let $DEV="~/Documents/Development"
  let $LQ="~/Documents/Development/LIQD"
  let $NVIM="~/.config/nvim"
  let $LUA="~/.config/nvim/lua"
]]

-- File Aliases (lower case)
cmd [[
  let $z="$HOME/.zshrc"
  let $init="$HOME/.config/nvim/init.lua"
]]
