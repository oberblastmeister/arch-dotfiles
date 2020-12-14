local dap = require("dap")

local M = {}

local dap = require 'dap'
-- dap.adapters.cpp = {
--   type = 'executable',
--   name = "cppdbg",
--   command = vim.api.nvim_get_runtime_file(
--       "gadgets/linux/vscode-cpptools/debugAdapters/OpenDebugAD7", false)[1],
--   args = {},
--   attach = {pidProperty = "processId", pidSelect = "ask"}
-- }
dap.adapters.cpp = {
  type = 'executable',
  attach = {
    pidProperty = "pid",
    pidSelect = "ask"
  },
  command = vim.api.nvim_get_runtime_file(
      "gadgets/linux/CodeLLDB/adapter/codelldb", false)[1],
  env = {
    LLDB_LAUNCH_FLAG_LAUNCH_IN_TTY = "YES"
  },
  name = "lldb"
}

local last_gdb_config

M.start_c_debugger = function(args, mi_mode, mi_debugger_path)
  local dap = require "dap"
  if args and #args > 0 then
    last_gdb_config = {
      type = "cpp",
      name = args[1],
      request = "launch",
      program = table.remove(args, 1),
      args = args,
      cwd = vim.fn.getcwd(),
      env = {"VAR1=value1", "VAR2=value"}, -- environment variables are set via `ENV_VAR_NAME=value` pairs
      externalConsole = true,
      MIMode = mi_mode or "gdb",
      MIDebuggerPath = mi_debugger_path
    }
  end

  if not last_gdb_config then
    print(
        'No binary to debug set! Use ":DebugC <binary> <args>" or ":DebugRust <binary> <args>"')
    return
  end

  dap.run(last_gdb_config)
  dap.repl.open()
end

function M.setup()
  vim.cmd [[
    command! -complete=file -nargs=* DebugC lua require "config/dap".start_c_debugger({<f-args>}, "gdb")
]]
  vim.cmd [[
    command! -complete=file -nargs=* DebugRust lua require "config/dap".start_c_debugger({<f-args>}, "gdb", "rust-gdb")
]]
  -- show virtual text for current frame (recommended)
  vim.g.dap_virtual_text = true
  -- request variable values for all frames (experimental)
  vim.g.dap_virtual_text = 'all frames'
end

return M
