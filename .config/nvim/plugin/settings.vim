" ============================================================================
" Settings {{{
" ============================================================================
" correct number options
set number relativenumber

set smartindent

set lazyredraw " faster macros

" use system clipboard
set clipboard^=unnamed,unnamedplus

" live search and replace
set inccommand=nosplit

" don't show mode or command (has status line)
set noshowmode
set noshowcmd

" treesitter folding
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set foldlevelstart=99 " open all folds when starting to edit buffer

" set timeoutlen=800
" set ttimeoutlen=20

set ignorecase smartcase

" allow mouse to be used for everything
set mouse=a

" do not wrap text
set nowrap

set pumheight=20

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

" tabs/spaces setting
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

" guistuff
" set guifont=FiraCode\ Nerd\ Font:h11:style=Retina " set guifont
set guifont=FiraCode\ Nerd\ Font:h12
" set guifont=OperatorMono\ Nerd\ Font:h18:style=Medium

" set default spell checking language (when spell checking is on)
set spelllang=en_us

" set spell file directory
set spellfile=$HOME/Sync/vim/spell/en_us.utf-8.add

set conceallevel=1
" }}}

" Firenvim specific settings
if exists('g:started_by_firenvim')
    " general options
    set signcolumn=no
    set laststatus=0 noruler noshowcmd
    set showtabline=0
    set guifont=FiraCode\ Nerd\ Font:h10:style=Retina

    augroup Firenvim
      au!
      au BufEnter github.com_*.txt set filetype=markdown
    augroup END

    " let fc = g:firenvim_config['localSettings']
    " let fc['https://www\.spanishdict\.com.*'] = { 'takeover': 'never', 'priority': 1 }
    " let fc['https://docs\.google\.com.*'] = { 'takeover': 'never', 'priority': 1 }
endif

set title " set the title of the window
