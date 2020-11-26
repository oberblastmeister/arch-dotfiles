local M = {}

function M.toggle_diagnostics()
  if vim.g.diagnostic_enable_virtual_text == 1 then
    vim.g.diagnostic_enable_virtual_text = 0
  else
    vim.g.diagnostic_enable_virtual_text = 1
  end

  if vim.g.diagnostic_show_sign == 1 then
    vim.g.diagnostic_show_sign = 0
  else
    vim.g.diagnostic_show_sign = 1
  end
end

function M.setup()
  M.setup_new()
  -- vim.g.diagnostic_enable_underline = 1
  -- vim.g.diagnostic_insert_delay = 1
  -- vim.g.diagnostic_show_sign = 0
  -- vim.g.diagnostic_enable_virtual_text = 1
  -- vim.g.diagnostic_virtual_text_prefix = ' '
  -- -- vim.g.space_before_virtual_text = 2

  -- vim.fn.sign_define("LspDiagnosticsErrorSign", {
  --   text = "✘",
  --   texthl = "LspDiagnosticsError"
  -- })
  -- vim.fn.sign_define("LspDiagnosticsWarningSign", {
  --   text = "🛆",
  --   texthl = "LspDiagnosticsWarning"
  -- })
  -- vim.fn.sign_define("LspDiagnosticsInformationSign", {
  --   text = "●",
  --   texthl = "LspDiagnosticsInformation"
  -- })
  -- vim.fn.sign_define("LspDiagnosticsHintSign", {
  --   text = "○",
  --   texthl = "LspDiagnosticsHint"
  -- })

end

-- diagnostic-nvim deprecation
function M.setup_new()
  vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with {
    vim.lsp.diagnostic.on_publish_diagnostics, {
      underline = true,

      virtual_text = {
        spacing = 1,
        prefix = ' ',
      },

      update_in_insert = false,
    }
  }
end

return M
