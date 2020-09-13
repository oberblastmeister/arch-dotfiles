local nvim_lsp = require'nvim_lsp'
local diagnostic = require'diagnostic'
local lsp_status = require'lsp-status'

lsp_status.register_progress()

local function on_attach(client)
  diagnostic.on_attach(client)
  lsp_status.on_attach(client)
end

-- a table of lsp servers and their configs
-- custom commands are usually specified if the server isn't installed using LspInstall
local servers = {
  pyls_ms = {
    callbacks = lsp_status.extensions.pyls_ms.setup(),
    settings = {
      python = {
        workspaceSymbols = {
          enabled = true,
        }
      }
    }
  },
  vimls = {},
  sumneko_lua = {
    cmd = {"lua-language-server"}
  },
  jsonls = {
    cmd = {"json-languageserver", "--stdio"},
  },
  yamlls = {},
  gopls = {},
  texlab = {},
  bashls = {},
  html = {},
  tsserver = {},
  cssls = {},
  rust_analyzer = {
    settings = {
      ["rust-analyzer"] = {
        completion = {
          addCallArgumentSnippets = false,
          addCallParenthesis = false,
        }
      }
    }
  }
}

-- root_pattern('string') or dirname
-- root_dir = nvim_lsp.util.root_pattern("go.mod", ".git") or nvim_lsp.util.dirname(),

-- each server will always attach diagnostic
local default_config = {
  on_attach=on_attach,
  capabilities = lsp_status.capabilities,
}

-- note! will change table 2!!
local function table_merge(default, config)
  for k, v in pairs(default) do
    -- do not override config keys with default
    -- only merge if config doesn't already have the defaults
    if config[k] == nil then
      config[k] = v end
    end
  return config
end

local function setup()
  for server, config in pairs(servers) do
    table_merge(default_config, config)
    nvim_lsp[server].setup(config)
  end
end

local function install()
  print('installing lsp servers, some may not be able to be installed')
  for server, _ in pairs(servers) do
    vim.cmd('LspInstall ' .. server)
  end
end

return {
  setup = setup,
  install = install,
}
