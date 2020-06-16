function! VimuxMagicRun()
  write!
  call VimuxRunCommand("ptipython ")
  call VimuxSendText("%run " . expand("%:p"))
  call VimuxSendKeys("Enter")
endfunction


function! Breakpoint()
  execute "normal! obreakpoint()\<esc>k"
endfunction

" nnoremap <leader>R :call VimuxRunCommand("ptipython ")<CR>:SlimeSend0 "exec(open('" . expand('%:p') . "').read())\n"<CR>
" nnoremap <leader>R :call Get_Vars()<CR>
" nnoremap <leader>r :write!<CR>:call VimuxRunCommand("ptipython ")<CR>:SlimeSend0 "exec(open('" . expand('%:p') . "').read())\n"<CR>
nnoremap <buffer> <leader>r :call VimuxMagicRun()<CR>

nnoremap <buffer> <leader>b :call Breakpoint()<CR>

nnoremap <buffer> <leader>sr :call VimuxRunCommand("clear; ptipython ")<CR>

nnoremap <buffer> <leader>D :call mappings#run_code()<CR>
