local M = {}

local utils = require('utils')

local api = vim.api
local dap = require("dap")

M.PACK_DIR = api.nvim_get_runtime_file("pack/", false)[1]
M.PACKER_DIR = M.PACK_DIR .. 'packer/'
M.START_DIR = M.PACKER_DIR .. 'start/'
M.OPT_DIR = M.PACKER_DIR .. 'opt/'

local VIMSPECTOR_DIR = M.OPT_DIR .. 'vimspector/'

dap.adapters.haskell = {
  type = 'executable';
  command = 'haskell-debug-adapter';
  args = {'--hackage-version=0.0.33.0'};
}

dap.configurations.haskell = {
  {
    type = 'haskell',
    request = 'launch',
    name = 'Debug',
    workspace = '${workspaceFolder}',
    startup = "${file}",
    stopOnEntry = true,
    logFile = vim.fn.stdpath('data') .. '/haskell-dap.log',
    logLevel = 'WARNING',
    ghciEnv = vim.empty_dict(),
    ghciPrompt = "Prelude> ",
    -- ghciPrompt = "λ: ",
    -- Adjust the prompt to the prompt you see when you invoke the stack ghci command below 
    ghciInitialPrompt = "Prelude> ",
    -- ghciInitialPrompt = "λ: ",
    ghciCmd= "stack ghci --test --no-load --no-build --main-is TARGET --ghci-options -fprint-evld-with-show",
  },
}

M.start_haskell = function()
  dap.run(dap.configurations.haskell[1])
  dap.repl.open()
end

dap.adapters.cpp = {
  type = 'executable',
  name = "cppdbg",
  command = VIMSPECTOR_DIR .. "gadgets/linux/vscode-cpptools/debugAdapters/OpenDebugAD7",
  args = {},
  attach = {
    pidProperty = "processId",
    pidSelect = "ask"
  }
}

-- dap.adapters.cpp = {
--   type = 'executable',
--   attach = {
--     pidProperty = "pid",
--     pidSelect = "ask"
--   },
--   command = "lldb-vscode",
--   env = {
--     LLDB_LAUNCH_FLAG_LAUNCH_IN_TTY = "YES"
--   },
--   name = "lldb"
-- }

function M.start_rust_debugger()
  local config = {
    type = "cpp",
    name = "target/release/crates-index",
    request = "launch",
    program = "target/release/crates-index",
    args = "hello dude",
    cwd = vim.fn.getcwd(),
    -- env = {"VAR1=value1", "VAR2=value"}, -- environment variables are set via `ENV_VAR_NAME=value` pairs
    externalConsole = true,
    MIMode = "gdb",
    MIDebuggerPath = "rust-gdb"
  }
  dap.run(config)
  dap.repl.open()
end

do
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
        -- env = {"VAR1=value1", "VAR2=value"}, -- environment variables are set via `ENV_VAR_NAME=value` pairs
        externalConsole = true,
        MIMode = mi_mode or "gdb",
        MIDebuggerPath = mi_debugger_path
      }
    end

    if not last_gdb_config then
      print('No binary to debug set! Use ":DebugC <binary> <args>" or ":DebugRust <binary> <args>"')
      return
    end

    dap.run(last_gdb_config)
    dap.repl.open()
  end
end

function M.setup()
  require('dap-python').setup('~/.virtualenvs/debugpy/bin/python')

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
