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
let g:which_key_map.v = { 'name' : '+vimux' }
nnoremap <Leader>vp :VimuxPromptCommand<CR>
let g:which_key_map.v.p = 'prompt for command'
nnoremap <Leader>vl :VimuxRunLastCommand<CR>
let g:which_key_map.v.l = 'run last prompted command'
nnoremap <Leader>vi :VimuxInspectRunner<CR>
let g:which_key_map.v.i = 'move into runner and enter copy mode (inspect)'
nnoremap <Leader>vx :VimuxInterruptRunner<CR>
let g:which_key_map.v.x = 'interrupt command in runner'
nnoremap <Leader>vz :call VimuxZoomRunner()<CR>
let g:which_key_map.v.z = 'zoom runner'

nnoremap <silent> <Leader>r :call mappings#run_code()<CR>
nnoremap <silent> <Leader>R :!chromium-browser %<CR><CR>

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
" nnoremap <leader>cd :Rooter<CR>
" nnoremap <leader>` :cd ~<CR>
" nnoremap <leader>c. :cd ..<CR>

" ==============================================================================================================================================
" ================ Git ===========================================================================================================================
" ==============================================================================================================================================
let g:which_key_map.g = { 'name' : '+git' }
nnoremap <silent> <leader>gs :G<CR>
let g:which_key_map.g.s = 'git status'
nnoremap <silent> <leader>gb :G blame<CR>
let g:which_key_map.g.b = 'git blame'
nnoremap <silent> <leader>gl :Gclog<CR>
let g:which_key_map.g.l = 'git log'
nnoremap <silent> <leader>ga :G add %:p<CR>
let g:which_key_map.g.a = 'git add current file'
nnoremap <silent> <leader>gc :G commit<CR>
let g:which_key_map.g.c = 'git commit'
nnoremap <silent> <leader>gp :execute ":Git push -u origin " . fugitive#head(0)<CR>
let g:which_key_map.g.p = 'git push current head'
" toggle yadm mapping
" nnoremap <silent> <leader>gy :call mappings#toggle_yadm()<CR>
" nnoremap <silent> <leader>gy :let $GIT_DIR="/home/brian/.config/yadm/repo.git"<CR>

let g:which_key_map.c = { 'name' : '+git chunk' }
nnoremap <silent> <leader>cs :CocCommand git.chunkStage<CR>
let g:which_key_map.c.s = 'stage chunk'
nnoremap <silent> <leader>cu :CocCommand git.chunkUndo<CR>
let g:which_key_map.c.u = 'undo chunk'
nnoremap <silent> <leader>ci :CocCommand git.chunkInfo<CR>
let g:which_key_map.c.i = 'show chunk info'
nnoremap <silent> <leader>cc :CocCommand git.showCommit<CR>
let g:which_key_map.c.c = 'show chunk commit'
" git open
nnoremap <silent> <leader>go :CocCommand git.browserOpen


" ==============================================================================================================================================
" ================ Miscelaeneous ===============================================================================================================
" ==============================================================================================================================================
" nnoremap U :UndotreeToggle<CR>

" goyo mapping
nnoremap <silent> <leader>go :Goyo<CR>

let g:which_key_map.t = { 'name' : '+test' }
nmap <silent> <Leader>tn :TestNearest<CR>
let g:which_key_map.t.n = 'test nearest'
nmap <silent> <Leader>tf :TestFile<CR>
let g:which_key_map.t.f = 'test whole file'
nmap <silent> <Leader>ts :TestSuite<CR>
let g:which_key_map.t.s = 'test entire suite'
nmap <silent> <Leader>tl :TestLast<CR>
let g:which_key_map.t.l = 'test last'
nmap <silent> <Leader>tg :TestVisit<CR>
let g:which_key_map.t.g = 'test visit'

" window swap mapppings
" nnoremap <silent> <leader>sw :call WindowSwap#EasyWindowSwap()<CR>

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

call which_key#register('<Space>', "g:which_key_map")
