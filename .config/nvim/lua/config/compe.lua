local function setup()
vim.api.nvim_exec ([[
let g:compe_enabled = v:true
let g:compe_debug = v:false
let g:compe_min_length = 1
let g:compe_auto_preselect = v:true
let g:compe_throttle_time = 120
let g:compe_source_timeout = 20
let g:compe_incomplete_delay = 200

" inoremap <silent> <C-Space> <C-r>=compe#complete()<CR>
inoremap <silent><expr> <C-e> compe#close('<C-e>')

inoremap <silent><expr> <CR>  compe#confirm('<CR>')

lua require'compe_nvim_lsp'.attach()
lua require'compe':register_lua_source('buffer', require'compe_buffer')
call compe#source#vim_bridge#register('path', compe_path#source#create())
call compe#source#vim_bridge#register('tags', compe_tags#source#create())
call compe#source#vim_bridge#register('vsnip', compe_vsnip#source#create())
]], false)
end

return {
  setup = setup,
}
