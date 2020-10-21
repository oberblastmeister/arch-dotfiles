local nvim_lsp = require('nvim_lsp')
local nvim_lsp_configs = require('nvim_lsp/configs')
local diagnostic = require('diagnostic')
local lsp_status = require('lsp-status')

local settings = require('config/settings')
local utils = require('utils')

if settings.lsp_status == true then
  lsp_status.register_progress()
end

local M = {}

function M.setup_keymappings()
  -- goto stuff
  utils.nnoremap_buf('gd', '<cmd>lua vim.lsp.buf.declaration()<CR>')
  utils.nnoremap_buf('<c-]>', '<cmd>lua vim.lsp.buf.definition()<CR>')
  utils.nnoremap_buf('gD', '<cmd>lua vim.lsp.buf.implementation()<CR>')
  utils.nnoremap_buf('gy', '<cmd>lua vim.lsp.buf.type_definition()<CR>')

  utils.nnoremap_buf('K', '<cmd>lua vim.lsp.buf.hover()<CR>')

  -- references
  utils.nnoremap_buf('<leader>lr', '<cmd>lua vim.lsp.buf.references()<CR>')
  utils.nnoremap_buf('gr', "<cmd>lua require'telescope.builtin'.lsp_references{}<CR>") -- fuzzy references

  -- symbols
  utils.nnoremap_buf('g0', '<cmd>lua vim.lsp.buf.document_symbol()<CR>')
  utils.nnoremap_buf('gW', '<cmd>lua vim.lsp.buf.workspace_symbol()<CR>')

  -- format with lsp
  utils.nnoremap_buf('<leader>=', '<cmd>lua vim.lsp.buf.formatting()<CR>')

  -- show diagnostic
  utils.nnoremap_buf('<leader>e', '<cmd>lua vim.lsp.util.show_line_diagnostics()<CR>')

  -- actions
  utils.nnoremap_buf('<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>')
  utils.nnoremap_buf('<leader>la', '<cmd>lua vim.lsp.buf.code_action()<CR>')

  -- calls
  utils.nnoremap_buf('<leader>li', '<cmd>lua vim.lsp.buf.incoming_call()<CR>')
  utils.nnoremap_buf('<leader>lo', '<cmd>lua vim.lsp.buf.outgoing_calls()<CR>')

  -- navigate diagnostics
  utils.nnoremap_buf(']g', '<cmd>NextDiagnostic<CR>')
  utils.nnoremap_buf('[g', '<cmd>PrevDiagnostic<CR>')
  utils.nnoremap_buf(']G', '<cmd>FirstDiagnostic<CR>')
  utils.nnoremap_buf('[G', '<cmd>LastDiagnostic<CR>')
end

local function on_attach(client, bufnr)
  diagnostic.on_attach(client, bufnr)
  if settings.lsp_status == true then
    lsp_status.on_attach(client, bufnr)
  end
  M.setup_keymappings()

  -- auto diagnostic popup
  -- vim.cmd [[autocmd CursorHold <buffer> lua vim.lsp.util.show_line_diagnostics()]]
end

-- a table of lsp servers and their configs
-- custom commands are usually specified if the server isn't installed using LspInstall
local servers = {
  pyls = {},
  vimls = {},
  sumneko_lua = {
    cmd = {"lua-language-server"},
    filetypes = {"moonscript", "lua"},
    settings = {
      Lua = {
        diagnostics = {
          disable = {
            "lowercase-global"
          }
        }
      }
    }
  },
  jdtls = {},
  jsonls = {
    cmd = {"json-languageserver", "--stdio"},
  },
  yamlls = {},
  gopls = {
    root_dir = nvim_lsp.util.root_pattern('go.mod', '.git', '')
  },
  texlab = {
    filetypes = {"tex", "bib", "plaintex"},
  },
  bashls = {},
  html = {},
  tsserver = {},
  cssls = {},
  rust_analyzer = {
    settings = {
      ["rust-analyzer"] = {
        completion = {
          -- addCallArgumentSnippets = false,
          -- addCallParenthesis = false,
        }
      }
    }
  },
  hls = {},
  clojure_lsp = {},
}

-- each server will always attach diagnostic
local default_config = {
  on_attach=on_attach,
}

if settings.lsp_status == true then
  default_config.capabilities = lsp_status.capabilities
end

local function setup()
  for server, config in pairs(servers) do
    local new_config = vim.tbl_extend("keep", config, default_config);
    nvim_lsp[server].setup(new_config)
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
