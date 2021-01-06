local vim = vim
local api = vim.api
local uv = vim.loop

local M = {}

function dump(...)
  local objects = vim.tbl_map(vim.inspect, {...})
  print(unpack(objects))
end

do
  local default_keymap_opts = {
    noremap = true,
    silent =  true,
  }

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
    api.nvim_buf_set_keymap(0, 'n', lhs, rhs, opts)
  end

  function M.nnoremap(lhs, rhs, opts)
    opts = get_merged_opts(opts)
    api.nvim_set_keymap('n', lhs, rhs, opts)
  end
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
end

function M.hi_link(group1, group2)
  vim.cmd(string.format("hi link %s %s", group1, group2))
end

function M.hi(opts)
  local command = string.format("hi %s", opts.group)
  if opts.guibg then command = string.format("%s guibg=%s", command, opts.guibg) end
  if opts.guifg then command = string.format("%s guifg=%s", command, opts.guifg) end
  if opts.ctermbg then command = string.format("%s ctermbg=%s", command, opts.ctermbg) end
  if opts.ctermfg then command = string.format("%s ctermfg=%s", command, opts.ctermfg) end
  vim.cmd(command)
end

function M.libuv_testing()
  local Job = require("plenary/job")

  local on_stdout = function(error, data)
    assert(not error, error)
    print('command stdout:', data)
  end

  local function on_stderr_factory(cmd)
    return vim.schedule_wrap(function(error, data)
      assert(not error, error)

      if data then
        vim.cmd(string.format('echoerr "Formatter %s failed: %s"', cmd, data))
      end
    end)
  end

  local function on_exit_factory(cmd)
    return vim.schedule_wrap(function(self, code, signal)
      assert(not error, error)
      if code ~= 0 then
        vim.cmd(string.format('echoerr "Formatter %s exited with a non-zero exit code %s"', cmd, code))
      end
    end)
  end

  Job:new {
    command = 'cat',
    -- args = {'hello this should be captured'},
    on_stdout = on_stdout,
    on_stderr = function(error, data)
      assert(not error, error)
      print('stderr:', data)
    end,
    writer = 'hello dude this should be captured'
  }:start()
end

function enum(tbl)
    local length = #tbl
    for i = 1, length do
        local v = tbl[i]
        tbl[v] = i
    end

    return tbl
end

do
  local counter = 0
  M.counter_scroll = function()
    print("The counter is", counter)
    counter = counter + 1
  end
end

function M.disable_distribution_plugins()
  vim.g.loaded_gzip              = 1
  vim.g.loaded_tar               = 1
  vim.g.loaded_tarPlugin         = 1
  vim.g.loaded_zip               = 1
  vim.g.loaded_zipPlugin         = 1
  vim.g.loaded_getscript         = 1
  vim.g.loaded_getscriptPlugin   = 1
  vim.g.loaded_vimball           = 1
  vim.g.loaded_vimballPlugin     = 1
  -- vim.g.loaded_matchit           = 1
  -- vim.g.loaded_matchparen        = 1
  vim.g.loaded_2html_plugin      = 1
  vim.g.loaded_logiPat           = 1
  vim.g.loaded_rrhelper          = 1
  vim.g.loaded_netrw             = 1
  vim.g.loaded_netrwPlugin       = 1
  vim.g.loaded_netrwSettings     = 1
  vim.g.loaded_netrwFileHandlers = 1
end

function M.echo_node()
  local ts_utils = require 'nvim-treesitter.ts_utils'
  local node = ts_utils.get_node_at_cursor()
  print(node:type())
end

local is_valid = function(node, type_patterns)
  local node_type = node:type()
  for _, rgx in ipairs(type_patterns) do
    if node_type:find(rgx) then
      return true
    end
  end
  return false
end

