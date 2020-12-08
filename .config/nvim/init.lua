if vim.fn.exists('g:vscode') == 1 then
  require"vscode"
  return
end

vim.o.termguicolors = true

vim.g.loaded_python_provider = 0

require"defaults".setup()
require"plugins".setup()
require"config/neovide".setup()
