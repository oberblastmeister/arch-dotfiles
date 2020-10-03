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

Plug 'airblade/vim-rooter'
  let g:rooter_silent_chdir = 1
  let g:rooter_change_directory_for_non_project_files = 'current'
  let g:rooter_patterns = ['*.toml']

" Plug 'wesQ3/vim-windowswap'
"   let g:windowswap_map_keys = 0

Plug 'voldikss/vim-floaterm', Cond(has('nvim'))
  let g:floaterm_width = 0.85
  let g:floaterm_height = 0.85

Plug 'metakirby5/codi.vim', { 'on': 'Codi' }

" ----------------------------- Text Objects --------------------------------
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-entire'
Plug 'glts/vim-textobj-comment'
Plug 'wellle/targets.vim'

" ----------------------------- Git -----------------------------------------
Plug 'tpope/vim-fugitive'

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

" ----------------------------- Web Developement ---------------------------
Plug 'mattn/emmet-vim', { 'for': ['html', 'css', 'javascript'] }
Plug 'alvan/vim-closetag', { 'for': 'html' }
Plug 'turbio/bracey.vim', { 'do': 'npm install --prefix server', 'for': ['html', 'css', 'javascript'] }

" ----------------------------- Language Specific --------------------------
  let g:polyglot_disabled = ['markdown', 'latex', 'pest', 'zsh']
Plug 'sheerun/vim-polyglot'
  let g:python_highlight_space_errors = 0

Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
Plug 'lervag/vimtex', { 'for': ['plaintex', 'latex'] }
Plug 'pest-parser/pest.vim', { 'for': 'pest' }
Plug 'chrisbra/vim-zsh', { 'for': 'zsh' }

" considering
"Plug 'junegunn/vim-after-object'
"Plug 'airblade/vim-gitgutter'
"Plug 'terryma/vim-expand-region'
"Plug 'junegunn/vim-journal'
"Plug 'junegunn/heytmux' (like tmuxinator)
"olors
"Plug 'rakr/vim-one'
"Plug 'dracula/vim', { 'as': 'dracula' }
"Plug 'arcticicestudio/nord-vim'
"Plug 'sjl/badwolf'
"Plug 'turbio/bracey.vim'
"Plug 'TaDaa/vimade'
"Plug 'tmux-plugins/vim-tmux-focus-events'
" status bar
" Plug 'brooth/far.vim'

call plug#end()

" ============================================================================
" Sandwhich {{{
" ============================================================================
runtime macros/sandwich/keymap/surround.vim

" copy the default recipes
let g:sandwich#recipes = deepcopy(g:sandwich#default_recipes)

" auto-indent after surrounding with brackets
let g:sandwich#recipes += [
      \   {
      \     'buns'        : ['{', '}'],
      \     'motionwise'  : ['line'],
      \     'kind'        : ['add'],
      \     'linewise'    : 1,
      \     'command'     : ["'[+1,']-1normal! >>"],
      \   },
      \   {
      \     'buns'        : ['{', '}'],
      \     'motionwise'  : ['line'],
      \     'kind'        : ['delete'],
      \     'linewise'    : 1,
      \     'command'     : ["'[,']normal! <<"],
      \   },
      \   {
      \     'buns'        : ['(', ')'],
      \     'motionwise'  : ['line'],
      \     'kind'        : ['add'],
      \     'linewise'    : 1,
      \     'command'     : ["'[+1,']-1normal! >>"],
      \   },
      \   {
      \     'buns'        : ['(', ')'],
      \     'motionwise'  : ['line'],
      \     'kind'        : ['delete'],
      \     'linewise'    : 1,
      \     'command'     : ["'[,']normal! <<"],
      \   },
      \   {
      \     'buns'        : ['[', ']'],
      \     'motionwise'  : ['line'],
      \     'kind'        : ['add'],
      \     'linewise'    : 1,
      \     'command'     : ["'[+1,']-1normal! >>"],
      \   },
      \   {
      \     'buns'        : ['[', ']'],
      \     'motionwise'  : ['line'],
      \     'kind'        : ['delete'],
      \     'linewise'    : 1,
      \     'command'     : ["'[,']normal! <<"],
      \   }
      \ ]

" allow bracket with spaces (like vim-surround), only works for char and block
let g:sandwich#recipes += [
      \   {'buns': ['{ ', ' }'], 'nesting': 1, 'match_syntax': 1, 'motionwise': ['char', 'block'], 'kind': ['add', 'replace'], 'action': ['add'], 'input': ['}']},
      \   {'buns': ['[ ', ' ]'], 'nesting': 1, 'match_syntax': 1, 'motionwise': ['char', 'block'], 'kind': ['add', 'replace'], 'action': ['add'], 'input': [']']},
      \   {'buns': ['( ', ' )'], 'nesting': 1, 'match_syntax': 1, 'motionwise': ['char', 'block'], 'kind': ['add', 'replace'], 'action': ['add'], 'input': [')']},
      \   {'buns': ['{\s*', '\s*}'],   'nesting': 1, 'regex': 1, 'match_syntax': 1, 'motionwise': ['char', 'block'], 'kind': ['delete', 'replace', 'textobj'], 'action': ['delete'], 'input': ['{']},
      \   {'buns': ['\[\s*', '\s*\]'], 'nesting': 1, 'regex': 1, 'match_syntax': 1, 'motionwise': ['char', 'block'], 'kind': ['delete', 'replace', 'textobj'], 'action': ['delete'], 'input': ['[']},
      \   {'buns': ['(\s*', '\s*)'],   'nesting': 1, 'regex': 1, 'match_syntax': 1, 'motionwise': ['char', 'block'], 'kind': ['delete', 'replace', 'textobj'], 'action': ['delete'], 'input': ['(']},
      \ ]

" allow magic function to use insert mode completion
let g:sandwich#recipes += [
  \   {
  \     'buns': ['(', ')'],
  \     'cursor': 'head',
  \     'command': ['startinsert'],
  \     'kind': ['add', 'replace'],
  \     'action': ['add'],
  \     'input': ['F']
  \   },
  \ ]
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

let g:neovide_refresh_rate=240
" let g:neovide_cursor_vfx_mode = "pixiedust"
let g:neovide_cursor_vfx_mode = "railgun"
" let g:neovide_cursor_animation_length=0.1
" }}}
