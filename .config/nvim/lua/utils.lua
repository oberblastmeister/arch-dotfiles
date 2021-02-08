local vim = vim
local api = vim.api
local parsers = require "nvim-treesitter.parsers"
local uv = vim.loop
local queries = require "nvim-treesitter.query"
local ts_utils = require("nvim-treesitter.ts_utils")

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

function M.libuv_testing()
  local Job = require("plenary/job")

  local on_stdout = function(error, data)
    assert(not error, error)
    print("command stdout:", data)
  end

  local function on_stderr_factory(cmd)
    return vim.schedule_wrap(function(error, data)
      assert(not error, error)

      if data then
        vim.cmd(string.format("echoerr \"Formatter %s failed: %s\"", cmd, data))
      end
    end)
  end

  local function on_exit_factory(cmd)
    return vim.schedule_wrap(function(self, code, signal)
      assert(not error, error)
      if code ~= 0 then
        vim.cmd(string.format(
          "echoerr \"Formatter %s exited with a non-zero exit code %s\"", cmd,
          code))
      end
    end)
  end

  Job:new{
    command = "cat",
    -- args = {'hello this should be captured'},
    on_stdout = on_stdout,
    on_stderr = function(error, data)
      assert(not error, error)
      print("stderr:", data)
    end,
    writer = "hello dude this should be captured"
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

function M.echo_node()
  local ts_utils = require "nvim-treesitter.ts_utils"
  local node = ts_utils.get_node_at_cursor()
  print(node:type())
end

local is_valid = function(node, type_patterns)
  local node_type = node:type()
  for _, rgx in ipairs(type_patterns) do
    if node_type:find(rgx) then return true end
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
        print(string.format("firstline: %s, lastline: %s, new_lastline: %s",
          firstline, lastline, new_lastline))
        -- dump(params)
        local lines =
          api.nvim_buf_get_lines(buf, firstline, new_lastline, false)
        print("the changedtick is", changedtick)
        if #lines == 0 then
          local extmarks = api.nvim_buf_get_extmarks(0, namespace,
            {firstline, 0}, {new_lastline, 0}, {})
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
            virt_text = {{"extmark virtual text", "TabLineFill"}}
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
      end)
    })
  end
end

local w = vim.loop.new_fs_event()

local function on_change(err, fname, status)
  -- Do work...
  print(string.format("changed: %s, renamed: %s, fname: %s", status.change,
    status.rename, fname))
  vim.api.nvim_command("checktime")
  -- Debounce: stop/start.
  w:stop()
  watch_file(fname)
end

function watch_file(fname)
  local fullpath = vim.fn.fnamemodify(fname, ":p")
  w:start(fullpath, {}, vim.schedule_wrap(function(...) on_change(...) end))
end

vim.api.nvim_command(
  "command! -nargs=1 Watch call luaeval('watch_file(_A)', expand('<args>'))")

