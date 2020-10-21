local api = vim.api

local M = {}

function dump(...)
  local objects = vim.tbl_map(vim.inspect, {...})
  print(unpack(objects))
end

local default_keymap_opts = {
  noremap = true,
  silent =  true,
}

function M.nnoremap_buf(lhs, rhs, opts)
  local merged_opts
  if opts then
    merged_opts = vim.tbl_extend("keep", opts, default_keymap_opts)
  else
    merged_opts = default_keymap_opts
  end
  api.nvim_buf_set_keymap(0, 'n', lhs, rhs, merged_opts)
end

function M.augroup(name)
  vim.cmd("augroup " .. name)
  vim.cmd("autocmd!")
  vim.cmd("augroup END")
end

return M
