local loop = vim.loop
local api = vim.api

local M = {}

function M.push()
  local stdout = loop.new_pipe(false)
  local stderr = loop.new_pipe(false)
  local git_dir = os.getenv("GIT_DIR")
  local command
  if git_dir == vim.fn.expand("~/.config/yadm/repo.git") then
    assert(vim.fn.executable("yadm") == 1, "yadm is not executable")
    command = "yadm"
  else
    assert(vim.fn.executable("git") == 1, "git is not executable")
    command = "git"
  end

  handle = vim.loop.spawn(command, {
    args = {"push"},
    stdio = {stdout, stderr},
  },
  vim.schedule_wrap(function()
    stdout:read_stop()
    stderr:read_stop()
    stdout:close()
    stderr:close()
    handle:close()
    print('finished pusshing')
  end))
end

return M
