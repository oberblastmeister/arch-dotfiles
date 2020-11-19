local M = {}

function M.setup()
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
