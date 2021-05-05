-- some globals for convenience
R = require
A = vim.api

function each(z)
  return (function (x) return x(x) end) (function (x) return function (...) z(...) return x(x) end end)
end

function reload(module)
  require('plenary.reload').reload_module(module)
end

if vim.fn.exists('g:vscode') == 1 then
  require"vscode"
  return
end

vim.o.termguicolors = true

vim.g.loaded_python_provider = 0

require"defaults".setup()
require"plugins".setup()
require"config/neovide".setup()

function feedkeys(keys, mode)
  keys = A.nvim_replace_termcodes(keys, true, true, true)
  A.nvim_feedkeys(keys, mode, true)
end

function replace(keys)
  return A.nvim_replace_termcodes(keys, true, true, true)
end

vim.cmd [[nnoremap <leader><CR> <cmd>luafile %<CR>]]
