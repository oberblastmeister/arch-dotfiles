" some random bash mappings

" backwards delete
" inoremap <C-d> <Del>

" arrow key raplcements
imap <C-f> <Right>
imap <C-b> <Left>
imap <C-p> <Up>
imap <C-n> <Down>
imap <C-d> <Del>
imap <C-h> <BS>

" home and end insert mappings
imap <C-a> <Esc>I
imap <C-e> <End>

" Path completion with custom source command
inoremap <expr> <c-x><c-f> fzf#vim#complete#path('fd')
inoremap <expr> <c-x><c-f> fzf#vim#complete#path('rg --files')

" Word completion with custom spec with popup layout option
inoremap <expr> <c-x><c-k> fzf#vim#complete#word({'window': { 'width': 0.2, 'height': 0.9, 'xoffset': 1 }})
