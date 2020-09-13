local lsp = require'nvim_lsp'
local diagnostic = require'diagnostic'
local lsp_status = require'lsp-status'

local function on_attach()
  diagnostic.on_attach()
end

-- a table of lsp servers and their configs
local servers = {
  pyls_ms = {},
  vimls = {},
  sumneko_lua = {},
  jsonls = {},
  yamlls = {},
  gopls = {},
  tsserver = {},
  texlab = {},
  bashls = {},
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

-- each server will always attach diagnostic
local default_config = {
  on_attach=on_attach,
}

local function table_merge(t1, t2)
  for k, v in pairs(t2) do t1[k] = v end
end

local function setup()
  for server, config in pairs(servers) do
    table_merge(config, default_config)
    lsp[server].setup(config)
  end
end

local function install()
  print('installing lsp servers')
  for server, _ in pairs(servers) do
    vim.cmd('LspInstall ' .. server)
  end
end

return {
  setup = setup,
  install = install,
}
