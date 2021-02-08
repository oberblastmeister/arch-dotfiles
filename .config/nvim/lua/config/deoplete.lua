local function setup()
  -- vim.cmd [[inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"]]
  -- vim.cmd [[inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"]]

  vim.cmd [[autocmd InsertEnter * ++once call deoplete#enable()]]

  vim.fn['deoplete#custom#option']('auto_refresh_delay', 80)
  vim.fn['deoplete#custom#option']('auto_complete_delay', 5)
end

return {
  setup = setup
}
