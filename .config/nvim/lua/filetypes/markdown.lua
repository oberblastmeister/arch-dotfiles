local api = vim.api
local Job = require('plenary/job')
local utils = require('utils')

local M = {}

function M.setup()
  vim.g.vim_markdown_no_default_key_mappings = 1
  vim.g.vim_markdown_conceal = 0
  vim.g.vim_markdown_conceal_code_blocks = 0
  vim.g.vim_markdown_auto_insert_bullets = 1
  vim.g.vim_markdown_math = 1
  vim.g.vim_markdown_strikethrough = 1
end

local function on_stdout_factory(name)
  return vim.schedule_wrap(function(error, data)
    assert(not error, error)
    vim.fn.echomsg(string.format('Stdout of job %s %s', name, data))
  end)
end

local function on_stderr_factory(name)
  return vim.schedule_wrap(function(error, data)
    assert(not error, error)
    vim.fn.echoerr('An error occurred from job %s: %s', name, data)
  end)
end

local function on_exit_factory(name)
  return vim.schedule_wrap(function(self, code, signal)
    if code ~= 0 then
      vim.fn.echoerr(string.format('The job %s exited with a non-zero code', name))
    end
  end)
end

function M.convert_to_pdf(open)
  local shortname = vim.fn.expand('%:t:r')
  local fullname = api.nvim_buf_get_name(0)
  local newname = shortname .. '.pdf'

  Job:new {}
  Job:new {
    command = 'pandoc',
    args = {fullname, '-o', newname},
    on_stdout = on_stdout_factory('pandoc'),
    on_stderr = on_stderr_factory('pandoc'),
    on_exit = vim.schedule_wrap(function(self, code, signal)
      if code ~= 0 then
        vim.fn.echoerr(string.format('The job %s exited with a non-zero code', name))
      end

      if open then M.zathura(newname) end
    end),
  }:start()
end

function M.watch_file()
  utils.augroup('PandocConversion')
  M.convert_to_pdf(true)
  utils.autocmd('BufWritePost', [[lua require'filetypes/markdown'.convert_to_pdf(false)]], {group = 'PandocConversion'})
end

function M.zathura(path)
  Job:new {
    command = 'zathura',
    args = {path},
    on_stdout = on_stdout_factory('zathura'),
    on_stderr = on_stderr_factory('zathura'),
    on_exit = on_exit_factory('zathura')
  }:start()
end


function M.convert_to_pdf_old()
  handle, pid = vim.loop.spawn('pandoc', {
    args = {fullname, '-o', newname}
  },
  function()
    print('Document Conversion Complete')
    handle:close()
    if handle2 == nil then
      handle2, pid2 = vim.loop.spawn('zathura', {
        args = {newname}
      },
      function()
        print('closing')
        handle2:close()
      end)
    end
  end)
end

return M
