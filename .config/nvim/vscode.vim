" better vscode navigation
nnoremap <silent> <C-j> :call VSCodeNotify('workbench.action.navigateDown')<CR>
xnoremap <silent> <C-j> :call VSCodeNotify('workbench.action.navigateDown')<CR>
nnoremap <silent> <C-k> :call VSCodeNotify('workbench.action.navigateUp')<CR>
xnoremap <silent> <C-k> :call VSCodeNotify('workbench.action.navigateUp')<CR>
nnoremap <silent> <C-h> :call VSCodeNotify('workbench.action.navigateLeft')<CR>
xnoremap <silent> <C-h> :call VSCodeNotify('workbench.action.navigateLeft')<CR>
nnoremap <silent> <C-l> :call VSCodeNotify('workbench.action.navigateRight')<CR>
xnoremap <silent> <C-l> :call VSCodeNotify('workbench.action.navigateRight')<CR>

" vscode commenting
xmap <silent> <leader>c  <Plug>VSCodeCommentary
nmap <silent> <leader>c  <Plug>VSCodeCommentary
omap <silent> <leader>c  <Plug>VSCodeCommentary
nmap <silent> <leader>cc <Plug>VSCodeCommentaryLine

nnoremap <leader>w :Write<CR>
nnoremap <leader>W :Wall<CR>

nnoremap <leader>x :Wq<CR>
nnoremap <leader>x :Wqall<CR>

nnoremap <leader>q :Quit<CR>
nnoremap <leader>Q :Qall!<CR>

nnoremap <leader>o :Only<CR>
