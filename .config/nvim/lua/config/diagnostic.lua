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
