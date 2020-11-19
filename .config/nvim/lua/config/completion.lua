local function setup()
  -- require'completion'.addCompletionSource('vimtex', require'config/vimtex'.complete_item)

  -- vim settings
  vim.o.completeopt='menuone,noinsert,noselect'
  vim.o.omnifunc='lua.vim.lsp.omnifunc'

  vim.g.completion_auto_change_source = 1

  vim.g.completion_enable_auto_hover = 1
  vim.g.enable_auto_signature = 1

  vim.g.completion_enable_snippet = "vim-vsnip"
  vim.g.completion_sorting = "none"
  vim.g.completion_trigger_on_delete = 1

  -- set this to avoid flickering for now and make completion faster
  vim.g.matching_strategy_list = {'exact'}
  -- more precise, less flickery
  vim.g.completion_matching_ignore_case = 0
  -- vim.g.matching_strategy_list = {'exact', 'substring', 'fuzzy'}

  vim.cmd [[imap <expr> <c-j> vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-j>']]
  vim.cmd [[smap <expr> <c-j> vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-j>']]
  vim.cmd [[imap <expr> <c-k> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<c-k>']]
  vim.cmd [[smap <expr> <c-k> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<c-k>']]

  -- keys to map
  vim.g.completion_confirm_key = ""
  vim.cmd [[imap <expr> <cr>  pumvisible() ? complete_info()["selected"] != "-1" ? "\<Plug>(completion_confirm_completion)"  : "\<c-e>\<CR>" :  "\<CR>"]]
  vim.cmd [[imap <tab> <Plug>(completion_smart_tab)]]
  vim.cmd [[imap <s-tab> <Plug>(completion_smart_s_tab)]]

  vim.cmd [[autocmd BufEnter * lua require'config/completion'.on_attach()]]
end

local function on_attach()
  local chain_complete_list = {
    default = {
      {complete_items = {'lsp', 'snippet', 'ts', 'path', 'buffers'}},
      -- {complete_items = {'path', 'lsp', 'snippet', 'ts', 'buffers'}},
      -- {complete_items = {'path'}},
      -- {complete_items = {'buffers'}},
      -- {complete_items = {'lsp', 'snippet'}},
    },
    tex = {
      {complete_items = {'lsp', 'vimtex'}},
    },
    markdown = {
      {complete_items = {}}
    }
  }

  require'completion'.on_attach {
    chain_complete_list = chain_complete_list,
  }
end

return {
  setup = setup,
  on_attach = on_attach,
}
