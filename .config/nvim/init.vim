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
function! Cond(cond, ...)
  let opts = get(a:000, 0, {})
  return a:cond ? opts : extend(opts, { 'on': [], 'for': [] })
endfunction
" }}}

" ============================================================================
" Vim-plug {{{
" ============================================================================

call plug#begin(stdpath('data') . '/plugged')

" ----------------------------- Appearance -----------------------------------
Plug 'itchyny/lightline.vim'
  let g:lightline = {
    \ 'colorscheme': 'gruvbox',
    \ 'active': {
    \   'left': [ [ 'mode', 'paste', 'zoom'],
    \             ['cocstatus',  'fugitive', 'readonly', 'filename', 'modified'] ],
    \   'right':   [ [ 'percent' ] ]
    \ },
    \ 'component': {
    \   'lineinfo': ' %3l:%-2v',
    \ },
    \ 'component_type': {
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
    \ }
  autocmd! User CocStatusChange,CocDiagnosticChange call lightline#update()

" colors
Plug 'morhetz/gruvbox'
  let g:gruvbox_sign_column='bg0'
Plug 'rakr/vim-one'
Plug 'arzg/vim-colors-xcode'
Plug 'arcticicestudio/nord-vim'

Plug 'yggdroot/indentline'
Plug 'norcalli/nvim-colorizer.lua'

" ----------------------------- Important ----------------------------------
Plug 'neoclide/coc.nvim', {'branch': 'release'}
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
  \ 'coc-explorer',
  \ 'coc-yaml'
  \ ]

Plug 'jiangmiao/auto-pairs'

Plug 'liuchengxu/vim-which-key'

Plug 'honza/vim-snippets'

if !has('win32') || !has('win64')
    let g:vimspector_enable_mappings = 'HUMAN'
  Plug 'puremourning/vimspector', { 'do': './install_gadget.py --all --force-enable-rust --disable-tcl --update-gadget-config' }
endif

" Use fzf for rg
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'antoinemadec/coc-fzf'
  " always show preview in fzf
  let g:fzf_preview_window = 'right'

" Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary' }

  let g:fzf_layout = { 'window': 'call fuzzy_finding#centered_floating_window(1)' }
  " " [Buffers] Jump to the existing window if possible
  let g:fzf_buffers_jump = 1
Plug 'antoinemadec/coc-fzf'

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

Plug 'tpope/vim-dispatch'

Plug 'janko/vim-test', { 'for': ['python', 'rust', 'vim'] }
  let test#strategy = "dispatch"

Plug 'liuchengxu/vista.vim'     " can't lazy load vista
  let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
  let g:vista_fzf_preview = ['right:50%']
  let g:vista_default_executive = 'coc'

Plug 'romainl/vim-cool'
" Plug 'haya14busa/incsearch.vim'
" Plug 'haya14busa/is.vim'

" if has('win32')
"   Plug 'kassio/neoterm'
"     let g:neoterm_autoinsert = 1
" endif

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
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-eunuch'
Plug 'psliwka/vim-smoothie'
Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }

Plug 'dhruvasagar/vim-zoom'
 let g:zoom#statustext = ''

Plug 'sickill/vim-pasta'
Plug 'stefandtw/quickfix-reflector.vim'

Plug 'airblade/vim-rooter'
  let g:rooter_silent_chdir = 1
  let g:rooter_change_directory_for_non_project_files = 'current'

Plug 'tpope/vim-sleuth'

Plug 'wesQ3/vim-windowswap'
  let g:windowswap_map_keys = 0

Plug 'lambdalisue/suda.vim'
command! SudoWrite w suda://%

" Plug 'ptzz/lf.vim'
"   let g:lf_map_keys = 0
"   let g:lf_replace_netrw = 1

Plug 'voldikss/vim-floaterm', Cond(has('nvim'))
  let g:floaterm_width = 0.85
  let g:floaterm_height = 0.85
  let g:floaterm_borderchars = ['═', '║', '═', '║', '╔', '╗', '╝', '╚']

" don't need in neovim master branch
Plug 'machakann/vim-highlightedyank'
  let g:highlightedyank_highlight_duration = 300

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
  " let g:vim_markdown_no_default_key_mappings = 1
  let g:vim_markdown_conceal = 0
  let g:vim_markdown_conceal_code_blocks = 0
  let g:vim_markdown_auto_insert_bullets = 1
  let g:vim_markdown_math = 1
  let g:vim_markdown_strikethrough = 1

Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

Plug 'junegunn/goyo.vim', { 'on': 'Goyo' }
Plug 'junegunn/limelight.vim', { 'on': 'Goyo' }
" Plug 'vimwiki/vimwiki'

" ----------------------------- Web Developement ---------------------------
Plug 'mattn/emmet-vim', { 'for': ['html', 'css', 'javascript'] }
Plug 'alvan/vim-closetag', { 'for': 'html' }
Plug 'turbio/bracey.vim', { 'do': 'npm install --prefix server', 'for': ['html', 'css', 'javascript'] }

Plug 'othree/html5.vim', { 'for': 'html' }
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'cakebaker/scss-syntax.vim', { 'for': 'css' }

" ----------------------------- Language Specific --------------------------
Plug 'MTDL9/vim-log-highlighting', { 'for': 'log' }
Plug 'chrisbra/csv.vim', { 'for': 'csv' }
  let g:no_csv_maps = 1
Plug 'elzr/vim-json', { 'for': 'json' }
    let g:vim_json_syntax_conceal = 0

Plug 'vim-python/python-syntax', { 'for': 'python' }
Plug 'rust-lang/rust.vim', { 'for': 'rust' }
" Plug 'arzg/vim-rust-syntax-ext', { 'for': 'rust' }
Plug 'cespare/vim-toml', { 'for': 'toml' }
Plug 'tbastos/vim-lua', { 'for': 'lua' }

Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
Plug 'lervag/vimtex', { 'for': ['plaintex', 'latex'] }

Plug 'chrisbra/vim-zsh', { 'for': 'zsh' }
Plug 'ericpruitt/tmux.vim', { 'for': 'tmux' }
Plug 'zinit-zsh/zinit-vim-syntax', { 'for': 'zsh' }
Plug 'baskerville/vim-sxhkdrc', { 'on': 'sxhkdrc' }

" considering
"Plug 'junegunn/vim-after-object'
"Plug 'airblade/vim-gitgutter'
"Plug 'sheerun/vim-polyglot'
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
      \   {'buns': ['{ ', ' }'], 'nesting': 1, 'match_syntax': 1, 'motionwise': ['char', 'block'], 'kind': ['add', 'replace'], 'action': ['add'], 'input': ['{']},
      \   {'buns': ['[ ', ' ]'], 'nesting': 1, 'match_syntax': 1, 'motionwise': ['char', 'block'], 'kind': ['add', 'replace'], 'action': ['add'], 'input': ['[']},
      \   {'buns': ['( ', ' )'], 'nesting': 1, 'match_syntax': 1, 'motionwise': ['char', 'block'], 'kind': ['add', 'replace'], 'action': ['add'], 'input': ['(']},
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
  tmap <C-o> <C-\><C-n>
endif
" }}}
