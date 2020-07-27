" ============================================================================
" Commands {{{
" ============================================================================
command! -bang -nargs=? -complete=dir Dotfiles
    \ call fzf#vim#files(
    \   'yadm list -a -- '.shellescape(<q-args>), 1,
    \   fzf#vim#with_preview(), <bang>0)

command! -nargs=? Dotfiles 
      \ call fzf#run(fzf#wrap(
      \     {'source': 'yadm list -a', 'sink': 'e', 'options': '--preview "bat --style=numbers --color=always --line-range :500 --theme=gruvbox {}"'}))
" }}}

" ============================================================================
" Common {{{
" ============================================================================
nnoremap <silent> <c-p> :Files<CR>
nnoremap <silent> <c-f> :Rg<CR>
nnoremap <silent> <c-t> :Vista finder<CR>
nnoremap <silent> <c-b> :Buffers<CR>
nnoremap <silent> <c-n> :NV<CR>

nnoremap <silent> <leader>. :cd ~<CR>:Dotfiles<CR>
let g:which_key_map['.'] = 'search for dotfiles'
let g:which_key_map.H = [ 'Help', 'search for help' ]

nnoremap <silent> <leader>/ :BLines<CR>
let g:which_key_map['/'] = 'fuzzy /'
nnoremap <silent> <leader>? :Lines<CR>
let g:which_key_map['?'] = 'fuzzy / but in all loaded buffers'
" }}}

" ============================================================================
" Uncommon {{{
" ============================================================================
let g:which_key_map.s = {
    \ 'name': '+search',
    \ 'l': ['Locate', 'locate'],
    \ 'C': ['Commits', 'commits'],
    \ 'c': ['BCommits', 'commits for current buffer'],
    \ 'm': ['Maps', 'normal mode mappings'],
    \ 'f': ['Filetypes', 'file types'],
    \ '/': ['Lines', 'lines loaded in buffers'],
    \ 'g': ['GFiles', 'git files'],
    \ 't': ['Tags', 'project tags'],
    \ 'u': ['History', 'file history'],
    \ 's': ['Snippets', 'snippets'],
    \ 'w': ['Windows', 'windows'],
    \ }
" }}}

" ============================================================================
" Coc Lists {{{
" ============================================================================
" Show all diagnostics.
nnoremap <silent> \a  :<C-u>CocList diagnostics<CR>

" " Manage extensions.
nnoremap <silent> \p  :<C-u>CocList extensions<CR>

" Show commands.
nnoremap <silent> \c  :<C-u>CocList commands<CR>

" general coclist
nnoremap <silent> \l :CocList<CR>
" }}}
