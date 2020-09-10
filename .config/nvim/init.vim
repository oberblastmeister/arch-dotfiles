"
"                                       ██
"                                      ░░
"    ███████   █████   ██████  ██    ██ ██ ██████████
"   ░░██░░░██ ██░░░██ ██░░░░██░██   ░██░██░░██░░██░░██
"    ░██  ░██░███████░██   ░██░░██ ░██ ░██ ░██ ░██ ░██
"    ░██  ░██░██░░░░ ░██   ░██ ░░████  ░██ ░██ ░██ ░██
"    ███  ░██░░██████░░██████   ░░██   ░██ ███ ░██ ░██
"   ░░░   ░░  ░░░░░░  ░░░░░░     ░░    ░░ ░░░  ░░  ░░

lua require('plugins')
" packadd packer.nvim
" lua require('packer').startup()

" ============================================================================
" Before {{{
" ============================================================================

" disable python 2 support
let g:loaded_python_provider = 0
" command to start python3 executable
let g:python3_host_prog = '/usr/bin/python3'

" }}}

" ============================================================================
" Vim-plug {{{
  let g:lightline = {
    \ 'colorscheme': 'gruvbox',
    \ 'active': {
    \   'left': [ [ 'mode', 'paste', 'zoom'],
    \             ['cocstatus',  'fugitive'] ],
    \   'right':   [ [ 'percent' ] ]
    \ },
    \ 'tabline': {
    \   'left': [ ['buffers'] ],
    \   'right': [ [] ]
    \ },
    \ 'component': {
    \   'lineinfo': ' %3l:%-2v',
    \ },
    \ 'component_expand': {
    \   'buffers': 'lightline#bufferline#buffers'
    \ },
    \ 'component_type': {
    \   'buffers': 'tabsel',
    \   'readonly': 'error',
    \   'linter_warnings': 'warning',
    \   'linter_errors': 'error'
    \ },
    \ 'component_function': {
    \   'readonly': 'helpers#lightline#read_only',
    \   'fugitive': 'helpers#lightline#fugitive',
    \   'cocstatus': 'coc#status',
    \   'currentfunction': 'CocCurrentFunction',
    \   'zoom': 'zoom#statusline'
    \ },
    \ 'component_raw': {
    \   'buffers': 1
    \ }
  \ }
  let g:lightline#bufferline#show_number=2
  let g:lightline#bufferline#clickable = 1
  let g:lightline#bufferline#modified = ' '
  let g:lightline#bufferline#read_only = ' '
  let g:lightline#bufferline#more_buffers = '…'
  let g:lightline#bufferline#unnamed = '_'

" colors
  let g:gruvbox_sign_column='bg0'

  let g:indentLine_fileTypeExclude = ['dashboard']

" ----------------------------- Important ----------------------------------
  let g:completion_enable_snippet = 'Ultisnips'
  let g:completion_enable_auto_paren = 1

  let g:diagnostic_insert_delay = 1
  let g:diagnostic_show_sign = 1
  let g:diagnostic_enable_virtual_text = 1

  let g:fzf_preview_window = 'right'

  let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.5 } }
  let g:fzf_buffers_jump = 1

  let test#strategy = "vimux"

  let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
  let g:vista_fzf_preview = ['right:50%']
  let g:vista_default_executive = 'nvim_lsp'
  let g:vista_vimwiki_executive = 'markdown'

" ----------------------------- Editing -------------------------------------
  let g:switch_custom_definitions =
      \ [
      \   ['foo', 'bar', 'baz'],
      \   ['0', '1'],
      \   ['==', '!='],
      \   ['&', '|'],
      \   ['&&', '||'],
      \   ['and', 'or'],
      \   ['on', 'off'],
      \   ['yes', 'no'],
      \   ['vim', 'emacs']
      \ ]

" ----------------------------- General -------------------------------------
 let g:zoom#statustext = ''
  let g:rooter_silent_chdir = 1
  let g:rooter_change_directory_for_non_project_files = 'current'

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

" ============================================================================
" Sandwhich {{{
" ============================================================================
runtime macros/sandwich/keymap/surround.vim

" " copy the default recipes
" let g:sandwich#recipes = deepcopy(g:sandwich#default_recipes)

