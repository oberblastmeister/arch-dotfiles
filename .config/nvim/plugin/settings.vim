" ============================================================================
" Settings {{{
" ============================================================================
if has('termguicolors')
  set termguicolors
  lua require'colorizer'.setup()
endif

colorscheme gruvbox
set background=dark

set number relativenumber
set cursorline
set smartindent
set lazyredraw " faster macros
set clipboard^=unnamed,unnamedplus
set inccommand=nosplit
set noshowmode
set foldmethod=syntax
set foldlevelstart=99
set timeoutlen=500
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
" }}}

" ============================================================================
" Appearance {{{
" ============================================================================
" make ~ for new lines be same color as background so they are not seen
highlight! EndOfBuffer ctermbg=bg ctermfg=bg guibg=bg guifg=bg
" remove status line for press enter to continue msgs
highlight! StatusLine ctermbg=bg ctermfg=bg guibg=bg guifg=bg
highlight! CursorLineNr ctermbg=bg guibg=bg
hi! FloatermBorder guibg=#504945

" make sign column same as background, but keep highlight of virtual text
hi! CocErrorVirtualText guibg=#3c3836 guifg=#fb4934
hi! CocHintVirtualText guibg=#3c3836 guifg=#83a598
hi! CocRustChainingHint guibg=#3c3836 guifg=#83a598
hi! CocWarningVirtualText guibg=#3c3836 guifg=#fe8019
hi! CocCursorRange guibg=#d3869b guifg=#282828
" set fillchars+=vert:\
" }}}
