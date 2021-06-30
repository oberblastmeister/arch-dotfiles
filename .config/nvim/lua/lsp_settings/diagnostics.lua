local function setup()
  vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
      underline = true,

      signs = false,

      virtual_text = false,
      -- virtual_text = {
      --   spacing = 1,
      --   prefix = ' ',
      -- },

      update_in_insert = true,
    }
  )
end

return {setup = setup}
