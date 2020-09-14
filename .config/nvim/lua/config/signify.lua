local function setup()
  vim.g.signify_sign_add = '┃'
  vim.g.signify_sign_delete = '┃'
  vim.g.signify_sign_delete_first_line = '┃'
  vim.g.signify_sign_change = '┃'
  vim.g.signify_sign_show_count = 1
  vim.g.signify_sign_show_text = 1
  vim.g.signify_disable_by_default = 0
  vim.g.signify_line_highlight = 0
end

return {
  setup = setup
}
