local use = require"packer".use

local function setup()
  -- use "tjdevries/nlua.nvim"

  use {"rafcamlet/nvim-luapad", cmd = {"LuaRun", "Lua", "Luapad"}}
end

return {setup = setup}
