" these are defaults in neovim
if !has('nvim')
  set nocompatible
  syntax on
  filetype plugin indent on
  set autoindent
  set autoread
  set backspace=indent,eol,start
  set complete-=i
  set display=lastline
  set encoding=utf-8
  set history=10000
  set hlsearch
  set incsearch
  set laststatus=2
  set mouse=a
  set smarttab
  set ttyfast
  set viminfo+=!
  set wildmenu
  set ttymouse=xterm2
  set ruler
endif

if has('termguicolors')
  set termguicolors
  lua require'colorizer'.setup()
endif

colorscheme gruvbox
set background=dark

set number relativenumber
set smartindent
set lazyredraw " faster macros
set clipboard^=unnamed,unnamedplus
set inccommand=split
set noshowmode
set foldmethod=syntax
set foldlevelstart=99
set timeoutlen=500
set ttimeoutlen=20
set ignorecase smartcase
set mouse=a
set nowrap

" no splash screen and shorter messages
set shortmess+=I " no intro
set shortmess+=O
set shortmess+=a   " use abbreviations
set shortmess+=W   " dont' echo written when writing, lightline already has symbol
set shortmess+=T
set shortmess+=A   " no swapfile messages
set path+=**

" needed for coc.vim
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Having longer upatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=100

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" highlights
" make ~ for new lines be same color as background so they are not seen
highlight! EndOfBuffer ctermbg=bg ctermfg=bg guibg=bg guifg=bg
" remove status line for press enter to continue msgs
highlight! StatusLine ctermbg=bg ctermfg=bg guibg=bg guifg=bg
highlight! CursorLineNr ctermbg=bg guibg=bg
hi! FloatermBorder guibg=#504945
highlight clear SignColumn
" set fillchars+=vert:\ 
