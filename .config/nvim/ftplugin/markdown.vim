let b:coc_suggest_disable = 1

setlocal signcolumn=yes
setlocal wrap
setlocal linebreak
setlocal conceallevel=0

nmap <buffer> _ <Plug>VimwikiRemoveHeaderLevel

nmap <buffer> j gj
nmap <buffer> k gk
xmap <buffer> j gj
xmap <buffer> k gk
" nnoremap <buffer> <CR> <cmd>lua require'neuron'.enter_link()<CR>
" nnoremap <buffer> gzn <cmd>lua require'neuron'.new()<CR>
" nnoremap <buffer> gzz <cmd>lua require'neuron'.find_zettels()<CR>
" nnoremap <buffer> gzb <cmd>lua require'neuron'.find_backlinks()<CR>
" nnoremap <buffer> gzs <cmd>lua require'neuron'.rib {address = "127.0.0.1:8200", verbose = true}<CR>
" nnoremap <buffer> gz] <cmd>lua require'neuron'.goto_next_extmark()<CR>
" nnoremap <buffer> gz[ <cmd>lua require'neuron'.goto_prev_extmark()<CR>
" let b:ale_linters = ['markdownlint', 'languagetool']
