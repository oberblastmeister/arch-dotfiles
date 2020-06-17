" ===================================================================================================================================================
" ================ Regular leader mappings =========================================================================================================
" ===================================================================================================================================================
nnoremap <silent> <Leader><Leader> <C-^>
nnoremap <silent> <Leader>o :call zoom#toggle()<cr>
nnoremap <silent> <Leader>q :quit<CR>
nnoremap <silent> <Leader>Q :VimuxCloseRunner<CR>
nnoremap <Leader>w :write<CR>
nnoremap <silent> <Leader>x :xit<CR>
nnoremap <LocalLeader>e :edit <C-R>=expand('%:p:h') . '/'<CR>
nnoremap <silent> <leader>p :pu<CR>

" cycle through different numberings with  number command
command! -nargs=0 Number :call mappings#cycle_numbering()

" zap trailing whitespace
nnoremap <silent> <Leader>zz :call mappings#zap()<CR>

" ================================================================================================================================================
" ================ Vimux =========================================================================================================================
" ================================================================================================================================================

" Vimux
" Prompt for a command to run
nnoremap <Leader>vp :VimuxPromptCommand<CR>
" Run last command executed by VimuxRunCommand
nnoremap <Leader>vl :VimuxRunLastCommand<CR>

" run code with vimux
nnoremap <silent> <Leader>r :call mappings#run_code()<CR>
nnoremap <silent> <Leader>R :!chromium-browser %<CR><CR>

" Inspect runner pane
nnoremap <Leader>vi :VimuxInspectRunner<CR>

" Interrupt any command running in the runner pane
nnoremap <Leader>vx :VimuxInterruptRunner<CR>

" Zoom the runner pane (use <bind-key> z to restore runner pane)
nnoremap <Leader>vz :call VimuxZoomRunner()<CR>
" If text is selected, save it in the v buffer and send that buffer it to tmux

function! VimuxSlime()
  call VimuxSendKeys("F6")
  call VimuxSendText(@v)
  call VimuxSendKeys("F6")
  " execute "normal! k"
endfunction

function! VimuxSlimeMove()
  call VimuxSendKeys("F6")
  call VimuxSendText(@v)
  call VimuxSendKeys("F6")
  " goes to next non-newline text so chaining this function is easier (only if it is not on the last line)
  if line('.') != line('$')
    call search('^.\+')
    " execute "normal! k"
  endif
endfunction

function! VimuxSlimeParagraph()
  call VimuxSendKeys("F6")
  call VimuxSendText(@v)
  call VimuxSendKeys("F6")
  " make sure enter is pressed after all the text is sent
  sleep 10m
  call VimuxSendKeys("Enter")
  " go to next paragraph so chaining the function is easier (vimux already goes one over so no need for j)
  execute "normal! }"
endfunction

" these must be recursive
vmap <LocalLeader>vs "vy :call VimuxSlime()<CR>
vmap <LocalLeader>vsm "vy :call VimuxSlimeMove()<CR>
vmap <LocalLeader>vsp "vy :call VimuxSlimeParagraph()<CR>
vmap <LocalLeader>vse "vy :call VimuxSlime()<CR>

nmap <C-c><C-c> V<LocalLeader>vs
nmap <Leader>s vip<LocalLeader>vsp<CR>
nmap <Leader>S V<LocalLeader>vsm

nnoremap <Leader>v<CR> :call VimuxSendKeys("Enter")<CR>

" vmap <LocalLeader>vs "vy :call VimuxSlime()<CR>

" Select current paragraph and send it to tmux
" nmap <LocalLeader>vs vip<LocalLeader>vs<CR>


" leader cd mappings
nnoremap <leader>cd :Rooter<CR>
nnoremap <leader>` :cd ~<CR>
nnoremap <leader>c. :cd ..<CR>

" ==============================================================================================================================================
" ================ Git ===========================================================================================================================
" ==============================================================================================================================================
" nnoremap <silent> <leader>gs :Git<cr>
" nnoremap <silent> <leader>gb :Git_blame<cr>
" nnoremap <silent> <leader>gl :Git log<Cr>
" nnoremap <silent> <leader>ga :Git add .<CR>
" nnoremap <silent> <leader>gc :Gcommit<cr>
" nnoremap <silent> <leader>gp :execute ":Git push -u origin " . fugitive#head(0)<CR>


" ==============================================================================================================================================
" ================ Miscelaeneous ===============================================================================================================
" ==============================================================================================================================================
" nnoremap U :UndotreeToggle<CR>

" goyo mapping
nnoremap <silent> <leader>go :Goyo<CR>

" vim test mappings
nmap <silent> <Leader>tn :TestNearest<CR>
nmap <silent> <Leader>tf :TestFile<CR>
nmap <silent> <Leader>ts :TestSuite<CR>
nmap <silent> <Leader>tl :TestLast<CR>
nmap <silent> <Leader>tg :TestVisit<CR>

" window swap mapppings
nnoremap <silent> <leader>sw :call WindowSwap#EasyWindowSwap()<CR>

" toggle fugitive to yadm
" function! Fugitive_toggle()
"   let g:fugitive_toggle = 0
"   if g:fugitive_toggle == 0
"     let g:fugitive_git_executable = 'yadm'
"     let g:fugitive_toggle = 1
"   else
"     let g:fugitive_git_executable = 'git'
"     let g:fugitive_toggle = 0
"   endif
" endfunction

nnoremap <Leader>I :call Fugitive_toggle()<CR>


" =========================================================
" ============================= Vimspector ===============================
" =================================================================

nnoremap <leader>d :call mappings#start_debugger()<Cr>

" ======================================================================
" ============================ Neoterm =====================================
" ===================================================================
nnoremap <leader>nl :<c-u>exec v:count.'Tclear'<cr>
