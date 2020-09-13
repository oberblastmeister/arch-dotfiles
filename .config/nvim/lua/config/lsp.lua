local function setup()
    local lsp = require'nvim_lsp'
    local diagnostic = require'diagnostic'

    local defaults = {
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

    lsp.rust_analyzer.setup {
        settings = {
            ["rust-analyzer"] = {
                completion = {
                    addCallArgumentSnippets = false,
                    addCallParenthesis = true,
                }
            }
        }
    }
end

local function install()
    local installable = {
        'bashls',
        'pyls_ms',
        'sumneko_lua',
        'vimls',
        'tsserver',
        'jsonls',
        'yamlls',
    }

    for _, server in ipairs(installable) do
        vim.cmd('LspInstall ' .. server)
    end
end

return {
    setup = setup,
    install = install,
}
