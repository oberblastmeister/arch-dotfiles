" ============================================================================
" Defaults {{{
" ============================================================================
nnoremap U :UndotreeToggle<CR>

nnoremap <s-tab> za

" stop that stupid window from popping up
nmap q: :q

" add move keys to jumplist and also swap j and k with gj gk
nnoremap <expr> k (v:count > 1 ? "m'" . v:count : '') . 'k'
nnoremap <expr> j (v:count > 1 ? "m'" . v:count : '') . 'j'

" consistency mapping
nnoremap Y y$

" delete inner line (without line break)
nnoremap dil ^D

" paste without newline
nnoremap gP i<CR><Esc>PkJxJx
nnoremap gp a<CR><Esc>PkJxJx

nnoremap c* *Ncgn

nnoremap <silent> <expr> <CR> empty(&buftype) ? '@@' : '<CR>'

nnoremap <silent> <C-n> <cmd>tabnew<CR>

nnoremap <silent> <leader>vo <cmd>belowright 13split <bar> T<CR>
nnoremap <silent> <leader>vs <cmd>vsplit <bar> T<CR>
nnoremap <silent> <leader><CR> <cmd>T<CR>
" }}}

" ============================================================================
" EasyAlign {{{
" ============================================================================
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

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
nnoremap <silent> - :exe "FloatermNew lf " . expand('%:p')<CR>
" nnoremap <silent> - :Lf<CR>
" open dir in lf
nnoremap <silent> _ :exe "FloatermNew lf " . getcwd()<CR>
" nnoremap <silent> _ :LfCurrentWorkingDirectory<CR>
" }}}

" ============================================================================
" Chunk {{{
" ============================================================================
" jump chunk and add position to jumplist
" nmap <silent> [h :silent execute "normal m'\<Plug>(coc-git-prevchunk)"<CR>
" nmap <silent> ]h :silent execute "normal m'\<Plug>(coc-git-nextchunk)"<CR>

nmap <silent> ]h <plug>(signify-next-hunk)
nmap <silent> [h <plug>(signify-prev-hunk)
nmap <silent> [H 9999<leader>[h
nmap <silent> ]H 9999<leader>]h

" chunk text objects
omap ih <plug>(signify-motion-inner-pending)
xmap ih <plug>(signify-motion-inner-visual)
omap ah <plug>(signify-motion-outer-pending)
xmap ah <plug>(signify-motion-outer-visual)
" }}}
