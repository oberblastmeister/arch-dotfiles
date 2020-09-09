" Use <Tab> and <S-Tab> to navigate through popup menu
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ completion#trigger_completion()


let g:completion_confirm_key = ""
imap <expr> <cr>  pumvisible() ? complete_info()["selected"] != "-1" ?
                 \ "\<Plug>(completion_confirm_completion)"  : "\<c-e>\<CR>" :  "\<CR>"

nnoremap <silent> ]g :NextDiagnosticCycle<CR>
nnoremap <silent> [g :PrevDiagnosticCycle<CR>

 " GoTo code navigation.
nnoremap <silent> gd    <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> gy   <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
nnoremap <silent> <leader>rn <cmd>lua vim.lsp.buf.rename()<CR>
nnoremap <silent> <leader>la <cmd>lua vim.lsp.buf.code_action()<CR>
" }}}

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
