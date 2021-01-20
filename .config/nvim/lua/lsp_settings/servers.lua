local lspconfig = require('lspconfig')
local settings = require('settings')

local function debug_client(client, bufnr)
  print(string.format("lsp client: %s, root dir: %s", client.config.cmd[1], client.config.root_dir))
end

local function custom_on_attach(client, bufnr)
  require"lsp_settings/mappings".setup()
  require"lsp_settings/commands".setup()

  if client.config.flags then
    print('there is flags')
    client.config.flags.allow_incremental_sync = true
  end
  -- debug_client(client)

  -- vim.cmd [[autocmd Lsp CursorHold  <buffer> lua vim.lsp.buf.document_highlight()]]
  -- vim.cmd [[autocmd Lsp CursorHoldI <buffer> lua vim.lsp.buf.document_highlight()]]
  -- vim.cmd [[autocmd Lsp CursorMoved <buffer> lua vim.lsp.buf.clear_references()]]
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local LspDefaults = {
  on_attach = custom_on_attach,
  capabilities = capabilities,
}

function LspDefaults:with(user_config)
  return vim.tbl_extend("keep", user_config, self)
end

local function setup()

  if settings.python_lsp == PythonLsp.pyls then

    lspconfig.pyls.setup(LspDefaults:with {
      settings = require"lsp_settings/servers/pyls",
    })

  elseif settings.python_lsp == PythonLsp.pyls_ms then

    lspconfig.pyls_ms.setup(LspDefaults)

  elseif settings.python_lsp == PythonLsp.jedi_language_server then

    lspconfig.jedi_language_server.setup(LspDefaults)

  elseif settings.python_lsp == PythonLsp.pyright then

    lspconfig.pyright.setup(LspDefaults)

  end


  lspconfig.vimls.setup(LspDefaults)

  -- lspconfig.sumneko_lua.setup(LspDefaults:with {
  --   settings = require'lsp_settings/sumneko_lua'
  -- })

  -- wraps sumneko lua
  require('nlua.lsp.nvim').setup(require('lspconfig'), {
    LspDefaults:with {
      -- include glboal you want to tell the Lsp are real
      globals = {},
      settings = require'lsp_settings/servers/sumneko_lua'
    }
  })

  lspconfig.jdtls.setup(LspDefaults)

  lspconfig.jsonls.setup(LspDefaults:with {
    cmd = {"json-languageserver", "--stdio"},
  })

  lspconfig.yamlls.setup(LspDefaults)

  lspconfig.gopls.setup(LspDefaults:with {
    root_dir = lspconfig.util.root_pattern('go.mod', '.git', '')
  })

  lspconfig.texlab.setup(LspDefaults:with {
    filetypes = {"tex", "bib", "plaintex"},
  })

  lspconfig.bashls.setup(LspDefaults)

  lspconfig.html.setup(LspDefaults)

  lspconfig.tsserver.setup(LspDefaults)

  lspconfig.cssls.setup(LspDefaults)

  lspconfig.hls.setup(LspDefaults:with {
    root_dir = lspconfig.util.root_pattern("*.cabal", "stack.yaml", "cabal.project", "package.yaml", "hie.yaml", ".git");
    settings = require'lsp_settings/servers/hls',
  })

  lspconfig.clojure_lsp.setup(LspDefaults)

  lspconfig.clangd.setup(LspDefaults)

  lspconfig.diagnosticls.setup(LspDefaults:with {
    -- filetypes = {"sh", "lua", "markdown"},
    filetypes = {"sh", "lua"},
    init_options = require"lsp_settings/servers/diagnosticls",
  })

  lspconfig.dhall_lsp_server.setup(LspDefaults)

  lspconfig.amuletlsp.setup(LspDefaults)

  lspconfig.rust_analyzer.setup(LspDefaults:with {
    settings = require"lsp_settings/servers/rust_analyzer"
  })

  lspconfig.tomllsp.setup(LspDefaults)

  -- lspconfig.taplolsp.setup(LspDefaults)
  -- lspconfig.taplolsp.setup(LspDefaults:with {
  --   filetypes = {"toml"}
  -- })
end

return {setup = setup}
