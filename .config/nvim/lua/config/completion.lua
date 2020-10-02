local function setup()
  require'completion'.addCompletionSource('vimtex', require'config/vimtex'.complete_item)

  vim.o.completeopt='menuone,noinsert,noselect'
  vim.o.omnifunc='lua.vim.lsp.omnifunc'

  -- auto change source
  vim.g.completion_auto_change_source = 1
  -- turn off for now for performance reasons
  vim.g.completion_enable_auto_hover = 0
  -- ignore case for completion
  vim.g.completion_matching_ignore_case = 1
  vim.g.completion_enable_snippet = "UltiSnips"

  if vim.g.completion_enable_snippet == "vim-vsnip" then
    vim.cmd [[imap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>']]
    vim.cmd [[smap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>']]
  end

  vim.cmd [[autocmd BufEnter * lua require'config/completion'.on_attach()]]
end

local function on_attach()
  local chain_complete_list = {
    default = {
      {complete_items = {'lsp', 'snippet'}},
      {complete_items = {'ts'}},
      {complete_items = {'path'}, triggered_only = {'/'}},
      {complete_items = {'buffers'}},
    },
    tex = {
      {complete_items = {'lsp', 'vimtex'}},
    },
    markdown = {
      {complete_items = {}}
    }
  }

  require'completion'.on_attach({
    matching_strategy_list= {'exact', 'substring'},
    chain_complete_list = chain_complete_list,
    completion_timer_cycle = 80,
    completion_auto_change_source = 1,
    completion_sorting = "length",
    completion_enable_snippet = "UltiSnips",
    completion_enable_auto_hover = 0,
    enable_auto_signature = 1,
    completion_matching_ignore_case = 1,
    completion_trigger_on_delete = 0,
    completion_enable_auto_paren = 0,
  })
end

local function start()
  vim.cmd [[autocmd BufEnter * lua require'config/completion'.on_attach()]]
  require('config/completion').on_attach()
end

return {
  setup = setup,
  on_attach = on_attach,
}
