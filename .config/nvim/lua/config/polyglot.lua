local function setup()
  -- disable on some filetypes where there are other plugins running
  vim.g.polyglot_disabled = {"markdown", "latex", "pest", "lua", "lalrpop"}
  vim.g.python_highlight_space_errors = 0
  require'filetypes/haskell'.setup()
end

return {
  setup = setup
}
