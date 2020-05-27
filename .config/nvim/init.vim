"
"                                       ██
"                                      ░░
"    ███████   █████   ██████  ██    ██ ██ ██████████
"   ░░██░░░██ ██░░░██ ██░░░░██░██   ░██░██░░██░░██░░██
"    ░██  ░██░███████░██   ░██░░██ ░██ ░██ ░██ ░██ ░██
"    ░██  ░██░██░░░░ ░██   ░██ ░░████  ░██ ░██ ░██ ░██
"    ███  ░██░░██████░░██████   ░░██   ░██ ███ ░██ ░██
"   ░░░   ░░  ░░░░░░  ░░░░░░     ░░    ░░ ░░░  ░░  ░░


silent! if plug#begin(stdpath('data') . '/plugged')


" =========================== Appearance ==========================================================================================================================
" color scheme
Plug 'itchyny/lightline.vim'
  let g:lightline = {
    \ 'colorscheme': 'gruvbox',
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ],
    \             [ 'fugitive', 'readonly', 'filename', 'modified' ] ],
    \   'right': [ [ 'lineinfo' ],
    \              [ 'percent' ],
    \              [ 'fileformat', 'filetype'] ]
    \ },
    \ 'component': {
    \   'lineinfo': ' %3l:%-2v',
    \ },
    \ 'component_function': {
    \   'filetype': 'helpers#devicons#my_filetype',
    \   'fileformat': 'helpers#devicons#my_file_format',
    \   'readonly': 'helpers#lightline#read_only',
    \   'fugitive': 'helpers#lightline#fugitive'
    \ },
    \ 'separator': { 'left': '', 'right': '' },
    \ 'subseparator': { 'left': '', 'right': '' }
    \ }

Plug 'morhetz/gruvbox'
Plug 'yggdroot/indentline'
Plug 'ryanoasis/vim-devicons'


" =========================== Important ==========================================================================================================================
Plug 'neoclide/coc.nvim', {'branch': 'release'}
  let g:coc_global_extensions = [
  \ 'coc-python',
  \ 'coc-sh',
  \ 'coc-rust-analyzer',
  \ 'coc-tsserver',
  \ 'coc-snippets',
  \ 'coc-emmet',
  \ 'coc-actions',
  \ 'coc-html',
  \ 'coc-css',
  \ 'coc-explorer',
  \ 'coc-marketplace'
  \ ]

Plug 'jiangmiao/auto-pairs'

" Use fzf for rg
Plug 'junegunn/fzf', { 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'yuki-ycino/fzf-preview.vim'
  let g:fzf_preview_use_dev_icons = 1
  lua require("navigation")
  " let g:fzf_layout = { 'window': 'lua NavigationFloatingWin()' }
  let g:fzf_layout = { 'window': 'call fzf_preview#window#create_centered_floating_window()' }
  " let g:fzf_layout = { 'window': 'call floaterm#window#open_floating(1, 70, 70, "top")' }

Plug 'alok/notational-fzf-vim', { 'on': 'NV' }
  let g:nv_window_command = 'call fzf_preview#window#create_centered_floating_window()'
  let g:nv_search_paths = ['~/notes']
  let g:nv_keymap = {
                      \ 'ctrl-x': 'split ',
                      \ 'ctrl-v': 'vertical split ',
                        \ 'ctrl-t': 'tabedit ',
                      \ }
  let g:nv_create_note_key = 'ctrl-a'
  " When adding notes don't put it in split
  let g:nv_create_note_window = 'edit'

Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary' }
  " default 100 milliseconds (maple delay)
  let g:clap_maple_delay = 0
  " change sign
  let g:clap_current_selection_sign = { 'text': '', 'texthl': "ClapCurrentSelectionSign", "linehl": "ClapCurrentSelection"}
  let g:clap_selected_sign = { 'text': '', 'texthl': "ClapSelectedSign", "linehl": "ClapSelected" }
  " make grep delay faster
  let g:clap_provider_grep_delay = 0
  " make clap on move delay faster (default 300 milliseconds)
  let g:clap_on_move_delay = 100
  " disable rooter for clap
  let g:clap_disable_run_rooter = 1
  let g:clap_layout = { 'relative': 'editor' }

" Plug 'jremmen/vim-ripgrep'

Plug 'tpope/vim-dispatch'
  let g:dispatch_no_maps = 1
Plug 'janko/vim-test', { 'for': ['python', 'rust'] }
  if exists("$TMUX")
    let test#strategy = "vimux"
  else
    let test#strategy = "dispatch"
  endif

" if !has('win32') || !has('win64')
"   let g:vimspector_enable_mappings = 'HUMAN'
"   Plug 'puremourning/vimspector'
" endif

  " let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
Plug 'liuchengxu/vista.vim'     " can't lazy load vista
  let g:vista_default_executive = 'coc'
Plug 'romainl/vim-cool'
  let g:CoolTotalMatches = 1

if !executable('tmux')
  Plug 'kassio/neoterm'
endif

Plug 'voldikss/vim-floaterm'
  let g:floaterm_autoclose = 1

" =========================== Editing ==========================================================================================================================
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'AndrewRadev/switch.vim'
  let g:switch_custom_definitions =
      \ [
      \   ['foo', 'bar', 'baz'],
      \   ['0', '1'],
      \   ['==', '!='],
      \   ['&', '|'],
      \   ['and', 'or'],
      \   ['on', 'off'],
      \   ['yes', 'no'],
      \   ['vim', 'emacs']
      \ ]

Plug 'AndrewRadev/splitjoin.vim', { 'for': ['python', 'rust', 'vim'] }


" =========================== General ==============================================================================================================================
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-eunuch'
Plug 'psliwka/vim-smoothie'
Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }
" Plug 'haya14busa/incsearch.vim'
Plug 'farmergreg/vim-lastplace'
Plug 'dhruvasagar/vim-zoom'
" Plug 'pbrisbin/vim-mkdir'
Plug 'sickill/vim-pasta'
Plug 'stefandtw/quickfix-reflector.vim'
" Plug 'junegunn/vim-peekaboo'
Plug 'airblade/vim-rooter'
  let g:rooter_silent_chdir = 1
  let g:rooter_change_directory_for_non_project_files = 'current'
