" ============================================================================
" Defaults {{{
" ============================================================================
nnoremap <s-tab> za

" add move keys to jumplist and also swap j and k with gj gk
nnoremap <expr> k (v:count > 1 ? "m'" . v:count : '') . 'k'
nnoremap <expr> j (v:count > 1 ? "m'" . v:count : '') . 'j'

" consistency mapping
nnoremap Y y$

" delete inner line (without line break)
nmap dil ^D
nmap dal ^D"_dd

" paste without newline
nnoremap gP i<CR><Esc>PkJxJx
nnoremap gp a<CR><Esc>PkJxJx

nnoremap c* *Ncgn

" nnoremap <silent> <expr> <CR> empty(&buftype) ? '@@' : '<CR>'

nnoremap <silent> <C-n> <cmd>tabnew<CR>

" nnoremap <silent> <leader>vo <cmd>belowright 13split <bar> T<CR>
nnoremap <silent> <leader>vo <cmd>lua require'termwrapper'.TermWrapper.new(nil, "belowright split", nil, nil)<CR>
nnoremap <silent> <leader>vs <cmd>lua require'termwrapper'.TermWrapper.new(nil, "vsplit")<CR>
" nnoremap <silent> <leader><CR> <cmd>T<CR>
nnoremap <silent> <c-t> <cmd>lua vim.schedule(function() require'termwrapper'.toggle_count() end)<CR>
tnoremap <silent> <c-t> <cmd>lua require'termwrapper'.close_current()<CR>
" }}}

" Put arrow keys to use
" nmap <Up> [e
" nmap <Down> ]e
" vmap <Up> [egv
" vmap <Down> ]egv
nmap <Up> <Nop>
nmap <Down> <Nop>
nmap <Left> <Nop>
vmap <Up> <Nop>
vmap <Down> <Nop>
vmap <Left> <Nop>
vmap <Right> <Nop>
" }}}

" ============================================================================
" File Manager {{{
" ============================================================================

" like vim vinegar
" select file in lf
" nnoremap <silent> - :Lf<CR>
" open dir in lf
" nnoremap <silent> _ :exe "FloatermNew lf " . getcwd()<CR>
" nnoremap <silent> _ :LfCurrentWorkingDirectory<CR>
" }}}

noremap <expr> <Plug>(StopHL) execute('nohlsearch')[-1]
noremap! <expr> <Plug>(StopHL) execute('nohlsearch')[-1]

fu! HlSearch()
    " let s:pos = match(getline('.'), @/, col('.') - 1) + 1
    " if s:pos != col('.')
    "     call StopHL()
    " endif
    call StopHL()
endfu

fu! StopHL()
    if !v:hlsearch || mode() isnot 'n'
        return
    else
        sil call feedkeys("\<Plug>(StopHL)", 'm')
    endif
endfu

augroup SearchHighlight
au!
    au CursorMoved * call HlSearch()
    au InsertEnter * call StopHL()
augroup end
" }}}
