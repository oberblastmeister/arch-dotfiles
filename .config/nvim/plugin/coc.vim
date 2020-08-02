" Use <Tab> and <S-Tab> to navigate through popup menu
function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ completion#trigger_completion()
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"


let g:completion_confirm_key = ""
imap <expr> <cr>  pumvisible() ? complete_info()["selected"] != "-1" ?
                 \ "\<Plug>(completion_confirm_completion)"  : "\<c-e>\<CR>" :  "\<CR>"

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

nnoremap <silent> ]g :NextDiagnosticCycle<CR>
nnoremap <silent> [g :PrevDiagnosticCycle<CR>

 " GoTo code navigation.
" nmap <silent> <c-]> <Plug>(coc-definition)
" nmap <silent> gd <Plug>(coc-declaration)
" nmap <silent> gD <Plug>(coc-implementation)
" nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gr <Plug>(coc-references)
nnoremap gd    <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap gr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <leader>rn <cmd>lua vim.lsp.buf.rename()<CR>
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
" nmap <silent> <C-c> <Plug>(coc-cursors-position)

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
        \ 'l' : ['<Plug>(coc-codelens-action)', 'code[l]ens actions'],
        \ }

" mappings to consider
" <Plug>(coc-openlink)
