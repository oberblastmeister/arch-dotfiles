"
"                                       ██
"                                      ░░
"    ███████   █████   ██████  ██    ██ ██ ██████████
"   ░░██░░░██ ██░░░██ ██░░░░██░██   ░██░██░░██░░██░░██
"    ░██  ░██░███████░██   ░██░░██ ░██ ░██ ░██ ░██ ░██
"    ░██  ░██░██░░░░ ░██   ░██ ░░████  ░██ ░██ ░██ ░██
"    ███  ░██░░██████░░██████   ░░██   ░██ ███ ░██ ░██
"   ░░░   ░░  ░░░░░░  ░░░░░░     ░░    ░░ ░░░  ░░  ░░

function! Cond(cond, ...)
  let opts = get(a:000, 0, {})
  return a:cond ? opts : extend(opts, { 'on': [], 'for': [] })
endfunction

silent! if plug#begin(stdpath('data') . '/plugged')

" =========================== Appearance ==========================================================================================================================
" color scheme
Plug 'itchyny/lightline.vim'
  let g:lightline = {
    \ 'colorscheme': 'gruvbox',
    \ 'active': {
    \   'left': [ [ 'mode', 'paste', 'zoom'],
    \             ['cocstatus',  'fugitive', 'readonly', 'filename', 'modified'] ],
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
    \   'fugitive': 'helpers#lightline#fugitive',
    \   'cocstatus': 'coc#status',
    \   'currentfunction': 'CocCurrentFunction',
    \   'zoom': 'zoom#statusline'
    \ },
    \ }

Plug 'morhetz/gruvbox'
Plug 'yggdroot/indentline'
Plug 'ryanoasis/vim-devicons'
Plug 'norcalli/nvim-colorizer.lua'

" =========================== Important ==========================================================================================================================
Plug 'neoclide/coc.nvim', {'branch': 'release'}
  let g:coc_global_extensions = [
  \ 'coc-python',
  \ 'coc-json',
  \ 'coc-sh',
  \ 'coc-rust-analyzer',
  \ 'coc-tsserver',
  \ 'coc-html',
  \ 'coc-snippets',
  \ 'coc-emmet',
  \ 'coc-actions',
  \ 'coc-java',
  \ 'coc-marketplace',
  \ 'coc-explorer'
  \ ]

Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }
  " Define prefix dictionary
  let g:which_key_map =  {}

Plug 'honza/vim-snippets'

  let g:vimspector_enable_mappings = 'HUMAN'
Plug 'puremourning/vimspector', {'do': './install_gadget.py --all --force-enable-java'}

Plug 'jiangmiao/auto-pairs'

" Use fzf for rg
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
  " lua require("navigation")
  " let g:fzf_layout = { 'window': 'lua NavigationFloatingWin()' }
  let g:fzf_layout = { 'window': 'call fuzzy_finding#centered_floating_window(1)' }

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
  let g:dispatch_no_maps = 1

Plug 'janko/vim-test', { 'for': ['python', 'rust'] }
    let test#strategy = "vimux"

Plug 'liuchengxu/vista.vim'     " can't lazy load vista
  let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
  let g:vista_fzf_preview = ['right:50%']

Plug 'haya14busa/is.vim'

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
" Plug 'kassio/neoterm'
"   let g:neoterm_autoinsert = 1

Plug 'AndrewRadev/splitjoin.vim', { 'for': ['python', 'rust', 'vim'] }
Plug 'junegunn/vim-easy-align'

" =========================== General ==============================================================================================================================
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-eunuch'
Plug 'psliwka/vim-smoothie'
Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }
Plug 'farmergreg/vim-lastplace'

Plug 'dhruvasagar/vim-zoom'
 let g:zoom#statustext = ''

" Plug 'sickill/vim-pasta'
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

Plug 'voldikss/vim-floaterm'
  let g:floaterm_width = 0.85
  let g:floaterm_height = 0.85
  let g:floaterm_borderchars = ['═', '║', '═', '║', '╔', '╗', '╝', '╚']
  " let g:floaterm_keymap_new    = '<F7>'
  " let g:floaterm_keymap_prev   = '<F8>'
  " let g:floaterm_keymap_next   = '<F9>'
  " let g:floaterm_keymap_toggle = '<F12>'

" don't need in neovim master branch
" Plug 'machakann/vim-highlightedyank'
  " let g:highlightedyank_highlight_duration = 300

Plug 'ChristianChiarulli/codi.vim', { 'on': 'Codi' }

" overides <CR> mapping to replay last macro
Plug 'wincent/replay'

" =========================== Text Objects ==========================================================================================================================
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-entire'
Plug 'wellle/targets.vim'

" =========================== Git ================================================================================================================================
Plug 'tpope/vim-fugitive'

" =========================== Tmux ==============================================================================================================================
Plug 'christoomey/vim-tmux-navigator'
Plug 'benmills/vimux'
    let g:VimuxHeight = "30"


" =========================== Markdown/Notes/Writing ==========================================================================================================================
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
  " let g:vim_markdown_no_default_key_mappings = 1
  let g:vim_markdown_conceal = 0
  let g:vim_markdown_conceal_code_blocks = 0
  " let g:vim_markdown_new_list_item_indent = 0
  let g:vim_markdown_auto_insert_bullets = 1
  let g:vim_markdown_math = 1
  let g:vim_markdown_strikethrough = 1
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install', 'for': 'markdown', 'on': 'MarkdownPreview'  }
Plug 'reedes/vim-pencil', { 'on': 'Pencil' }
  let g:pencil#wrapModeDefault = 'soft'
Plug 'junegunn/goyo.vim', { 'on': 'Goyo' }
Plug 'junegunn/limelight.vim', { 'on': 'Goyo' }
  " let g:limelight_default_coefficient = 0.7
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
Plug 'chrisbra/vim-zsh', { 'for': 'zsh' }
Plug 'zinit-zsh/zinit-vim-syntax', { 'for': 'zsh' }
Plug 'tbastos/vim-lua', { 'for': 'lua' }
Plug 'baskerville/vim-sxhkdrc'

"considering
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
" Plug brooth/far.vim

call plug#end()
endif

inoremap jk <Esc>
cnoremap jk <C-c>

" set leader mappings
let mapleader="\<Space>"
let maplocalleader="\\"
nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey  '\'<CR>

" Visual shifting does not exit visual mode
vnoremap < <gv
vnoremap > >gv

" function! s:list_buffers()
  " redir => list
  " silent ls
  " redir END
  " return split(list, "\n")
" endfunction

" function! s:delete_buffers(lines)
  " execute 'bwipeout' join(map(a:lines, {_, line -> split(line)[0]}))
" endfunction

" command! BD call fzf#run(fzf#wrap({
  " \ 'source': s:list_buffers(),
  " \ 'sink*': { lines -> s:delete_buffers(lines) },
  " \ 'options': '--multi --reverse --bind ctrl-a:select-all+accept'
" \ }))
let g:loaded_netrw       = 1
let g:loaded_netrwPlugin = 1
