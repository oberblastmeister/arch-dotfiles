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

" find files (change back to fzf if clap is to slow)
" nnoremap <silent> <C-t> :Clap files<CR>

nnoremap <silent> <c-t> :Files<Cr>

" clap filer (overides default scroll mappings)
" nnoremap <silent> <C-e> :Clap filer<CR>

" grep
nnoremap <silent> <C-f> :Rg<CR>

" find help (also change back to fzf if clap is too slow)
nnoremap <silent> <leader>h :Help<CR>

" most recent (U)sed files
nnoremap <silent> <leader>u :History<cr>

" show colors
nnoremap <silent> \C :Clap colors<CR>

" find dotfiles
" nnoremap <silent> <leader>i :call fuzzy_finding#fuzzy_dotfiles()<CR>
" nnoremap <silent> <leader>i :cd ~<CR>:Clap gfiles<CR>
nnoremap <silent> <leader>i :cd ~<CR>:Dotfiles<CR>

" general coclist
nnoremap <silent> \l :CocList<CR>

" find mappings
nnoremap <silent> \m :Clap maps<CR>

" fuzzy search lines in current buffer
nnoremap <silent> <leader>/ :BLines<CR>

" notational fzf
nnoremap <silent> <C-n> :NV<CR>

" " [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1

command! -bang -nargs=? -complete=dir Dotfiles
    \ call fzf#vim#files(
    \   'yadm list -a -- '.shellescape(<q-args>), 1,
    \   fzf#vim#with_preview(), <bang>0)

command! -nargs=? Dotfiles 
      \ call fzf#run(fzf#wrap(
      \     {'source': 'yadm list -a', 'sink': 'e', 'options': '--preview "bat --style=numbers --color=always --line-range :500 --theme=gruvbox {}"'}))