" " auto-indent after surrounding with brackets
" let g:sandwich#recipes += [
"       \   {
"       \     'buns'        : ['{', '}'],
"       \     'motionwise'  : ['line'],
"       \     'kind'        : ['add'],
"       \     'linewise'    : 1,
"       \     'command'     : ["'[+1,']-1normal! >>"],
"       \   },
"       \   {
"       \     'buns'        : ['{', '}'],
"       \     'motionwise'  : ['line'],
"       \     'kind'        : ['delete'],
"       \     'linewise'    : 1,
"       \     'command'     : ["'[,']normal! <<"],
"       \   },
"       \   {
"       \     'buns'        : ['(', ')'],
"       \     'motionwise'  : ['line'],
"       \     'kind'        : ['add'],
"       \     'linewise'    : 1,
"       \     'command'     : ["'[+1,']-1normal! >>"],
"       \   },
"       \   {
"       \     'buns'        : ['(', ')'],
"       \     'motionwise'  : ['line'],
"       \     'kind'        : ['delete'],
"       \     'linewise'    : 1,
"       \     'command'     : ["'[,']normal! <<"],
"       \   },
"       \   {
"       \     'buns'        : ['[', ']'],
"       \     'motionwise'  : ['line'],
"       \     'kind'        : ['add'],
"       \     'linewise'    : 1,
"       \     'command'     : ["'[+1,']-1normal! >>"],
"       \   },
"       \   {
"       \     'buns'        : ['[', ']'],
"       \     'motionwise'  : ['line'],
"       \     'kind'        : ['delete'],
"       \     'linewise'    : 1,
"       \     'command'     : ["'[,']normal! <<"],
"       \   }
"       \ ]

" " allow bracket with spaces (like vim-surround), only works for char and block
" let g:sandwich#recipes += [
"       \   {'buns': ['{ ', ' }'], 'nesting': 1, 'match_syntax': 1, 'motionwise': ['char', 'block'], 'kind': ['add', 'replace'], 'action': ['add'], 'input': ['}']},
"       \   {'buns': ['[ ', ' ]'], 'nesting': 1, 'match_syntax': 1, 'motionwise': ['char', 'block'], 'kind': ['add', 'replace'], 'action': ['add'], 'input': [']']},
"       \   {'buns': ['( ', ' )'], 'nesting': 1, 'match_syntax': 1, 'motionwise': ['char', 'block'], 'kind': ['add', 'replace'], 'action': ['add'], 'input': [')']},
"       \   {'buns': ['{\s*', '\s*}'],   'nesting': 1, 'regex': 1, 'match_syntax': 1, 'motionwise': ['char', 'block'], 'kind': ['delete', 'replace', 'textobj'], 'action': ['delete'], 'input': ['{']},
"       \   {'buns': ['\[\s*', '\s*\]'], 'nesting': 1, 'regex': 1, 'match_syntax': 1, 'motionwise': ['char', 'block'], 'kind': ['delete', 'replace', 'textobj'], 'action': ['delete'], 'input': ['[']},
"       \   {'buns': ['(\s*', '\s*)'],   'nesting': 1, 'regex': 1, 'match_syntax': 1, 'motionwise': ['char', 'block'], 'kind': ['delete', 'replace', 'textobj'], 'action': ['delete'], 'input': ['(']},
"       \ ]

" " allow magic function to use insert mode completion
" let g:sandwich#recipes += [
"   \   {
"   \     'buns': ['(', ')'],
"   \     'cursor': 'head',
"   \     'command': ['startinsert'],
"   \     'kind': ['add', 'replace'],
"   \     'action': ['add'],
"   \     'input': ['F']
"   \   },
"   \ ]
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

" whichkey leader mappings
" call which_key#register('<Space>', "g:which_key_map")
nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :<c-u>WhichKeyVisual '<Space>'<CR>

" whichkey localleader mappings
nnoremap <silent> <localleader> :<c-u>WhichKey  '\'<CR>
vnoremap <silent> <localleader> :<c-u>WhichKeyVisual  '\'<CR>

" set global whichkey dict
let g:which_key_map = {}
" let g:which_key_fallback_to_native_key=1
let g:which_key_map['name'] = 'root'

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

let g:completion_chain_complete_list = [
    \{'complete_items': ['lsp', 'snippet']},
    \{'complete_items': ['path']},
    \{'complete_items': ['buffers']},
    \]

let g:completion_auto_change_source = 1
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
let g:diagnostic_virtual_text_prefix = ' '
let g:completion_confirm_key = "\<C-y>"

call sign_define("LspDiagnosticsErrorSign", {"text" : "✘", "texthl" : "LspDiagnosticsError"})
call sign_define("LspDiagnosticsWarningSign", {"text" : "🛆", "texthl" : "LspDiagnosticsWarning"})
call sign_define("LspDiagnosticsInformationSign", {"text" : "●", "texthl" : "LspDiagnosticsInformation"})
call sign_define("LspDiagnosticsHintSign", {"text" : "○", "texthl" : "LspDiagnosticsHint"})
