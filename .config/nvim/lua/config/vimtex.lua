local M = {}

function M.setup()
  vim.g.vimtex_compiler_progname = 'nvr'
  vim.g.vimtex_view_general_viewer = 'zathura'
  vim.g.vimtex_compiler_method = 'tectonic'
  -- vim.g.vimtex_compiler_tectonic = {
  --   build_dir = '',
  --   options = {
  --     '--keep-logs',
  --     '--synctex'
  --   }
  -- }
  -- vim.cmd [[autocmd BufWritePost *.tex silent VimtexCompile]]
end

function M.getCompletionItems(prefix)
  -- define your total completion items
  local items = vim.api.nvim_call_function('vimtex#complete#omnifunc',{0, prefix})
  return items
end

M.complete_item = {
  item = M.getCompletionItems
}

return M
