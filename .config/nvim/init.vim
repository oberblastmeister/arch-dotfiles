"
"                                       ██
"                                      ░░
"    ███████   █████   ██████  ██    ██ ██ ██████████
"   ░░██░░░██ ██░░░██ ██░░░░██░██   ░██░██░░██░░██░░██
"    ░██  ░██░███████░██   ░██░░██ ░██ ░██ ░██ ░██ ░██
"    ░██  ░██░██░░░░ ░██   ░██ ░░████  ░██ ░██ ░██ ░██
"    ███  ░██░░██████░░██████   ░░██   ░██ ███ ░██ ░██
"   ░░░   ░░  ░░░░░░  ░░░░░░     ░░    ░░ ░░░  ░░  ░░


" ============================================================================
" Before {{{
" ============================================================================

" disable python 2 support
let g:loaded_python_provider = 0
" command to start python3 executable
let g:python3_host_prog = '/usr/bin/python3'

function! Cond(cond, ...)
  let opts = get(a:000, 0, {})
  return a:cond ? opts : extend(opts, { 'on': [], 'for': [] })
endfunction
" }}}

" ============================================================================
" Vim-plug {{{
" ============================================================================

call plug#begin(stdpath('data') . '/plugged')

" Plug '~/projects/yadm.nvim'
" ----------------------------- Appearance -----------------------------------
Plug 'hardcoreplayers/dashboard-nvim'
Plug 'itchyny/lightline.vim'
Plug 'mengelbrecht/lightline-bufferline'
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
  autocmd! User CocStatusChange,CocDiagnosticChange call lightline#update()
  let g:lightline#bufferline#show_number=2
  let g:lightline#bufferline#clickable = 1
  let g:lightline#bufferline#modified = ' '
  let g:lightline#bufferline#read_only = ' '
  let g:lightline#bufferline#more_buffers = '…'
  let g:lightline#bufferline#unnamed = '_'

" colors
Plug 'morhetz/gruvbox'
  let g:gruvbox_sign_column='bg0'

Plug 'yggdroot/indentline'
  let g:indentLine_fileTypeExclude = ['dashboard']

Plug 'norcalli/nvim-colorizer.lua'

" Plug 'kyazdani42/nvim-web-devicons' " for file icons
" Plug 'kyazdani42/nvim-tree.lua'
  " let g:lua_tree_auto_close = 1
" Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': ':UpdateRemotePlugins'}

" ----------------------------- Important ----------------------------------
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
  let g:coc_global_extensions = [
  \ 'coc-python',
  \ 'coc-json',
  \ 'coc-sh',
  \ 'coc-rust-analyzer',
  \ 'coc-tsserver',
  \ 'coc-html',
  \ 'coc-snippets',
  \ 'coc-vimlsp',
  \ 'coc-emmet',
  \ 'coc-actions',
  \ 'coc-java',
  \ 'coc-marketplace',
  \ 'coc-git',
  \ 'coc-lua',
  \ 'coc-yaml'
  \ ]

Plug 'tmsvg/pear-tree'
  let g:pear_tree_repeatable_expand = 0
  let g:pear_tree_smart_openers = 1
  let g:pear_tree_smart_closers = 1
  let g:pear_tree_smart_backspace = 1
  let g:pear_tree_timeout = 60
  let g:pear_tree_map_special_keys = 1
  imap <space> <Plug>(PearTreeSpace)

Plug 'liuchengxu/vim-which-key'

Plug 'honza/vim-snippets'

if !has('win32') || !has('win64')
    let g:vimspector_enable_mappings = 'HUMAN'
    let g:vimspector_install_gadgets = [ 'debugpy', 'vscode-cpptools', 'CodeLLDB', 'vscode-bash-debug' ]
  " Plug 'puremourning/vimspector', { 'do': ':VimspectorInstall --all --disable-tcl --force-enable-rust' }
  Plug 'puremourning/vimspector', { 'do': ':VimspectorInstall' }
  " ./install_gadget.py --all --force-enable-rust --disable-tcl --update-gadget-config
endif

" Use fzf for rg
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'antoinemadec/coc-fzf'
Plug 'stsewd/fzf-checkout.vim', { 'on': ['GCheckout', 'GCheckoutTag'] }
  " always show preview in fzf
  let g:fzf_preview_window = 'right'

" Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary' }

  " let g:fzf_layout = { 'window': 'call fuzzy_finding#centered_floating_window(1)' }
  let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
  " [Buffers] Jump to the existing window if possible
  let g:fzf_buffers_jump = 1

Plug 'tpope/vim-dispatch'

