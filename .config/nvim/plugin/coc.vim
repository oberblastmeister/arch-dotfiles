" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

 " GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
" don't want to replace gi default mappings
" nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" show docs in preview window
noremap <silent> K :call <SID>show_documentation()<CR>

" Highlight the symbol and its references when holding the cursor.
autocmd! CursorHold * silent! call CocActionAsync('highlight')

" Symbol renaming. {{{
let g:which_key_map.r = { 'name': '+rename' }

nmap <leader>rn <Plug>(coc-rename)
let g:which_key_map.r.n = 'symbol'

nmap <leader>rw :CocCommand document.renameCurrentWord<CR>
let g:which_key_map.r.w = 'word'

nmap <leader>rf <Plug>(coc-refactor)
let g:which_key_map.r.f = 'refractor'

nmap <leader>rs :CocSearch <cword><cr>
let g:which_key_map.r.s = 'search'
" }}}

augroup coc
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Breaks <C-i> in jumplist for some reason
" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of LS, ex: coc-tsserver
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

"" Do default action for next item.
"nnoremap <silent> <space>j  :<C-u>CocNext<CR>
"" Do default action for previous item.
"nnoremap <silent> <space>k  :<C-u>CocPrev<CR>

function! s:cocActionsOpenFromSelected(type) abort
  execute 'CocCommand actions.open ' . a:type
endfunction

xmap <silent> <leader>a :<C-u>execute 'CocCommand actions.open ' . visualmode()<CR>
nmap <silent> <leader>a :<C-u>set operatorfunc=<SID>cocActionsOpenFromSelected<CR>g@
let g:which_key_map.a = 'actions with text objects'

" coc multiple cursors mappings
nmap <silent> <C-c> <Plug>(coc-cursors-position)

" overide Q ex-mode mapping, don't want ex mode
nmap <silent> Q <Plug>(coc-cursors-word)*
xmap <silent> Q y/\V<C-r>=escape(@",'/\')<CR><CR>gN<Plug>(coc-cursors-range)gn

" lsp mappings
let g:which_key_map.l = {
        \ 'name' : '+lsp',
        \ 'F' : ['Format', 'format entire file'],
        \ 'o' : ['OR', 'organize imports'],
        \ 'c' : ['Fold', 'collapse/fold file'],
        \ 'a' : ['<Plug>(coc-fix-current)', 'autofix current'],
        \ 'f' : ['<Plug>(coc-format-selected)', 'format with text objects'],
        \ 'r' : ['mappings#restart_language_server()', 'restart language server of filetype'],
        \ }

" mappings to consider
" <Plug>(coc-openlink)
