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

local default_autocmd_opts = {
  pat = "*",
  once = false,
  nested = false,
  user = false,
  group = nil,
}

function M.autocmd(event, vim_command, opts)
  local opts = vim.tbl_extend("keep", opts, default_autocmd_opts)
  local command = "autocmd"
  if opts.user then command = command .. " User" end
  if opts.group then command = command .. " " .. opts.group end
  command = command .. " " .. event .. " " .. opts.pat
  if opts.once then command = command .. " ++once" end
  if opts.nested then command = command .. " ++nested" end
  command = command .. " " .. vim_command
  print(command)
  vim.cmd(command)
end

function M.hi_link(group1, group2)
  vim.cmd(string.format("hi link %s %s", group1, group2))
end

function M.hi(group, guibg, guifg, ctermbg, ctermfg)
  local command = string.format("hi %s guibg=%s guifg=%s", group, guibg, guifg) 
  if ctermbg and ctermfg then
    command = command .. " " .. string.format("ctermbg=%s ctermfg=%s", ctermbg, ctermfg)
  end
  vim.cmd(command)
end

return M
