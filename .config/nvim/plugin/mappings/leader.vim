" ============================================================================
" Regular {{{
" ============================================================================
let g:which_key_map[' '] = [ '<C-^>', 'go to previous buffer' ]
let g:which_key_map.o = [ 'zoom#toggle()', 'toggle zoom of split' ]
let g:which_key_map.q = [ 'q', 'quit' ]
let g:which_key_map.Q = [ 'qa!', 'quit without saving' ]
let g:which_key_map.w = [ 'w', 'write' ]
let g:which_key_map.x = [ 'x', 'xit' ]
let g:which_key_map.p = [ 'pu', 'put below' ]
nnoremap <LocalLeader>e :edit <C-R>=expand('%:p:h') . '/'<CR>
" }}}

" ============================================================================
" Misc {{{
" ============================================================================
let g:which_key_map.z = {
      \ 'name': '+misc',
      \ 'n' : ['mappings#toggle_numbering', 'toggle numbers'],
      \ 'z' : ['mappings#zap', 'zap whitespace'],
      \ 'h' : [':so $VIMRUNTIME/syntax/hitest.vim', 'show all highlight groups']
      \ }
" }}}

" ============================================================================
" Vimux {{{
" ============================================================================
let g:which_key_map.v = { 'name' : '+vimux' }

nnoremap <Leader>vp :VimuxPromptCommand<CR>
let g:which_key_map.v.p = 'prompt command'

nnoremap <Leader>vl :VimuxRunLastCommand<CR>
let g:which_key_map.v.l = 'run last prompted command'

nnoremap <Leader>vi :VimuxInspectRunner<CR>
let g:which_key_map.v.i = 'inspect (move into runner and enter copy mode)'

nnoremap <Leader>vx :VimuxInterruptRunner<CR>
let g:which_key_map.v.x = 'interrupt command in runner'

nnoremap <Leader>vz :call VimuxZoomRunner()<CR>
let g:which_key_map.v.z = 'zoom runner'

nnoremap <Leader>v<CR> :call VimuxSendKeys("Enter")<CR>
let g:which_key_map.v['<CR>'] = 'send enter to runner'

nnoremap <silent> <Leader>vq :VimuxCloseRunner<CR>
let g:which_key_map.v.q = 'close vimux runner'

nnoremap <silent> <Leader>R :call mappings#run_code()<CR>

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
" vmap <LocalLeader>vs "vy :call VimuxSlime()<CR>
" vmap <LocalLeader>vsm "vy :call VimuxSlimeMove()<CR>
" vmap <LocalLeader>vsp "vy :call VimuxSlimeParagraph()<CR>
" vmap <LocalLeader>vse "vy :call VimuxSlime()<CR>

" nmap <C-c><C-c> V<LocalLeader>vs
" nmap <Leader>s vip<LocalLeader>vsp<CR>
" nmap <Leader>S V<LocalLeader>vsm

" vmap <LocalLeader>vs "vy :call VimuxSlime()<CR>

" Select current paragraph and send it to tmux
" nmap <LocalLeader>vs vip<LocalLeader>vs<CR>


" leader cd mappings
" nnoremap <leader>cd :Rooter<CR>
" nnoremap <leader>` :cd ~<CR>
" nnoremap <leader>c. :cd ..<CR>
" }}}

" ============================================================================
" Git {{{
" ============================================================================
let g:which_key_map.g = { 'name' : '+git' }
nnoremap <silent> <leader>gs :G<CR>
let g:which_key_map.g.s = 'status'
nnoremap <silent> <leader>gb :G blame<CR>
let g:which_key_map.g.b = 'blame'
nnoremap <silent> <leader>gl :G log<CR>
let g:which_key_map.g.l = 'log'
nnoremap <silent> <leader>ga :G add %:p<CR>
let g:which_key_map.g.a = 'add current file'
nnoremap <silent> <leader>gc :G commit<CR>
let g:which_key_map.g.c = 'commit'
nnoremap <silent> <leader>gp :execute ":Git push -u origin " . fugitive#head(0)<CR>
let g:which_key_map.g.p = 'push current head'
" toggle yadm mapping
" nnoremap <silent> <leader>gy :call mappings#toggle_yadm()<CR>
" nnoremap <silent> <leader>gy :let $GIT_DIR="/home/brian/.config/yadm/repo.git"<CR>

let g:which_key_map.c = { 'name' : '+chunk' }
nnoremap <silent> <leader>cs :CocCommand git.chunkStage<CR>
let g:which_key_map.c.s = 'stage'
nnoremap <silent> <leader>cu :CocCommand git.chunkUndo<CR>
let g:which_key_map.c.u = 'undo'
nnoremap <silent> <leader>ci :CocCommand git.chunkInfo<CR>
let g:which_key_map.c.i = 'show info'
nnoremap <silent> <leader>cc :CocCommand git.showCommit<CR>
let g:which_key_map.c.c = 'show commit'
nnoremap <silent> <leader>co :CocCommand git.browserOpen
let g:which_key_map.c.o = 'open in browser'
" }}}

" ============================================================================
" Test {{{
" ============================================================================
let g:which_key_map.t = { 'name' : '+test' }
nmap <silent> <Leader>tn :TestNearest<CR>
let g:which_key_map.t.n = 'nearest'
nmap <silent> <Leader>tf :TestFile<CR>
let g:which_key_map.t.f = 'file'
nmap <silent> <Leader>ts :TestSuite<CR>
let g:which_key_map.t.s = 'suite'
nmap <silent> <Leader>tl :TestLast<CR>
let g:which_key_map.t.l = 'last test'
nmap <silent> <Leader>tg :TestVisit<CR>
let g:which_key_map.t.v = 'visit file that was previously tested'

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
" }}}

" ============================================================================
" Vimspector {{{
" ============================================================================
nnoremap <leader>d :call mappings#start_debugger()<Cr>

" ignore <F9> mapping for whichkey, has to do with vimspector
let g:which_key_map['<F9>'] = 'which_key_ignore'
" }}}