do
  local namespace = api.nvim_create_namespace("buffer updates testing")

  function M.buffer_updates()
    vim.api.nvim_buf_attach(0, true, {
        on_lines = vim.schedule_wrap(function(...)
          local params = {...}
          local buf = params[2]
          local changedtick = params[3]
          local firstline = params[4]
          local lastline = params[5]
          local new_lastline = params[6]
          print(string.format("firstline: %s, lastline: %s, new_lastline: %s", firstline, lastline, new_lastline))
          -- dump(params)
          local lines = api.nvim_buf_get_lines(buf, firstline, new_lastline, false)
          print('the changedtick is', changedtick)
          if #lines == 0 then
            local extmarks = api.nvim_buf_get_extmarks(0, namespace, {firstline, 0}, {new_lastline, 0}, {})
            for _, v in ipairs(extmarks) do
              api.nvim_buf_del_extmark(0, namespace, v[1])
            end
            -- print('the changed tick is', changedtick)
            -- print('clearing from', firstline, 'to', lastline)
            -- api.nvim_buf_clear_namespace(0, namespace, firstline, lastline)
            -- api.nvim_buf_set_virtual_text(0, namespace, firstline, {{"", "TabLineFill"}}, {})
            -- api.nvim_buf_clear_namespace(0, namespace, new_lastline + 1, new_lastline + 2)
            -- api.nvim_buf_clear_namespace(0, namespace, firstline, firstline + vim.fn.abs(lastline - new_lastline))
          else
            -- api.nvim_buf_set_virtual_text(0, namespace, firstline, {{"virtual text here " .. firstline, "TabLineFill"}}, {})
            api.nvim_buf_set_extmark(0, namespace, firstline, 0, {
              virt_text = {{"extmark virtual text", "TabLineFill"}},
            })
            -- api.nvim_buf_set_extmark(0, namespace, firstline, 0, {
            --   -- ephemeral = true,
            --   hl_group = "TabLineSel",
            --   virt_text = {{"extmark virtual text", "TabLineFill"}},
            -- })
          end
          dump(lines)
          -- if #lines == 0 then
          --   print("did not add, removed")
          -- end
        end),
      })
  end
end

local w = vim.loop.new_fs_event()

local function on_change(err, fname, status)
  -- Do work...
  print(string.format('changed: %s, renamed: %s, fname: %s', status.change, status.rename, fname))
  vim.api.nvim_command('checktime')
  -- Debounce: stop/start.
  w:stop()
  watch_file(fname)
end

function watch_file(fname)
  local fullpath = vim.fn.fnamemodify(fname, ":p")
  w:start(fullpath, {}, vim.schedule_wrap(function(...)
    on_change(...)
  end))
end

function M.async_testing(msg)
  local async
  async = uv.new_async(function(msg)
    print('msg:', msg)
    async:close()
  end)

  async:send("hello world async")
end

function M.map_par(tbl, f)
  for idx, v in ipairs(tbl) do
    uv.new_thread(vim.schedule_wrap(function()
      dump(f(v))
      -- tbl[idx] = f(v)
    end))
  end
end

function M.join_all(handles)
  for _, handle in ipairs(handles) do
    uv.thread_join(handle)
  end
end

function M.map_test()
  local tbl = {1, 2, 3, 4, 5} 
  for idx, v in iapris(tbl) do
    uv.new_thread(function()
    end)
  end
end

function M.thread_test_works()
  local handle = vim.loop.new_thread(vim.schedule_wrap(function()
    print(1 + 1)
  end))
  handle:join()
  -- handle:close()
end

function M.thread_test()
  local run = vim.schedule_wrap(function()
    print(vim.api.nvim_get_current_line())
  end)
  local handle = vim.loop.new_thread(run)
  handle:join()
end

function M.work_test()
  local res = {}

  local function first(a, b)
    return a + b
  end

  local function second(c)
    table.insert(res, c)
    vim.api.nvim_out_write("The result is: " .. c .. "\n")
    print(vim.api.nvim_get_current_line())
  end

  local work = vim.loop.new_work(first, vim.schedule_wrap(second))
  work:queue(1, 2)
end

vim.api.nvim_command(
  "command! -nargs=1 Watch call luaeval('watch_file(_A)', expand('<args>'))")

return M
