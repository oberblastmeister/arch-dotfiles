local snippets = require("snippets")
local Job = require("plenary/job")
local U = require'snippets.utils'
local insert = table.insert

local function from_file(fname)
  return function()
    local file = io.open(fname)
    local data = "FAILED TO LOAD "..fname
    if file then
      data = file:read "*a"
      file:close()
    end
    return data
  end
end

function git_project_name()
  local res
  Job:new {
    command = "git",
    args = {"rev-parse", "--show-toplevel"},
    on_stdout = function(err, data)
      assert(not err, err)

      res = data
    end
  }:start()

  vim.wait(100, function() return res ~= nil end)

  return res:match("[^/]+$")
end

function github_project_url()
  local res = {}
  local done = false
  Job:new {
    command = "git",
    args = {"remote", "-v"},
    on_stdout = function(err, data)
      assert(not err, err)

      insert(res, data)
    end,
    on_exit = function(self, code, signal)
      done = true
    end
  }:start()

  vim.wait(100, function() return done end)

  for _, line in ipairs(res) do
    print(line)
    local n = line:match("^origin.*:([^/:]+/[^/]+)%.git")
    if not n then
      n = line:match("^origin.*/([^/]+/[^/%s]+)")
    end
    if n then
      return "https://github.com/"..n
    end
  end
end

local function setup()
  snippets.set_ux(require'snippets.inserters.text_markers')
  snippets.snippets = {
    _global = {
      uname = function() return vim.loop.os_uname().sysname end,
      date = os.date,

      vimscriptplugin = [[
" Author: Foo Bar <foo.bar@example.org>
" Description: $2

if exists('g:loaded_$1') | finish | endif
let g:loaded_$1 = 1

let s:save_cpo = &cpoptions
set cpoptions&vim

$0

let &cpoptions = s:save_cpo
unlet s:save_cpo ]],

    GPL = (function()
      local S, indent_var = U.match_indentation(U.force_comment [[
Copyright (C) ${=os.date("%Y")} Brian Shu
This is part of the ${=git_project_name()} distribution.
${=github_project_url()}

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <https://www.gnu.org/licenses/>.]])
      insert(S, '\n')
      insert(S, indent_var)
      return S
    end)(),

    MIT = U.match_indentation([[
Copyright ${=os.date("%Y")} Brian Shu

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
]])
    }
  }
end

return {setup = setup}
