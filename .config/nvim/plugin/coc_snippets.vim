if filereadable('/home/brian/.local/share/nvim/plugged/coc.nvim/plugin/coc.vim')

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
" let g:_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
" let g:_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

endif
