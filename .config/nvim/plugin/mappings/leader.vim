" ============================================================================
" Regular {{{
" ============================================================================
function! Write()
  write
  edit
  TSBufEnable highlight
endfunction

nnoremap <silent> <leader>w <cmd>write<CR>
nnoremap <silent> <leader>W <cmd>wall<CR>

nnoremap <silent> <leader>x <cmd>xit<CR>
nnoremap <silent> <leader>X <cmd>xall<CR>


nnoremap <silent> <leader>q <cmd>quit<CR>
nnoremap <silent> <leader>Q <cmd>qa!<CR>
nnoremap <silent> <C-q> <cmd>BufferClose<CR>

nnoremap <silent> <leader>p <cmd>put<CR>

nnoremap <silent> <leader>o <cmd>only<CR>

nnoremap <LocalLeader>e :edit <C-R>=expand('%:p:h') . '/'<CR>
" }}}

" misc buffer mappings
nnoremap <silent> <leader>bD :Bufonly<CR>
nnoremap <silent> <leader>bd :bd<CR>
nnoremap <silent> <leader>bk :%bdelete<CR>
nnoremap <silent> <leader>bl :ls<CR>

" ============================================================================
" Git {{{
" ============================================================================
nnoremap <leader>gs <cmd>Neogit<CR>
nnoremap <silent> <leader>gb :G blame<CR>
nnoremap <silent> <leader>gl :G log<CR>
nnoremap <silent> <leader>ga :G add %:p<CR>
nnoremap <silent> <leader>gc :G commit<CR>
nnoremap <silent> <leader>gp :execute ":Git push -u origin " . fugitive#head(0)<CR>
" }}}

" ============================================================================
" Quickfix {{{
" ============================================================================
nnoremap <silent> <leader>cO :Copen<CR>
nnoremap <silent> <leader>co :copen<CR>
nnoremap <silent> <leader>cw :cw<CR>
nnoremap <silent> <leader>cq :ccl<CR>
nnoremap <silent> <leader>cf :cnf<CR>


" ============================================================================
" Test {{{
" ============================================================================
nmap <silent> <Leader>tn :TestNearest<CR>
nmap <silent> <Leader>tf :TestFile<CR>
nmap <silent> <Leader>ts :TestSuite<CR>
nmap <silent> <Leader>tl :TestLast<CR>
nmap <silent> <Leader>tv :TestVisit<CR>
" }}}

" lua tree
nnoremap <silent> <leader>- <cmd>NvimTreeFindFile<Cr>
