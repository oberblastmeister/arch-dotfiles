" Use ag to grep for word under cursor

" Show all diagnostics.
nnoremap <silent> \a  :<C-u>CocList diagnostics<CR>

" " Manage extensions.
nnoremap <silent> \p  :<C-u>CocList extensions<CR>

" Show commands.
nnoremap <silent> \c  :<C-u>CocList commands<CR>

" Show vim command
nnoremap <silent> \v  :Clap command<CR>

" Find symbol of current document.
nnoremap <silent> \t  :Vista finder<CR>

" find buffers
nnoremap <silent> <c-b> :Buffers<CR>

nnoremap <silent> <leader>u :History<cr>

" show colors
nnoremap <silent> \C :Clap colors<CR>

" general coclist
nnoremap <silent> \l :CocList<CR>

" find mappings
nnoremap <silent> \m :Clap maps<CR>

" fuzzy search lines in current buffer
nnoremap <silent> <leader>/ :BLines<CR>

" " [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1

command! -bang -nargs=? -complete=dir Dotfiles
    \ call fzf#vim#files(
    \   'yadm list -a -- '.shellescape(<q-args>), 1,
    \   fzf#vim#with_preview(), <bang>0)

command! -nargs=? Dotfiles 
      \ call fzf#run(fzf#wrap(
      \     {'source': 'yadm list -a', 'sink': 'e', 'options': '--preview "bat --style=numbers --color=always --line-range :500 --theme=gruvbox {}"'}))

" common fzf commands

let g:which_key_map.f = [ 'Files', 'search for files' ]
nnoremap <silent> <leader>. :cd ~<CR>:Dotfiles<CR>
let g:which_key_map['.'] = 'search for dotfiles'
let g:which_key_map.T = [ 'Rg', 'grep' ]
let g:which_key_map.h = [ 'Help', 'search for help' ]
let g:which_key_map.n = [ 'NV', 'notational velocity' ]
let g:which_key_map['/'] = [ 'Blines', 'fuzzy /' ]
