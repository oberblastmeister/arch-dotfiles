local M = {}

function M.setup()
  require"lsp_settings/extra".setup()
  require"lsp_settings/diagnostics".setup()
  require"lsp_settings/servers".setup()
end

return M
