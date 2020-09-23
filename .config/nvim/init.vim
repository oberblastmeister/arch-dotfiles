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
lua require('plugins')

" lua require('settings').setup()

  let g:fzf_preview_window = 'right'

  let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.5 } }
  let g:fzf_buffers_jump = 1

  let test#strategy = "vimux"

" ----------------------------- General -------------------------------------
  let g:zoom#statustext = ''

  let g:floaterm_width = 0.85
  let g:floaterm_height = 0.85

" ----------------------------- Tmux ----------------------------------------
    let g:VimuxHeight = "20"

" ----------------------------- Notes/Writing -------------------------------
  let g:vim_markdown_no_default_key_mappings = 1
  let g:vim_markdown_conceal = 0
  let g:vim_markdown_conceal_code_blocks = 0
  let g:vim_markdown_auto_insert_bullets = 1
  let g:vim_markdown_math = 1
  let g:vim_markdown_strikethrough = 1

  let g:nv_window_command = 'call fuzzy_finding#centered_floating_window(1)'
  let g:nv_search_paths = ['~/notes']
  let g:nv_keymap = {
                      \ 'ctrl-x': 'split ',
                      \ 'ctrl-v': 'vertical split ',
                        \ 'ctrl-t': 'tabedit ',
                      \ }
  let g:nv_create_note_key = 'ctrl-a'
  " When adding notes don't put it in split
  let g:nv_create_note_window = 'edit'

  let g:vimwiki_list = [{'path': '~/notes/',
        \ 'syntax': 'markdown', 'ext': '.md'}]
let g:vimwiki_map_prefix = '<Leader>n'
let g:vimwiki_global_ext = 0
" }}}

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
" }}}
