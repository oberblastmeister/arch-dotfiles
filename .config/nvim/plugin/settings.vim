" ============================================================================
" Settings {{{
" ============================================================================
" filetype plugin on
set number relativenumber
set smartindent
set lazyredraw " faster macros
set clipboard^=unnamed,unnamedplus
set inccommand=nosplit
set noshowmode
set noshowcmd
set foldmethod=syntax

" treesitter folding
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()

set foldlevelstart=99
set timeoutlen=800
set ttimeoutlen=20
set ignorecase smartcase
set mouse=a
set nowrap
set pumheight=20

" set sidescroll=5
" set pumblend=15
" set winblend=0

" no splash screen and shorter messages
set shortmess+=I " no intro
set shortmess+=O
set shortmess+=a   " use abbreviations
set shortmess+=W   " dont' echo written when writing, lightline already has symbol
set shortmess+=T
set shortmess+=A   " no swapfile messages
set path+=**

set expandtab
set tabstop=4 " number of spaces that a tab counts for
set shiftwidth=4 " number of spaces to use for each step of autoindent
set softtabstop=4

set hidden
set nobackup
set nowritebackup

" faster async updates
set updatetime=100

" do not pass messages to ins-completion-menu
set shortmess+=c

set signcolumn=yes " always show sign column so it doesn't drift

set guifont=FiraCode\ Nerd\ Font:h10:style=Retina " set guifont
" }}}
