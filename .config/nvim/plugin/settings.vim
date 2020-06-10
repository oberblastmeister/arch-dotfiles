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
set number relativenumber
set clipboard^=unnamed,unnamedplus
set tabstop=4
set shiftwidth=4
set inccommand=nosplit
set expandtab
set noshowmode
set foldmethod=syntax
set foldlevelstart=99
set timeoutlen=500
set ttimeoutlen=0
set ignorecase
set smartcase
set wrap
set textwidth=79
set linebreak
set autoread
set mouse=a
set lazyredraw
set nowrap
" no splash screen and shorter messages
set shortmess+=I
set shortmess+=O
set shortmess+=a   " use abbreviations
set shortmess+=W   " dont' echo written when writing

" make ~ for new lines be same color as background so they are no seen
highlight! EndOfBuffer ctermbg=bg ctermfg=bg guibg=bg guifg=bg
" remove status line for press enter to continue msgs
highlight! StatusLine ctermbg=bg ctermfg=bg guibg=bg guifg=bg

" set shortmess+=A   " no swapfile messages
