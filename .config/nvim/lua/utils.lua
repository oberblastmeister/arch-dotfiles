local vim = vim
local api = vim.api

local M = {}

function dump(...)
  local objects = vim.tbl_map(vim.inspect, {...})
  print(unpack(objects))
end

do
  local default_keymap_opts = {noremap = true, silent = true}

  local function get_merged_opts(opts)
    local merged_opts
    if opts then
      merged_opts = vim.tbl_extend("keep", opts, default_keymap_opts)
    else
      merged_opts = default_keymap_opts
    end
    return merged_opts
  end

  function M.nnoremap_buf(lhs, rhs, opts)
    opts = get_merged_opts(opts)
    api.nvim_buf_set_keymap(0, "n", lhs, rhs, opts)
  end

  function M.nnoremap(lhs, rhs, opts)
    opts = get_merged_opts(opts)
    api.nvim_set_keymap("n", lhs, rhs, opts)
  end
end

function M.feedkeys(keys)
  api.nvim_feedkeys(api.nvim_replace_termcodes(keys, true, true, true), 'n', true)
end

function M.augroup(name)
  vim.cmd("augroup " .. name)
  vim.cmd("autocmd!")
  vim.cmd("augroup END")
end

do
  local default_autocmd_opts = {
    pat = "*",
    once = false,
    nested = false,
    user = false,
    group = nil
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
end

function M.hi_link(group1, group2)
  vim.cmd(string.format("hi link %s %s", group1, group2))
end

function M.hi(opts)
  local command = string.format("hi %s", opts.group)
  if opts.guibg then
    command = string.format("%s guibg=%s", command, opts.guibg)
  end
  if opts.guifg then
    command = string.format("%s guifg=%s", command, opts.guifg)
  end
  if opts.ctermbg then
    command = string.format("%s ctermbg=%s", command, opts.ctermbg)
  end
  if opts.ctermfg then
    command = string.format("%s ctermfg=%s", command, opts.ctermfg)
  end
  vim.cmd(command)
end


function M.disable_distribution_plugins()
  vim.g.loaded_gzip = 1
  vim.g.loaded_tar = 1
  vim.g.loaded_tarPlugin = 1
  vim.g.loaded_zip = 1
  vim.g.loaded_zipPlugin = 1
  vim.g.loaded_getscript = 1
  vim.g.loaded_getscriptPlugin = 1
  vim.g.loaded_vimball = 1
  vim.g.loaded_vimballPlugin = 1
  -- vim.g.loaded_matchit           = 1
  -- vim.g.loaded_matchparen        = 1
  vim.g.loaded_2html_plugin = 1
  vim.g.loaded_logiPat = 1
  vim.g.loaded_rrhelper = 1
  vim.g.loaded_netrw = 1
  vim.g.loaded_netrwPlugin = 1
  vim.g.loaded_netrwSettings = 1
  vim.g.loaded_netrwFileHandlers = 1
end

return M
