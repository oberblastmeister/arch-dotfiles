local function setup()
  vim.g.vista_icon_indent = {"╰─▸ ", "├─▸ "}
  vim.g.vista_fzf_preview = {'right:50%'}
  vim.g.vista_default_executive = 'nvim_lsp'
  vim.g.vista_vimwiki_executive = 'markdown'
end

return {
  setup = setup
}
