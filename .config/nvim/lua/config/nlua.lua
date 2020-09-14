local function setup()
  require('nlua.lsp.nvim').setup(require('nvim_lsp'), {
    on_attach = custom_nvim_lspconfig_attach,

    -- Include globals you want to tell the LSP are real :)
    globals = {
      -- Colorbuddy
      "Color", "c", "Group", "g", "s",
    }
  })
end

return {
  setup = setup,
}
