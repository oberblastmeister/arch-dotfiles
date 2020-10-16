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
  vim.g.diagnostic_enable_underline = 1
  vim.g.diagnostic_insert_delay = 0
  vim.g.diagnostic_show_sign = 0
  vim.g.diagnostic_enable_virtual_text = 1
  vim.g.diagnostic_virtual_text_prefix = ' '
  vim.g.space_before_virtual_text = 2

  vim.fn.sign_define("LspDiagnosticsErrorSign", {
    text = "✘",
    texthl = "LspDiagnosticsError"
  })
  vim.fn.sign_define("LspDiagnosticsWarningSign", {
    text = "🛆",
    texthl = "LspDiagnosticsWarning"
  })
  vim.fn.sign_define("LspDiagnosticsInformationSign", {
    text = "●",
    texthl = "LspDiagnosticsInformation"
  })
  vim.fn.sign_define("LspDiagnosticsHintSign", {
    text = "○",
    texthl = "LspDiagnosticsHint"
  })

  vim.api.nvim_command [[autocmd CursorHold  <buffer> lua vim.lsp.buf.document_highlight()]]
  vim.api.nvim_command [[autocmd CursorHoldI <buffer> lua vim.lsp.buf.document_highlight()]]
  vim.api.nvim_command [[autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()]]
end

return M
