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
set smartindent
set lazyredraw " faster macros
set clipboard^=unnamed,unnamedplus
set inccommand=split
set noshowmode
set foldmethod=syntax
set foldlevelstart=99
set timeoutlen=400
set ttimeoutlen=0
set ignorecase smartcase
set mouse=a
set nowrap
" no splash screen and shorter messages
set shortmess+=I " no intro
" set shortmess+=O
set shortmess+=a   " use abbreviations
set shortmess+=W   " dont' echo written when writing
" set shortmess+=A   " no swapfile messages
set path+=**

" make ~ for new lines be same color as background so they are not seen
highlight! EndOfBuffer ctermbg=bg ctermfg=bg guibg=bg guifg=bg
" remove status line for press enter to continue msgs
highlight! StatusLine ctermbg=bg ctermfg=bg guibg=bg guifg=bg
hi! FloatermBorder guibg=#504945
