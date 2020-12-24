" if exists('g:GtkGuiLoaded')
"   call rpcnotify(1, 'Gui', 'Font', 'FiraCode Nerd Font 12')
" endif

" Guifont! FiraCode Nerd Font:h12
Guifont! OperatorMono Nerd Font:h13:style=Book

" basic right click menu
nnoremap <silent><RightMouse> :call GuiShowContextMenu()<CR>
inoremap <silent><RightMouse> <Esc>:call GuiShowContextMenu()<CR>
vnoremap <silent><RightMouse> :call GuiShowContextMenu()<CR>
