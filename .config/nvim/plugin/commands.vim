" delete all buffers except current
command! -nargs=0 Bufonly :call Bufonly()

fun! Bufonly()
  %bdelete|edit #|normal `"
  if g:loaded_lightline_bufferline == 1
    exe "normal \<Plug>lightline#bufferline#delete(2)"
  endif
endfun


" Add `:Format` command to format current buffer.
command! -nargs=0 Format lua vim.lsp.buf.formatting_sync()

command! -bang -nargs=? -complete=dir Dotfiles
    \ call fzf#vim#files(
    \   'yadm list -a -- '.shellescape(<q-args>), 1,
    \   fzf#vim#with_preview(), <bang>0)

command! -nargs=? Dotfiles 
      \ call fzf#run(fzf#wrap(
      \     {'source': 'yadm list -a', 'sink': 'e', 'options': '--preview "bat --style=numbers --color=always --line-range :500 --theme=gruvbox {}"'}))
