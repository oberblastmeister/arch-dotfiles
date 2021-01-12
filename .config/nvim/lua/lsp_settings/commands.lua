local M = {}

function M.setup()
  vim.cmd [[command! -nargs=0 -buffer FormatLsp lua vim.lsp.buf.formatting()]]
end

return M
