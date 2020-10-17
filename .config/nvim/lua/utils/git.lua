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
    print("Using yadm instead of git")
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
    print('finished pushing')
  end))

  local function on_read_stdout(err, data)
    assert(not err, "Failed to read stdout of command: " .. err)

    if data then
      print('Output: ', data)
    end
  end

  local function on_read_stderr(err, data)
    assert(not err, "Failed to read sterr of command: " .. (err or "no error"))

    if data then
      error("An error occured while calling push: " .. data)
    end
  end

  loop.read_start(stdout, on_read_stdout)
  loop.read_start(stderr, on_read_stderr)
end

return M