Plug 'janko/vim-test', { 'for': ['python', 'rust', 'vim'] }
  let test#strategy = "dispatch"

Plug 'liuchengxu/vista.vim'     " can't lazy load vista
  let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
  let g:vista_fzf_preview = ['right:50%']
  let g:vista_default_executive = 'coc'
  let g:vista_vimwiki_executive = 'markdown'

Plug 'romainl/vim-cool'

Plug 'ThePrimeagen/vim-be-good', {'do': './install.sh', 'on': 'VimBeGood'}

" ----------------------------- Editing -------------------------------------
Plug 'tpope/vim-commentary'

Plug 'machakann/vim-sandwich'

Plug 'tpope/vim-repeat'

Plug 'AndrewRadev/switch.vim'
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

Plug 'AndrewRadev/splitjoin.vim', { 'for': ['python', 'rust', 'vim'] }
Plug 'junegunn/vim-easy-align'

" ----------------------------- General -------------------------------------
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-eunuch'
Plug 'psliwka/vim-smoothie'
Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }

Plug 'dhruvasagar/vim-zoom'
 let g:zoom#statustext = ''

Plug 'sickill/vim-pasta'

Plug 'airblade/vim-rooter'
  let g:rooter_silent_chdir = 1
  let g:rooter_change_directory_for_non_project_files = 'current'

" Plug 'wesQ3/vim-windowswap'
"   let g:windowswap_map_keys = 0

Plug 'lambdalisue/suda.vim'

" Plug 'ptzz/lf.vim'
"   let g:lf_map_keys = 0
"   let g:lf_replace_netrw = 1

Plug 'voldikss/vim-floaterm', Cond(has('nvim'))
  let g:floaterm_width = 0.85
  let g:floaterm_height = 0.85
  " let g:floaterm_borderchars = ['═', '║', '═', '║', '╔', '╗', '╝', '╚']
  " let g:floaterm_position = 'auto'

Plug 'metakirby5/codi.vim', { 'on': 'Codi' }

" ----------------------------- Text Objects --------------------------------
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-entire'
Plug 'wellle/targets.vim'

" ----------------------------- Git -----------------------------------------
Plug 'tpope/vim-fugitive'

" ----------------------------- Tmux ----------------------------------------
Plug 'christoomey/vim-tmux-navigator', Cond($TMUX != '')
Plug 'benmills/vimux', Cond($TMUX != '')
    let g:VimuxHeight = "20"

" ----------------------------- Notes/Writing -------------------------------
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
  let g:vim_markdown_no_default_key_mappings = 1
  let g:vim_markdown_conceal = 0
  let g:vim_markdown_conceal_code_blocks = 0
  let g:vim_markdown_auto_insert_bullets = 1
  let g:vim_markdown_math = 1
  let g:vim_markdown_strikethrough = 1

Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

Plug 'junegunn/goyo.vim', { 'on': 'Goyo' }
Plug 'junegunn/limelight.vim', { 'on': 'Goyo' }

Plug 'alok/notational-fzf-vim', { 'on': 'NV' }
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

Plug 'vimwiki/vimwiki'
  let g:vimwiki_list = [{'path': '~/notes/',
        \ 'syntax': 'markdown', 'ext': '.md'}]
let g:vimwiki_map_prefix = '<Leader>n'
let g:vimwiki_global_ext = 0

" ----------------------------- Web Developement ---------------------------
Plug 'mattn/emmet-vim', { 'for': ['html', 'css', 'javascript'] }
Plug 'alvan/vim-closetag', { 'for': 'html' }
Plug 'turbio/bracey.vim', { 'do': 'npm install --prefix server', 'for': ['html', 'css', 'javascript'] }

" ----------------------------- Language Specific --------------------------
  let g:polyglot_disabled = ['markdown', 'latex', 'pest']
Plug 'sheerun/vim-polyglot'
  let g:python_highlight_space_errors = 0

Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
Plug 'lervag/vimtex', { 'for': ['plaintex', 'latex'] }
Plug 'pest-parser/pest.vim', { 'for': ['pest'] }

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
let mapleader="\<Space>"
let maplocalleader="\\"

" whichkey leader mappings
nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :<c-u>WhichKeyVisual '<Space>'<CR>

" whichkey localleader mappings
nnoremap <silent> <localleader> :<c-u>WhichKey  '\'<CR>
vnoremap <localleader> :<c-u>WhichKeyVisual  ','<CR>

" set global whichkey dict
let g:which_key_map = {}

call which_key#register('<Space>', "g:which_key_map")

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
