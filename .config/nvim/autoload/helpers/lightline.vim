function! helpers#lightline#read_only() abort
  return &readonly ? '' : ''
endfunction

function! helpers#lightline#fugitive() abort
  if exists('*FugitiveHead')
    let branch = FugitiveHead()
    return branch !=# '' ? ''.branch : ''
  endif
  return ''
endfunction

function! helpers#lightline#lsp() abort
  if luaeval('#vim.lsp.buf_get_clients() > 0')
    return luaeval("require('lsp-status').status()")
  endif

  return ''
endfunction

function! helpers#lightline#treesitter() abort
  return nvim_treesitter#statusline(30)
  " let l:string = nvim_treesitter#statusline(30)
  " if l:string == null
  "   return ''
  " else
  "   return l:string
  " end
endfunction
