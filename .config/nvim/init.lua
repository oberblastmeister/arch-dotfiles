-- some globals for convenience
R = require
A = vim.api

if vim.fn.exists('g:vscode') == 1 then
  require"vscode"
  return
end

vim.o.termguicolors = true

vim.g.loaded_python_provider = 0

require"defaults".setup()
require"plugins".setup()
require"config/neovide".setup()

vim.cmd
[[function! SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc]]

vim.cmd [[nmap <leader>tt <Plug>PlenaryTestFile]]

vim.cmd
[[
function! SynGroup()                                                            
    let l:s = synID(line('.'), col('.'), 1)                                       
    echo synIDattr(l:s, 'name') . ' -> ' . synIDattr(synIDtrans(l:s), 'name')
endfun
]]

function feedkeys(keys, mode)
  keys = A.nvim_replace_termcodes(keys, true, true, true)
  A.nvim_feedkeys(keys, mode, true)
end

function replace(keys)
  return A.nvim_replace_termcodes(keys, true, true, true)
end

vim.cmd [[nnoremap <leader><CR> <cmd>luafile %<CR>]]
