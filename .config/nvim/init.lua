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

vim.cmd [[noremap <Plug>(DisableSearchHl) <cmd>nohl<CR>]]
