local function setup()
  vim.g.rooter_silent_chdir = 1
  vim.g.rooter_change_directory_for_non_project_files = 'current'
  vim.g.rooter_patterns = {'.git', 'Makefile', 'Cargo.toml'}
end

return {
  setup = setup
}