function M.async_testing(msg)
  local async
  async = uv.new_async(function(msg)
    print("msg:", msg)
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
  for _, handle in ipairs(handles) do uv.thread_join(handle) end
end

function M.map_test()
  local tbl = {1, 2, 3, 4, 5}
  for idx, v in iapris(tbl) do uv.new_thread(function() end) end
end

function M.thread_test_works()
  local handle = vim.loop.new_thread(vim.schedule_wrap(
    function() print(1 + 1) end))
  handle:join()
  handle:close()
  uv.close(handle)
end

function M.thread_test()
  -- local run = vim.schedule_wrap(function()
  --   print(vim.api.nvim_get_current_line())
  -- end)
  local run = function() print(1 + 1) end
  local handle = vim.loop.new_thread(run)
  handle:join()
  uv.close(handle)
end

function M.another(a, b)
  print(a, b)
end

function M.work_test()
  local res = {}

  local function first(a, b) 
    -- require"utils".another(a, b)
    return a, b
  end

  local function second(a, b)
    print(a, b)
  end

  local work = vim.loop.new_work(first, vim.schedule_wrap(second))
  work:queue(1, 2)
  -- uv.stop()
  -- print(uv.run())
end

function M.check_test()
  local check = uv.new_check()
  local counter = 0
  check:start(function()
    print("After I/O polling, counter:", counter)
    counter = counter + 1
  end)
end

function M.idle_test() local idle = uv.new_idle() end

function M.ts_test()
  local matches = queries.get_parent_matches(0, "@scope", "locals")
  dump(matches)
  for _, match in ipairs(matches) do dump(ts_utils.get_node_text(match)) end
end

function M.query_test(bufnr)
  bufnr = bufnr or 0
  local lang = parsers.get_buf_lang(bufnr)
  if not lang then return function() end end

  local query = queries.get_query(lang, "locals")
  if not query then return function() end end

  local parser = parsers.get_parser(bufnr, lang)
  if not parser then return function() end end

  local root = root or parser:parse()[1]:root()
  local start_row, _, end_row, _ = root:range()

  local curr_node = ts_utils.get_node_at_cursor()

  local _, captured_node, _ = query:iter_captures(curr_node, bufnr,
    curr_node:start(), curr_node:end_())()

  if captured_node then
    print("node matched local")
    print(ts_utils.get_node_text(captured_node)[1])
  else
    print("node did not match local")
  end
end

function M.parent_test()
  local node = ts_utils.get_node_at_cursor()
  for parent in queries.iter_parents(node) do
    dump(ts_utils.get_node_text(parent)[1])
  end
end

function M.current_node_test()
  local node = ts_utils.get_node_at_cursor()

  local lang = parsers.get_buf_lang(0)
  if not lang then return end

  local query = queries.get_query(lang, "locals")
  if not query then return end

  print(queries.node_matches(0, query, node))
end

function M.print_test() print("this is just a test") end

function M.float_test()
  vim.api.nvim_open_win(0, false, {
    relative = "win",
    width = 12,
    height = 3,
    bufpos = {100, 10}
  })
end

function M.win_float_test()
  vim.api.nvim_open_win(0, false, {relative = 'win', width = 12, height = 3})
end

local function rpairs(t)
	return function(t, i)
		i = i - 1
		if i ~= 0 then
			return i, t[i]
		end
	end, t, #t + 1
end

function tbl_reverse(tbl)
  for i=1, math.floor(#tbl / 2) do
    tbl[i], tbl[#tbl - i + 1] = tbl[#tbl - i + 1], tbl[i]
  end
end

function M.get_parent_matches()
  local contains = vim.tbl_contains

  local matches = queries.get_capture_matches(0, '@scope.node', 'locals')
  local curr_node = ts_utils.get_node_at_cursor()
  local parent_matches = {}
  while true do
    if contains(matches, curr_node) then
      table.insert(parent_matches, curr_node)
    end
    curr_node = curr_node:parent()
    if curr_node == nil then
      break
    end
  end

  tbl_reverse(parent_matches)

  return parent_matches
end

function M.co_test()
  local co = coroutine
  local Executor = require("co_executor/core")
  local exe = Executor.new {}

  exe:add(co.create(function()
    print('hello world first')
    co.yield()
    print('hello world second')
  end))

  exe:add(co.create(function()
    print('another hello world')
    co.yield()
    print('another hello world second')
  end))

  exe:run()
end

function M.get_id(buf, query, target_node)
  local row, col, rowend, colend = target_node:range()
  if row == rowend then
    rowend = rowend + 1
  end

  local iter = query:iter_captures(target_node, buf)
  local id, node, meta = iter()
  local node_text = ts_utils.get_node_text(node)
  print('id node text:', node_text[1])
  print('id', id)
  return id
end

function M.get_highlight()
  local buf = api.nvim_get_current_buf()
  local buf_highlighter = vim.treesitter.highlighter.active[buf]
  local buf_queries = buf_highlighter._queries

  local curr_node = ts_utils.get_node_at_cursor()
  local node_text = ts_utils.get_node_text(curr_node)
  print('node text:', node_text[1])
  print('node type:', curr_node:type())

  local lua_query = buf_queries[vim.bo.filetype]

  -- local id = curr_node:symbol()
  local id = M.get_id(buf, lua_query:query(), curr_node)

  local hl = lua_query.hl_cache[id]

  -- print('hl', hl)
  local hl_name = vim.fn.synIDattr(hl, "name")
  print(hl_name)
  -- api.nvim_echo({{"this is the highlight", hl_name}}, true, {})
  -- print(string.format("hl: %s, hl_name: %s", hl, hl_name))

  -- for capture, node in lua_query:query():iter_captures(curr_node, buf, row, endrow) do
  --   print('id', capture)
  --   local node_text = ts_utils.get_node_text(node)
  --   print('node text:', node_text[1])

  --   local hl = lua_query.hl_cache[capture]
  --   local hl_name = vim.fn.synIDattr(hl, "name")
  --   print(string.format('hl: %s, name: %s', hl, hl_name))
  -- end

end

function M.node_type()
  local curr_node = ts_utils.get_node_at_cursor()
  print(type(curr_node))
end

function M.show_cursor_diagnostic(bufnr)
  local diagnostics = vim.lsp.diagnostic

  bufnr = bufnr or api.nvim_get_current_buf()
  local pos = api.nvim_win_get_cursor()
  local line = pos[1] - 1
  local col = pos[2]
  local my_diagnostics = diagnostics.get_line_diagnostics(bufnr, line)
end

function M.spawn(fn)
  local idle = uv.new_idle()

  local start
  if type(fn) == "function" then
    start = function()
      idle:start(function()
        vim.schedule(fn)
      end)
    end
  elseif type(fn) == "thread" then
    print('its a thread')
    start = function()
      idle:start(function()
        local _, _ = coroutine.resume(fn)

        if coroutine.status(fn) == "dead" then
          idle:stop()
        end
      end)
    end
  end

  local function stop()
    idle:stop()
  end

  return start, stop
end

function M.test_idle()
  local start, stop = M.spawn(function()
    print('hello')
    vim.fn.wait(100, 1)
  end)
  start()
end

function M.nvim_headless()
    local nvim = vim.fn.jobstart({'nvim', '--embed'}, {rpc = true})
    print(vim.fn.rpcnotify(nvim, 'nvim_eval', '"Hello " . "world!"'))
    vim.fn.jobstop(nvim)
end

function M.get_inserted_text(old, new)
   local prv = {}
   for o = 0, #old do
      prv[o] = ""
   end
   for n = 1, #new do
      local nxt = {[0] = new:sub(1, n)}
      local nn = new:sub(n, n)
      for o = 1, #old do
         local result
         if nn == old:sub(o, o) then
            result = prv[o-1]
         else
            result = prv[o]..nn
            if #nxt[o-1] <= #result then
               result = nxt[o-1]
            end
         end
         nxt[o] = result
      end
      prv = nxt
   end
   return prv[#old]
end

do
  local line_difference

  vim.cmd [[autocmd! InsertLeave * lua require'utils'.reset_indices()]]
  vim.cmd [[autocmd! CursorMovedI * lua require'utils'.reset_indices()]]

  function M.test_on_lines()
    api.nvim_buf_attach(0, false, {
      on_lines = function()
        local mode = api.nvim_get_mode()["mode"]
        if mode ~= "i" and mode ~= "ic" then return end
        print(M.set_byte_index())
      end
    })
  end

  function M.test_byte_index()
    vim.cmd [[autocmd TextChangedP <buffer> lua vim.api.nvim_out_write(require'utils'.set_byte_index() .. '\n')]]
    
  end

  function M.TextDeleteP()
    vim.cmd [[autocmd User TextDeleteP lua require'utils'.echo_counter()]]
  end

  function M.print_item()
    dump(vim.v.completd_item)
  end

  function M.set_byte_index()
    if vim.fn.pumvisible() == 1 then return '' end
    local new_difference = vim.fn.col('$')
    if line_difference == nil then
      line_difference = new_difference
      return ''
    end
    local res = new_difference - line_difference
    line_difference = new_difference
    return res
  end

  function M.reset_indices()
    line_difference = nil
  end
end

do
  local counter = 0
  function M.echo_counter()
    print(counter)
    counter = counter + 1
  end
end

function M.keystroke()
  local function matches_delete(key)
    local termcode = function(key_vim)
      vim.api.nvim_replace_termcodes(key_vim, true, false, true)
    end

    if key == termcode("<BS>")
      or key == termcode("<Del>")
      or key == termcode("<C-H>")
      or key == termcode("<C-W>") then return true end
    return false
  end

  vim.register_keystroke_callback(function(key) 
    if matches_delete(key) then
      print('yes')
    else
      print('no')
    end
  end, 0)
end

function M.test_complete()
  local entries = {}
  for _ = 1, 100 do
    table.insert(entries, {
      word = "",
      abbr = "00000000000000000000000000000000000000000000000000000000000000000000000",
      equal = 1,
      dup = 1,
      empty = 1,
    })
  end
  vim.api.nvim_complete(1, entries, {})
end

function M.test_complete_au()
  vim.cmd [[autocmd CompleteDone <buffer> lua require'utils'.echo_counter()]]
end

return M
