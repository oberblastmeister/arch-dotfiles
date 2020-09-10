local function setup()
    local lsp = require'nvim_lsp'
    local diagnostic = require'diagnostic'

    lsp.rust_analyzer.setup{on_attach=diagnostic.on_attach}
    lsp.pyls_ms.setup{on_attach=diagnostic.on_attach}
    lsp.vimls.setup{on_attach=diagnostic.on_attach}
    lsp.sumneko_lua.setup{on_attach=diagnostic.on_attach}
    lsp.jsonls.setup{on_attach=diagnostic.on_attach}
    lsp.yamlls.setup{on_attach=diagnostic.on_attach}
    lsp.gopls.setup{on_attach=diagnostic.on_attach}
    lsp.tsserver.setup{on_attach=diagnostic.on_attach}
    lsp.texlab.setup{on_attach=diagnostic.on_attach}
    lsp.bashls.setup{on_attach=diagnostic.on_attach}
end

return {
    setup = setup
}
