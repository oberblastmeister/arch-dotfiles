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
if exists('g:vscode')

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
let g:mapleader="\<Space>"
let g:maplocalleader="\\"

let g:which_key_map = {}

if has('nvim')
  tnoremap <C-o> <C-\><C-n>
endif

" delete default commentary mappings
noremap gc <Nop>

" add leader mappings, easier to reach
xmap <Leader>c  <Plug>Commentary
nmap <Leader>c  <Plug>Commentary
omap <Leader>c  <Plug>Commentary
nmap <Leader>cc <Plug>CommentaryLine
nmap <Leader>cu <Plug>Commentary<Plug>Commentary

let g:neovide_refresh_rate=240
" let g:neovide_cursor_vfx_mode = "pixiedust"
let g:neovide_cursor_vfx_mode = "railgun"
let g:neovide_cursor_animate_in_insert_mode=0
" let g:neovide_cursor_animation_length=0.1
" }}}
endif
