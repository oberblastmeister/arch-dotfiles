" tmux navigator does this already
" nnoremap <C-J> <C-W><C-J>
" nnoremap <C-K> <C-W><C-K>
" nnoremap <C-L> <C-W><C-L>
" nnoremap <C-H> <C-W><C-H>

nnoremap <tab> za

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

" open lf file manager
" ====================================================================
" ============================= Open Lf ==================================================================
" ============================================================================
" like vim vinegar
" select file in lf
nnoremap <silent> - :exe "FloatermNew lf " . expand('%:p')<CR>
" open dir in lf
nnoremap <silent> _ :exe "FloatermNew lf " . expand('%:p:h')<CR>
