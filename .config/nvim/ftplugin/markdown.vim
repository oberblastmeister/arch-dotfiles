let b:coc_suggest_disable = 1

setlocal signcolumn=yes
setlocal wrap
setlocal linebreak
setlocal conceallevel=0

nmap <buffer> _ <Plug>VimwikiRemoveHeaderLevel
nmap <buffer> <CR> gzo
nmap <buffer> gzn <cmd>lua require'neuron'.new()<CR>
nmap <buffer> gzz <cmd>lua require'neuron'.find_zettels()<CR>
" let b:ale_linters = ['markdownlint', 'languagetool']
