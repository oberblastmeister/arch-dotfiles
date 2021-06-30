local api = vim.api

vim.cmd [[set noloadplugins]]

api.nvim_exec([[
nnoremap <silent> <C-j> :call VSCodeNotify('workbench.action.navigateDown')<CR>
xnoremap <silent> <C-j> :call VSCodeNotify('workbench.action.navigateDown')<CR>
nnoremap <silent> <C-k> :call VSCodeNotify('workbench.action.navigateUp')<CR>
xnoremap <silent> <C-k> :call VSCodeNotify('workbench.action.navigateUp')<CR>
nnoremap <silent> <C-h> :call VSCodeNotify('workbench.action.navigateLeft')<CR>
xnoremap <silent> <C-h> :call VSCodeNotify('workbench.action.navigateLeft')<CR>
nnoremap <silent> <C-l> :call VSCodeNotify('workbench.action.navigateRight')<CR>
xnoremap <silent> <C-l> :call VSCodeNotify('workbench.action.navigateRight')<CR>

-- " vscode commenting
-- xmap <silent> <leader>c  <Plug>VSCodeCommentary
-- nmap <silent> <leader>c  <Plug>VSCodeCommentary
-- omap <silent> <leader>c  <Plug>VSCodeCommentary
-- nmap <silent> <leader>cc <Plug>VSCodeCommentaryLine

-- nnoremap <leader>o :Only<CR>
]], false)
