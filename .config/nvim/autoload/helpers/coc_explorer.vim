function helpers#coc_explorer#open_explorer(args)
  " if &filetype != 'coc-explorer'
    let g:explorer_file_win = winnr()
    execute "CocCommand explorer" a:args
    let g:explorer_win = winnr()
  " endif
endfunction
