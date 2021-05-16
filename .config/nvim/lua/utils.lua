local vim = vim
local uv = vim.loop
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
  -- vim.g.loaded_netrwFileHandlers = 1
end

function M.import_test()
  local import = require"plenary.import"

  local module = {}
  function module.hello() return 'hello' end

  local function before()
    print(hello())
  end

  import { "*", from = module, into = before }

  -- dump(getfenv(before).vim)

  local function after() end

  local work = uv.new_work(before, after)
  work:queue()
end

function M.work_test()
  local function before()
    -- local utils = require'my_module'
    -- utils.hello("world")
    require'my_module'.hello("world")
  end

  local function after(...) end

  local work = uv.new_work(before, after)
  work:queue()
end

function M.ffi_test()
  local ffi = require("ffi")
  ffi.cdef[[
  typedef struct { uint8_t red, green, blue, alpha; } rgba_pixel;
  ]]

  local rgb = ffi.new("rgba_pixel")

  rgb.red = 10
  rgb.blue = 10
  rgb.green = 123
  rgb.alpha = 1

  print(rgb.red)

  return tostring(rgb)
end

function M.term_test()
  local a = vim.api

  x = a.nvim_create_buf(true, true)
  -- w = a.nvim_open_win(x, false, {relative = 'win', width = 12, height = 3, row = 3, col = 3})

  function input(_,t,b,data)
    -- do something fun with "data", write back to "t" or whatever
  end

  t = a.nvim_open_term(x, {})
  a.nvim_chan_send(t, "buh meme this")
  -- a.nvim_chan_send(t, io.open("/path/to/smile.cat", "r"):read("*a"))
end

function M.keystroke()
  local ns = api.nvim_create_namespace('testing')
  vim.register_keystroke_callback(function(key)
    print('keystroke is enter', key == replace("<CR>"))
  end, ns)
end

function M.make_test_window()
  local initial_config = {
    relative = 'editor',
    row = 10,
    col = 10,
    width = 100,
    height = 25,
    border = { "/", "-", "\\", "|" },
    style = "minimal",
  }
  local bufnr = vim.api.nvim_create_buf(false, true)
  local win_id = vim.api.nvim_open_win(bufnr, true, initial_config)
end

function M.wrap_mlua_async(mlua_async_fn)
  return function(...)
    local thread = coroutine.create(function()
      mlua_async_fn()
    end)

    thread.resume()
  end
end

return M
