"
"                                       ██
"                                      ░░
"    ███████   █████   ██████  ██    ██ ██ ██████████
"   ░░██░░░██ ██░░░██ ██░░░░██░██   ░██░██░░██░░██░░██
"    ░██  ░██░███████░██   ░██░░██ ░██ ░██ ░██ ░██ ░██
"    ░██  ░██░██░░░░ ░██   ░██ ░░████  ░██ ░██ ░██ ░██
"    ███  ░██░░██████░░██████   ░░██   ░██ ███ ░██ ░██
"   ░░░   ░░  ░░░░░░  ░░░░░░     ░░    ░░ ░░░  ░░  ░░

" ----------------------------- Important ----------------------------------
let g:mapleader="\<Space>"
let g:maplocalleader="\\"

if exists('g:vscode')

  set noloadplugins

  " better vscode navigation
  nnoremap <silent> <C-j> :call VSCodeNotify('workbench.action.navigateDown')<CR>
  xnoremap <silent> <C-j> :call VSCodeNotify('workbench.action.navigateDown')<CR>
  nnoremap <silent> <C-k> :call VSCodeNotify('workbench.action.navigateUp')<CR>
  xnoremap <silent> <C-k> :call VSCodeNotify('workbench.action.navigateUp')<CR>
  nnoremap <silent> <C-h> :call VSCodeNotify('workbench.action.navigateLeft')<CR>
  xnoremap <silent> <C-h> :call VSCodeNotify('workbench.action.navigateLeft')<CR>
  nnoremap <silent> <C-l> :call VSCodeNotify('workbench.action.navigateRight')<CR>
  xnoremap <silent> <C-l> :call VSCodeNotify('workbench.action.navigateRight')<CR>

  " vscode commenting
  xmap <silent> <leader>c  <Plug>VSCodeCommentary
  nmap <silent> <leader>c  <Plug>VSCodeCommentary
  omap <silent> <leader>c  <Plug>VSCodeCommentary
  nmap <silent> <leader>cc <Plug>VSCodeCommentaryLine

  nnoremap <leader>w :Write<CR>
  nnoremap <leader>W :Wall<CR>

  nnoremap <leader>x :Wq<CR>
  nnoremap <leader>x :Wqall<CR>

  nnoremap <leader>q :Quit<CR>
  nnoremap <leader>Q :Qall!<CR>

  nnoremap <leader>o :Only<CR>

else

lua require('init')

  let test#strategy = "vimux"

" ----------------------------- General -------------------------------------
  let g:zoom#statustext = ''

" ----------------------------- Tmux ----------------------------------------
" ============================================================================
" Defaults {{{
" ============================================================================
" escaping
inoremap jk <Esc>
cnoremap jk <C-c>

" set leader mappings
let g:which_key_map = {}

tnoremap <C-o> <C-\><C-n>

" delete default commentary mappings
noremap gc <Nop>

" add leader mappings, easier to reach
xmap <Leader>c  <Plug>Commentary
nmap <Leader>c  <Plug>Commentary
omap <Leader>c  <Plug>Commentary
nmap <Leader>cc <Plug>CommentaryLine
nmap <Leader>cu <Plug>Commentary<Plug>Commentary

function! MaximizeToggle()
  if exists("s:maximize_session")
    exec "source " . s:maximize_session
    call delete(s:maximize_session)
    unlet s:maximize_session
    let &hidden=s:maximize_hidden_save
    unlet s:maximize_hidden_save
  else
    let s:maximize_hidden_save = &hidden
    let s:maximize_session = tempname()
    set hidden
    exec "mksession! " . s:maximize_session
    only
  endif
endfunction

let g:neovide_refresh_rate=240
" let g:neovide_cursor_vfx_mode = "pixiedust"
let g:neovide_cursor_vfx_mode = "railgun"
" let g:neovide_cursor_animate_in_insert_mode=0
" let g:neovide_cursor_animation_length=0.1

function! TermWrapperStrategy(cmd)
  call v:lua.require('termwrapper').send_or_toggle(a:cmd)
endfunction

let g:test#custom_strategies = {'termwrapper': function('TermWrapperStrategy')}
let g:test#strategy = 'termwrapper'

" inner entire mapping
vnoremap <silent> ie :<C-U>normal! ggVG<CR>
omap ie <cmd>normal vie<CR>

" }}}
endif
