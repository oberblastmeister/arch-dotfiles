local utils = require("utils")

local M = {}

function M.setup_autocommands()
  utils.autocmd("GoyoEnter", "call mappings#goyo_enter()", {user = true, nested = true})
  utils.autocmd("GoyoLeave", "call mappings#goyo_leave()", {user = true, nested = true})

  utils.autocmd("GoyoEnter", "Limelight", {user = true})
  utils.autocmd("GoyoLeave", "Limelight!", {user = true})

  utils.autocmd("GoyoLeave", "set nocursorline", {user = true})
end

return M
