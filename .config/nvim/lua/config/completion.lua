local api = vim.api

local M = {}

function M.setup()
  -- require'completion'.addCompletionSource('vimtex', require'config/vimtex'.complete_item)

  -- vim settings
  vim.o.completeopt='menuone,noinsert,noselect'
  vim.o.omnifunc='lua.vim.lsp.omnifunc'

  vim.g.completion_auto_change_source = 1

  vim.g.completion_enable_auto_hover = 1
  vim.g.enable_auto_signature = 1

  -- vim.g.completion_enable_snippet = "snippets.nvim"
  vim.g.completion_enable_snippet = "vim-vsnip"
  vim.g.completion_sorting = "none"
  vim.g.completion_trigger_on_delete = 1

  -- set this to avoid flickering for now and make completion faster
  vim.g.matching_strategy_list = {'exact'}
  -- more precise, less flickery
  vim.g.completion_matching_ignore_case = 0
  -- vim.g.matching_strategy_list = {'exact', 'substring', 'fuzzy'}

  if vim.g.completion_enable_snippet == "snippets.nvim" then

    vim.cmd([[inoremap <c-k> <cmd>lua return require'snippets'.expand_or_advance(1)<CR>]])
    vim.cmd([[inoremap <c-j> <cmd>lua return require'snippets'.advance_snippet(-1)<CR>]])

  elseif vim.g.completion_enable_snippet == "vim-vsnip" then
    vim.cmd [[imap <expr> <c-j> vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-j>']]
    vim.cmd [[smap <expr> <c-j> vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-j>']]
    vim.cmd [[imap <expr> <c-k> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<c-k>']]
    vim.cmd [[smap <expr> <c-k> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<c-k>']]
  end

  -- keys to map
  vim.g.completion_confirm_key = ""
  -- vim.cmd [[imap <s-tab> <Plug>(completion_smart_s_tab)]]
  -- vim.cmd [[imap <tab> <Plug>(completion_smart_tab)]]

  vim.cmd [=[imap <Tab> <cmd>lua require'config/completion'.expand_snippet([[<Tab>]])<CR>]=]
  vim.cmd [[autocmd BufEnter * lua require'config/completion'.on_attach()]]
  -- vim.cmd [[imap <CR> <cmd>lua require'config/completion'.always_cr()<CR>]]
  vim.cmd [[imap <expr> <cr>  pumvisible() ? complete_info()["selected"] != "-1" ? "\<Plug>(completion_confirm_completion)"  : "\<c-e>\<CR>" :  "\<CR>"]]
end

local function feedkeys(s)
  api.nvim_feedkeys(api.nvim_replace_termcodes(s, true, true, true), 'n', true)
end

--- maps the key to only expand snippet when pumvisible is open
function M.expand_snippet(key)
  if vim.fn.pumvisible() == 1 then
    if vim.fn.complete_info({"selected"})["selected"] == -1 then
      api.nvim_input("<C-n><Plug>(completion_confirm_completion)")
    else
      api.nvim_input("<Plug>(completion_confirm_completion)")
    end
  else
    feedkeys(key)
  end
end

function M.smart_n()
  if vim.fn.pumvisible() == 1 then
    -- api.nvim_select_popupmenu_item(vim.fn.complete_info({"selected")}["selected"] + 1)
    feedkeys("<Down>")
    -- local current_selected = vim.fn.complete_info({"selected"})["selected"] + 1
    -- api.nvim_select_popupmenu_item(current_selected, false, false, {})
  else
    feedkeys()
    -- print('no')
    -- feedkeys("<C-n>")
  end
end

function M.always_cr()
  if vim.fn.pumvisible() then
    feedkeys("<C-y><CR>")
  else
    feedkeys("<CR>")
  end
end

function M.smart_p()
end

function M.on_attach()
  local chain_complete_list = {
    default = {
      {complete_items = {'lsp', 'snippet', 'ts', 'path', 'buffers'}},
    },
    -- tex = {
    --   {complete_items = {'lsp', 'vimtex'}},
    -- },
    markdown = {
      {complete_items = {}}
    }
  }

  require'completion'.on_attach {
    chain_complete_list = chain_complete_list,
  }
end

return M
