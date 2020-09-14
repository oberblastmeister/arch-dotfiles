" ============================================================================
" Common {{{
" ============================================================================
" ctrl mappings

" fuzzy files
nnoremap <silent> <c-p> :nohl<CR>:Files<CR>

" fuzzy grep
nnoremap <silent> <c-f> :nohl<CR>:Rg<CR>

" fuzzy buffer tags
nnoremap <silent> <c-t> <cmd>lua require'telescope.builtin'.lsp_document_symbols{}<CR>
nnoremap <silent> <leader>ft <cmd>lua require'telescope.builtin'.lsp_workspace_symbols{}<CR>
nnoremap <silent> <leader>fT <cmd>lua require'telescope.builtin'.treesitter{}<CR>

" fuzzy buffers
nnoremap <silent> <c-b> :nohl<CR>:Buffers<CR>

" fuzzy notes
nnoremap <silent> <c-n> :nohl<CR>:NV<CR>

nnoremap <silent> <leader>. :nohl<CR>:cd ~<CR>:Dotfiles<CR>
nnoremap <silent> <leader>H :nohl<CR>:Help<CR>
nnoremap <silent> <leader>/ :nohl<CR>:BLines<CR>
nnoremap <silent> <leader>? :nohl<CR>:Lines<CR>
nnoremap <silent> <leader>e :CocFzfList diagnostics<CR>

" common fuzzy leader mappings info
let g:which_key_map = {
      \ 'e': 'fuzzy diagnostics',
      \ '?': 'fuzzy / but in all loaded buffers',
      \ '/': 'fuzzy /',
      \ 'H': 'fuzzy help',
      \ '.': 'fuzzy dotfiles'
      \ }
" }}}

" ============================================================================
" Uncommon {{{
" ============================================================================
nnoremap <silent> <leader>fa :CocFzfList actions<CR>
nnoremap <silent> <leader>fc :Commits<CR>
nnoremap <silent> <leader>fC :BCommits<CR>
nnoremap <silent> <leader>f? :Lines<CR>
nnoremap <silent> <leader>f/ :BLines<CR>
nnoremap <silent> <leader>fg :GFiles<CR>
nnoremap <silent> <leader>fu :History<CR>
nnoremap <silent> <leader>fs :Snippets<CR>
nnoremap <silent> <leader>fw :Windows<CR>
nnoremap <silent> <leader>fb :GBranches<CR>
nnoremap <silent> <leader>fa :CocFzfList actions<CR>

let g:which_key_map.f = {
      \ 'name': '+fuzzy',
      \ 'c': 'commits',
      \ 'C': 'buffer local commits',
      \ '/': 'lines in current buffer',
      \ '?': 'lines loaded in buffers',
      \ 'g': 'files managed by git',
      \ 't': 'project tags',
      \ 'u': 'history',
      \ 's': 'snippets',
      \ 'w': 'windows',
      \ 'b': 'git branchs',
      \ 'a': 'actions',
      \ }
" }}}
