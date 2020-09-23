" ============================================================================
" Regular {{{
" ============================================================================
" nnoremap <silent> <leader><space> <C-^>
function! Write()
  write
  edit
  TSBufEnable highlight
endfunction

nnoremap <silent> <leader><leader> <c-^>
nnoremap <silent> <leader>w <cmd>write<CR>
nnoremap <silent> <leader>W :call Write()<CR>
nnoremap <silent> <leader>x :xit<CR>
nnoremap <silent> <leader>o :only<CR>
nnoremap <silent> <leader>q :quit<CR>
nnoremap <silent> <leader>Q :qa!<CR>
nnoremap <silent> <leader>p :put<CR>
nnoremap <LocalLeader>e :edit <C-R>=expand('%:p:h') . '/'<CR>
" }}}

" ============================================================================
" Buffer {{{
" ============================================================================
" go to relative buffer numbers
nmap <Leader>1 <Plug>lightline#bufferline#go(1)
nmap <Leader>2 <Plug>lightline#bufferline#go(2)
nmap <Leader>3 <Plug>lightline#bufferline#go(3)
nmap <Leader>4 <Plug>lightline#bufferline#go(4)
nmap <Leader>5 <Plug>lightline#bufferline#go(5)
nmap <Leader>6 <Plug>lightline#bufferline#go(6)
nmap <Leader>7 <Plug>lightline#bufferline#go(7)
nmap <Leader>8 <Plug>lightline#bufferline#go(8)
nmap <Leader>9 <Plug>lightline#bufferline#go(9)
nmap <Leader>0 <Plug>lightline#bufferline#go(10)

" info
let g:which_key_map = {
      \ '1': 'go to buffer 1',
      \ '2': 'go to buffer 2',
      \ '3': 'go to buffer 3',
      \ '4': 'go to buffer 4',
      \ '5': 'go to buffer 5',
      \ '6': 'go to buffer 6',
      \ '7': 'go to buffer 7',
      \ '8': 'go to buffer 8',
      \ '9': 'go to buffer 9',
      \ '0': 'go to buffer 0',
      \ ' ': 'go to previous buffer',
      \ 'o': 'toggle zoom of split',
      \ 'q': 'quit',
      \ 'Q': 'quit without saving',
      \ 'w': 'write',
      \ 'x': 'exit and save',
      \ 'p': 'put below',
      \ }

" delete relative buffer numbers
nmap <Leader>b1 <Plug>lightline#bufferline#delete(1)
nmap <Leader>b2 <Plug>lightline#bufferline#delete(2)
nmap <Leader>b3 <Plug>lightline#bufferline#delete(3)
nmap <Leader>b4 <Plug>lightline#bufferline#delete(4)
nmap <Leader>b5 <Plug>lightline#bufferline#delete(5)
nmap <Leader>b6 <Plug>lightline#bufferline#delete(6)
nmap <Leader>b7 <Plug>lightline#bufferline#delete(7)
nmap <Leader>b8 <Plug>lightline#bufferline#delete(8)
nmap <Leader>b9 <Plug>lightline#bufferline#delete(9)
nmap <Leader>b0 <Plug>lightline#bufferline#delete(10)

" misc buffer mappings
nnoremap <silent> <leader>bD :Bufonly<CR>
nnoremap <silent> <leader>bd :bd<CR>
nnoremap <silent> <leader>bk :%bdelete<CR>
nnoremap <silent> <leader>bl :ls<CR>

" delete buffer numbers info
let g:which_key_map.b = {
      \ 'name': '+buffer',
      \ '1': 'delete buffer 1',
      \ '2': 'delete buffer 2',
      \ '3': 'delete buffer 3',
      \ '4': 'delete buffer 4',
      \ '5': 'delete buffer 5',
      \ '6': 'delete buffer 6',
      \ '7': 'delete buffer 7',
      \ '8': 'delete buffer 8',
      \ '9': 'delete buffer 9',
      \ '0': 'delete buffer 0',
      \ 'd': 'delete current buffer',
      \ 'D': 'delete ALL buffers EXCEPT current',
      \ 'k': 'kill ALL buffers',
      \ 'l': 'list buffers',
      \ }
" }}}

" ============================================================================
" Misc {{{
" ============================================================================
nnoremap <silent> <leader>zn :call mappings#toggle_numbering()<CR>
nnoremap <silent> <leader>zz :call mappings#zap()<CR>
nnoremap <silent> <leader>zh :so $VIMRUNTIME/syntax/hitest.vim<CR>
nnoremap <silent> <leader>zg :call VimBeGood()<CR>
nnoremap <silent> <leader>zv :Vista!!<CR>
nnoremap <silent> <leader>zd :let g:diagnostic_show_sign = 0<CR>:let g:diagnostic_enable_virtual_text = 0<CR>

let g:which_key_map.z = {
      \ 'name': '+misc',
      \ 'n': 'toggle numbers',
      \ 'z': 'zap whitespace',
      \ 'h': 'show all highlight groups',
      \ 'g': 'vim game',
      \ 'v': 'toggle vista',
      \ }
" }}}

" ============================================================================
" Vimux {{{
" ============================================================================
nnoremap <silent> <Leader>vo :call VimuxOpenRunner()<CR>
nnoremap <silent> <Leader>vp :VimuxPromptCommand<CR>
nnoremap <silent> <Leader>vl :VimuxRunLastCommand<CR>
nnoremap <silent> <Leader>vi :VimuxInspectRunner<CR>
nnoremap <silent> <Leader>vx :VimuxInterruptRunner<CR>
nnoremap <silent> <Leader>vz :call VimuxZoomRunner()<silent> <CR>
nnoremap <silent> <Leader>v<CR> :call VimuxSendKeys("Enter")<CR>
nnoremap <silent> <Leader>vq :VimuxCloseRunner<CR>
nnoremap <silent> <Leader>vc :VimuxClearRunnerHistory<CR>

let g:which_key_map.v = {
      \ 'name': '+vimux',
      \ 'o': 'open runner',
      \ 'p': 'prompt command',
      \ 'l': 'run last prompted command',
      \ 'i': 'inspect (move into runner and enter copy mode)',
      \ 'x': 'interrupt command in runner',
      \ 'z': 'zoom runner',
      \ '<CR>': 'send enter to runner',
      \ 'q': 'close vimux runner',
      \ 'c': 'clear runner history',
      \ }

nnoremap <silent> <Leader>R :call mappings#run_code()<CR>
let g:which_key_map.R = 'run code'

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

command! -nargs=0 LaunchVimspector call vimspector#Launch()

" nnoremap <silent> <leader>D :call vimspector#Launch()<CR>
nnoremap <silent> <leader>D :LaunchVimspector<CR>
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
" nnoremap <leader>v :Vista!!<CR>

" vimwiki
nnoremap <leader>nw <cmd>VimwikiIndex<CR>
