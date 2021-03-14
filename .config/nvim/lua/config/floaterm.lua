local function setup()
  vim.g.floaterm_width = 0.85
  vim.g.floaterm_height = 0.85
  vim.g.floaterm_opener = 'edit'
end

return {
  setup = setup
}
