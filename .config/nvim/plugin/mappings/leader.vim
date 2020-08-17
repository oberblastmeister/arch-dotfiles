" ============================================================================
" Regular {{{
" ============================================================================
let g:which_key_map[' '] = [ '<C-^>', 'go to previous buffer' ]
let g:which_key_map.o = [ 'zoom#toggle()', 'toggle zoom of split' ]
let g:which_key_map.q = [ 'q', 'quit' ]
nnoremap <leader>Q :q!<CR>
let g:which_key_map.Q = 'quit without saving' 
let g:which_key_map.w = [ 'w', 'write' ]
let g:which_key_map.x = [ 'x', 'exit and save' ]
let g:which_key_map.p = [ 'pu', 'put below' ]
nnoremap <LocalLeader>e :edit <C-R>=expand('%:p:h') . '/'<CR>
" }}}

" ============================================================================
" Buffer {{{
" ============================================================================
let g:which_key_map.b = {
      \ 'name': '+buffer',
      \ 'd' :  ['bdelete', 'delete buffer'],
      \ 'D' :  ['%bd|e#', 'delete all buffers except current buffer'],
      \ 'k' :  ['bufdo bd', 'kill all buffers'],
      \ 'l' :  ['ls', 'list buffers'],
      \ '1' :  [':b 1', 'buffer 1']        ,
      \ '2' :  [':b 2', 'buffer 2']        ,
      \ '3' :  [':b 3', 'buffer 3']        ,
      \ '4' :  [':b 4', 'buffer 4']        ,
      \ '5' :  [':b 5', 'buffer 5']        ,
      \ '6' :  [':b 6', 'buffer 6']        ,
      \ '7' :  [':b 7', 'buffer 7']        ,
      \ '8' :  [':b 8', 'buffer 8']        ,
      \ '9' :  [':b 9', 'buffer 9']        ,
      \ }
" }}}

" ============================================================================
" Misc {{{
" ============================================================================
let g:which_key_map.z = {
      \ 'name': '+misc',
      \ 'n' : ['mappings#toggle_numbering()', 'toggle numbers'],
      \ 'z' : ['mappings#zap()', 'zap whitespace'],
      \ 'h' : [':so $VIMRUNTIME/syntax/hitest.vim', 'show all highlight groups'],
      \ 'g' : ['VimBeGood', 'vim game']
      \ }
" }}}

" ============================================================================
" Vimux {{{
" ============================================================================
let g:which_key_map.v = { 'name' : '+vimux' }

nnoremap <silent> <Leader>vo :call VimuxOpenRunner()<CR>
let g:which_key_map.v.o = 'open runner'

nnoremap <silent> <Leader>vp :VimuxPromptCommand<CR>
let g:which_key_map.v.p = 'prompt command'

nnoremap <silent> <Leader>vl :VimuxRunLastCommand<CR>
let g:which_key_map.v.l = 'run last prompted command'

nnoremap <silent> <Leader>vi :VimuxInspectRunner<CR>
let g:which_key_map.v.i = 'inspect (move into runner and enter copy mode)'

nnoremap <silent> <Leader>vx :VimuxInterruptRunner<CR>
let g:which_key_map.v.x = 'interrupt command in runner'

nnoremap <silent> <Leader>vz :call VimuxZoomRunner()<silent> <CR>
let g:which_key_map.v.z = 'zoom runner'

nnoremap <silent> <Leader>v<CR> :call VimuxSendKeys("Enter")<CR>
let g:which_key_map.v['<CR>'] = 'send enter to runner'

nnoremap <silent> <Leader>vq :VimuxCloseRunner<CR>
let g:which_key_map.v.q = 'close vimux runner'

nnoremap <silent> <Leader>R :call mappings#run_code()<CR>
let g:which_key_map.R = 'run code'

nnoremap <silent> <Leader>vc :VimuxClearRunnerHistory<CR>
let g:which_key_map.v.c = 'clear runner history'

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

let g:which_key_map.h = { 'name' : '+hunk' }

nnoremap <silent> <leader>ha :CocCommand git.chunkStage<CR>
let g:which_key_map.h.a = 'add (stage)'

nnoremap <silent> <leader>hu :CocCommand git.chunkUndo<CR>
let g:which_key_map.h.u = 'undo'

nnoremap <silent> <leader>hi :CocCommand git.chunkInfo<CR>
let g:which_key_map.h.i = 'show info'

nnoremap <silent> <leader>hc :CocCommand git.showCommit<CR>
let g:which_key_map.h.c = 'show commit'

nnoremap <silent> <leader>ho :CocCommand git.browserOpen
let g:which_key_map.h.o = 'open in browser'
" }}}

" ============================================================================
" Quickfix {{{
" ============================================================================
let g:which_key_map.c = { 'name' : '+quickfix' }

nnoremap <silent> <leader>cO :Copen<CR>
let g:which_key_map.c.O = 'open previous build'

nnoremap <silent> <leader>co :copen<CR>
let g:which_key_map.c.o = 'open'

nnoremap <silent> <leader>cw :cw<CR>
let g:which_key_map.c.w = 'open if there are errors'

nnoremap <silent> <leader>cq :ccl<CR>
let g:which_key_map.c.q = 'close'

nnoremap <silent> <leader>cf :cnf<CR>
let g:which_key_map.c.f = 'next file'


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
nmap <silent> <Leader>tv :TestVisit<CR>
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
let g:which_key_map.d = { 'name' : '+debugger' }

nnoremap <silent> <leader>D :call vimspector#Launch()<CR>
let g:which_key_map.D = 'start debugger'
nnoremap <silent> <leader>dc :call mappings#configure_debugger()<CR>
let g:which_key_map.d.c = 'configure debugger'
nnoremap <silent> <leader>dq :VimspectorReset<CR>
let g:which_key_map.d.q = 'quit'
nnoremap <silent> <leader>dr :call vimspector#Restart()<CR>
let g:which_key_map.d.r = 'restart'
nnoremap <leader>de :VimspectorEval<space>
let g:which_key_map.d.e = 'evaluate expression'
nnoremap <leader>dw :VimspectorWatch<space>
let g:which_key_map.d.w = 'watch variable'

" ignore <F9> mapping for whichkey, has to do with vimspector
let g:which_key_map['<F9>'] = 'which_key_ignore'
" }}}

nnoremap <Leader>s :let @s='\<'.expand('<cword>').'\>'<CR>:%s/<C-r>s//<Left>
xnoremap <Leader>s "sy:%s/<C-r>s//<Left>
let g:which_key_map.s = 'substitue word under cursor'

" vista
nnoremap <leader>v :Vista!!<CR>
