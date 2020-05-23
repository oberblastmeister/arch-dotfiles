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
nnoremap <leader>r :call VimuxMagicRun()<CR>

nnoremap <leader>b :call Breakpoint()<CR>

nnoremap <leader>sr :call VimuxRunCommand("clear; ptipython ")<CR>

nnoremap <leader>D :call mappings#run_code()<CR>

" ale mapping (cannot use noremap)
nmap <silent> [g <Plug>(ale_previous_wrap)
nmap <silent> ]g <Plug>(ale_next_wrap)
