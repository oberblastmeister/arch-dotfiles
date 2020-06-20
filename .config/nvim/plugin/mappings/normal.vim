" tmux navigator does this already
" nnoremap <C-J> <C-W><C-J>
" nnoremap <C-K> <C-W><C-K>
" nnoremap <C-L> <C-W><C-L>
" nnoremap <C-H> <C-W><C-H>

nnoremap <s-tab> za

" stop that stupid window from popping up
nmap q: :q

" don't enter ex mode
" nmap Q <nop>

" add move keys to jumplist and also swap j and k with gj gk
nnoremap <expr> k (v:count > 5 ? "m'" . v:count : '') . 'k'
nnoremap <expr> j (v:count > 5 ? "m'" . v:count : '') . 'j'

" consistency mapping
nnoremap Y y$

" delete inner line (without line break)
nnoremap dil ^D

" paste without newline
nnoremap gP i<CR><Esc>PkJxJx
nnoremap gp a<CR><Esc>PkJxJx

" ctrl-l turns off highight update syntax highlighting and redraws
nnoremap <leader>l :nohlsearch<cr>:diffupdate<cr>:syntax sync fromstart<cr><c-l>

" EasyAlign mappings
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Put arrow keys to use
nmap <Up> [e
nmap <Down> ]e
vmap <Up> [egv
vmap <Down> ]egv

" ====================================================================
" ============================= Open Lf ==================================================================
" ============================================================================

" like vim vinegar
" select file in lf
nnoremap <silent> - :exe "FloatermNew lf " . expand('%:p')<CR>
" open dir in lf
nnoremap <silent> _ :exe "FloatermNew lf " . expand('%:p:h')<CR>

" ==============================================================
" =============================== Signify =========================
" =============================================================

" " jump between hunks
" nmap ]h <plug>(signify-next-hunk)
" nmap [h <plug>(signify-prev-hunk)
" nmap ]H 9999]h
" nmap [H 9999[h

" " hunk text objects
" omap ih <plug>(signify-motion-inner-pending)
" xmap ih <plug>(signify-motion-inner-visual)
" omap ah <plug>(signify-motion-outer-pending)
" xmap ah <plug>(signify-motion-outer-visual)
" jump hunks
" nmap [h <Plug>(coc-git-prevchunk)
" nmap ]h <Plug>(coc-git-nextchunk)

" jump hunks and add position to jumplist
nmap <silent> [c :execute "normal m'\<Plug>(coc-git-prevchunk)"<CR>
nmap <silent> ]c :execute "normal m'\<Plug>(coc-git-nextchunk)"<CR>

" hunk text objects
omap ic <Plug>(coc-git-chunk-inner)
xmap ic <Plug>(coc-git-chunk-inner)
omap ac <Plug>(coc-git-chunk-outer)
xmap ac <Plug>(coc-git-chunk-outer)
