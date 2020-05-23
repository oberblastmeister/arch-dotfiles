" stop that stupid window from popping up
nmap q: :q

" don't enter ex mode
nmap Q q

" add move keys to jumplist and also swap j and k with gj gk
nnoremap <expr> k (v:count > 5 ? "m'" . v:count : '') . 'gk'
nnoremap <expr> j (v:count > 5 ? "m'" . v:count : '') . 'gj'
nnoremap gj j
nnoremap gk k

command! StartupTime :call VimuxRunCommand("python3 /home/brian/vim-profiler/vim-profiler.py -p nvim ")

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

" Make moving around easier
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Put arrow keys to use
nmap <Up> [e
nmap <Down> ]e
vmap <Up> [egv
vmap <Down> ]egv

" Fix syntax highlighting plus more
nnoremap <silent> <leader>l :nohlsearch<cr>:diffupdate<cr>:syntax sync fromstart<cr><c-l>
