nnoremap <buffer> m<CR> :exe "Dispatch go build" . expand("%:p")<CR>
nnoremap <buffer> m! :Dispatch! cargo build<CR>
