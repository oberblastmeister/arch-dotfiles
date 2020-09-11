" ============================================================================
" Settings {{{
" ============================================================================
set number relativenumber
set cursorline
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
set pumblend=15
set winblend=0

" no splash screen and shorter messages
set shortmess+=I " no intro
set shortmess+=O
set shortmess+=a   " use abbreviations
set shortmess+=W   " dont' echo written when writing, lightline already has symbol
set shortmess+=T
set shortmess+=A   " no swapfile messages
set path+=**

set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4

" for lightline bufferline
set showtabline=2
" allow lightline buffer line to be shown if gui is running
if has('gui_running')
  set guioptions-=e
endif
" }}}

" ============================================================================
" Coc {{{
" ============================================================================
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

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect
" }}}

" ============================================================================
" Appearance {{{
" ============================================================================
" make ~ for new lines be same color as background so they are not seen
" " remove status line for press enter to continue msgs

" " make sign column same as background, but keep highlight of virtual text
" set fillchars+=vert:\
" }}}
