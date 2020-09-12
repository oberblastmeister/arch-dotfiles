local function setup()
    local lsp = require'nvim_lsp'
    local diagnostic = require'diagnostic'

    local defaults = {
        'rust_analyzer',
        'pyls_ms',
        'vimls',
        'sumneko_lua',
        'jsonls',
        'yamlls',
        'gopls',
        'tsserver',
        'texlab',
        'bashls',
    }

    for _, default in ipairs(defaults) do
        lsp[default].setup{on_attach=diagnostic.on_attach}
    end
end

return {
    setup = setup
}
