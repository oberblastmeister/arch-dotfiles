function! helpers#lightline#read_only()
  return &readonly ? '' : ''
endfunction

function! helpers#lightline#fugitive()
  if exists('*FugitiveHead')
    let branch = FugitiveHead()
    return branch !=# '' ? ''.branch : ''
  endif
  return ''
endfunction
