" Use ag to grep for word under cursor
vnoremap <silent> <Leader>ag :Clap grep2 ++query=@visual<CR>
nnoremap <Leader>ag :call fuzzy_finding#rg_and_replace()<CR>

" Mappings using CoCList:

" Show all diagnostics.
nnoremap <silent> \a  :<C-u>CocList diagnostics<CR>

" " Manage extensions.
nnoremap <silent> \p  :<C-u>CocList extensions<CR>

" Show commands.
nnoremap <silent> \c  :<C-u>CocList commands<CR>

" Show vim command
nnoremap <silent> \v  :Clap command<CR>

" Find symbol of current document.
nnoremap <silent> \t  :Clap tags<CR>

" find buffers
nnoremap <silent> <C-b> :Clap buffers<CR>

" find files (change back to fzf if clap is to slow)
" nnoremap <silent> <C-t> :Clap files<CR>

nnoremap <silent> <C-t> :call fuzzy_finding#fuzzy_explorer()<Cr>

" clap filer
nnoremap <silent> <C-e> :Clap filer<CR>

" grep
nnoremap <silent> <C-f> :Clap grep2<CR>

" find help (also change back to fzf if clap is too slow)
nnoremap <silent> <leader>h :Clap help_tags<CR>

" most recent (U)sed files
nnoremap <silent> <leader>u :Clap history<cr>

" show colors
nnoremap <silent> \C :Clap colors<CR>

" find dotfiles
" nnoremap <silent> <leader>i :call fuzzy_finding#fuzzy_dotfiles()<CR>
nnoremap <silent> <leader>i :Clap gfiles<CR>

" general coclist
nnoremap <silent> \l :CocList<CR>

" find mappings
nnoremap <silent> \m :Clap maps<CR>

" fuzzy search lines in current buffer
nnoremap <silent> <leader>/ :Clap blines<CR>

" notational fzf
nnoremap <silent> <C-n> :NV<CR>

" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" An action can be a reference to a function that processes selected lines
function! s:build_quickfix_list(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  copen
  cc
endfunction

let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Enable per-command history
" - History files will be stored in the specified directory
" - When set, CTRL-N and CTRL-P will be bound to 'next-history' and
"   'previous-history' instead of 'down' and 'up'.
let g:fzf_history_dir = '~/.local/share/fzf-history'

" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1

" [Tags] Command to generate tags file
let g:fzf_tags_command = 'ctags -R'
