local api = vim.api

local M = {}

function M.map(...)
  local opts = {...}
  api.nvim_set_keymap(
  opts[1] or opts.mode or 'n',
  opts[2] or opts.lhs,
  opts[3] or opts.rhs,
  opts[4] or opts.opts or {
    silent = true,
    noremap = true,
  })
end

return M