Plug 'tpope/vim-sleuth'
Plug 'wesQ3/vim-windowswap'
  let g:windowswap_map_keys = 0
Plug 'kristijanhusak/vim-carbon-now-sh', { 'on': 'CarbonNowSh' }

Plug 'lambdalisue/suda.vim'
command! SudoWrite w suda://%


" =========================== Text Objects ==========================================================================================================================
Plug 'kana/vim-textobj-user'
Plug 'glts/vim-textobj-comment'
Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-indent'
" Plug 'kana/vim-arpeggio'
Plug 'wellle/targets.vim'
Plug 'andymass/vim-matchup'
Plug 'junegunn/vim-easy-align'
  " let g:easy_align_delimiters = {
  " \ '-': { 'pattern': '-' },
  " }

" =========================== Git ================================================================================================================================
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
" Plug 'junegunn/gv.vim'
" Plug 'junegunn/vim-github-dashboard'
  let g:github_dashboard = { 'username': 'littlebubu' }


" =========================== Tmux ==============================================================================================================================
if exists('$TMUX')
  Plug 'christoomey/vim-tmux-navigator'
  " Plug 'edkolev/tmuxline.vim'
  Plug 'benmills/vimux'
    let g:VimuxHeight = "30"
endif


" =========================== Markdown/Notes/Writing ==========================================================================================================================
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
  let g:vim_markdown_no_default_key_mappings = 1
  let g:vim_markdown_conceal = 0
  let g:vim_markdown_conceal_code_blocks = 0
  let g:vim_markdown_new_list_item_indent = 0
  let g:vim_markdown_auto_insert_bullets = 1
  let g:vim_markdown_math = 1
  let g:vim_markdown_strikethrough = 1
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
Plug 'reedes/vim-pencil', { 'for': 'markdown' }
  let g:pencil#wrapModeDefault = 'soft'
Plug 'junegunn/goyo.vim', { 'for': 'markdown' }
Plug 'junegunn/limelight.vim', { 'for': 'markdown' }
  let g:limelight_default_coefficient = 0.7
" Plug 'vimwiki/vimwiki'


" =========================== Web Developement ==========================================================================================================================
Plug 'mattn/emmet-vim', { 'for': ['html', 'css', 'javascript'] }
Plug 'alvan/vim-closetag', { 'for': 'html' }

" language specific
Plug 'chrisbra/csv.vim', { 'for': 'csv' }
Plug 'vim-python/python-syntax', { 'for': 'python' }
Plug 'rust-lang/rust.vim', { 'for': 'rust' }
Plug 'cespare/vim-toml', { 'for': 'toml' }
Plug 'othree/html5.vim', { 'for': 'html' }
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'cakebaker/scss-syntax.vim', { 'for': 'css' }
Plug 'elzr/vim-json', { 'for': 'json' }
    let g:vim_json_syntax_conceal = 0
Plug 'MTDL9/vim-log-highlighting', { 'for': 'log' }
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
Plug 'ericpruitt/tmux.vim', { 'for': 'tmux' }
Plug 'LaTeX-Box-Team/LaTeX-Box', { 'for': 'latex' }
Plug 'zinit-zsh/zinit-vim-syntax', { 'for': 'zsh' }
Plug 'tbastos/vim-lua', { 'for': 'lua' }

" considering
" Plug 'junegunn/vim-after-object'
" Plug 'airblade/vim-gitgutter'
" Plug 'sheerun/vim-polyglot'
" Plug 'terryma/vim-expand-region'
" Plug 'junegunn/vim-journal'
" Plug 'junegunn/heytmux' (like tmuxinator)
"colors
" Plug 'rakr/vim-one'
" Plug 'dracula/vim', { 'as': 'dracula' }
" Plug 'arcticicestudio/nord-vim'
" Plug 'sjl/badwolf'
" Plug 'turbio/bracey.vim'
" Plug 'TaDaa/vimade'
" Plug 'tmux-plugins/vim-tmux-focus-events'
" status bar
" Plug brooth/far.vim

call plug#end()
endif

inoremap jk <Esc>
cnoremap jk <C-c>
xnoremap jk <Esc>

" set leader mappings
let mapleader="\<Space>"
let maplocalleader="\\"

" Visual shifting does not exit visual mode
vnoremap < <gv
vnoremap > >gv
