local api = vim.api

local lspconfig = require('lspconfig')
local configs = require('lspconfig/configs')
local settings = require('settings')
-- local lsp_status = require('lsp-status')

local utils = require('utils')

local M = {}

function M.setup_keymappings()
  -- goto stuff
  api.nvim_buf_set_keymap(0, 'n', '<c-]>', '<cmd>lua vim.lsp.buf.definition()<CR>', {noremap = true})
  api.nvim_buf_set_keymap(0, 'n', 'gd', '<cmd>lua vim.lsp.buf.declaration()<CR>', {noremap = true})
  api.nvim_buf_set_keymap(0, 'n', 'gD', '<cmd>lua vim.lsp.buf.implementation()<CR>', {noremap = true})
  api.nvim_buf_set_keymap(0, 'n', 'gy', '<cmd>lua vim.lsp.buf.type_definition()<CR>', {noremap = true})

  api.nvim_buf_set_keymap(0, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', {noremap = true})
  api.nvim_buf_set_keymap(0, 'i', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', {noremap = true})

  -- references
  utils.nnoremap_buf('<leader>lr', '<cmd>lua vim.lsp.buf.references()<CR>')
  api.nvim_buf_set_keymap(0, 'n', 'gr', "<cmd>lua require'telescope.builtin'.lsp_references{}<CR>", {noremap = true}) -- fuzzy references

  -- symbols
  api.nvim_buf_set_keymap(0, 'n', 'g0', '<cmd>lua vim.lsp.buf.document_symbol()<CR>', {noremap = true})
  api.nvim_buf_set_keymap(0, 'n', 'gW', '<cmd>lua vim.lsp.buf.workspace_symbol()<CR>', {noremap = true})

  -- format with lsp
  api.nvim_buf_set_keymap(0, 'n', '<leader>=', '<cmd>lua vim.lsp.buf.formatting()<CR><cmd>echo "Formatted!"<CR>', {noremap = true})

  -- actions
  api.nvim_buf_set_keymap(0, 'n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', {noremap = true})
  api.nvim_buf_set_keymap(0, 'n', '<leader>la', '<cmd>lua vim.lsp.buf.code_action()<CR>', {noremap = true})

  -- calls
  api.nvim_buf_set_keymap(0, 'n', '<leader>li', '<cmd>lua vim.lsp.buf.incoming_call()<CR>', {noremap = true})
  api.nvim_buf_set_keymap(0, 'n', '<leader>lo', '<cmd>lua vim.lsp.buf.outgoing_calls()<CR>', {noremap = true})

  -- diagnostic
  api.nvim_buf_set_keymap(0, 'n', '<leader>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', {noremap = true})
  api.nvim_buf_set_keymap(0, 'n', '<leader>ll', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', {noremap = true})
  api.nvim_buf_set_keymap(0, 'n', ']g', '<cmd>lua vim.lsp.diagnostic.goto_next { wrap = false }<CR>', {noremap = true})
  api.nvim_buf_set_keymap(0, 'n', '[g', '<cmd>lua vim.lsp.diagnostic.goto_prev { wrap = false }<CR>', {noremap = true})
end

function M.setup_commands()
  vim.cmd [[command! -nargs=0 -buffer FormatLsp lua vim.lsp.buf.formatting()]]
end

local function debug_client(client, bufnr)
  print('attached')
  print('client:')
  dump(client.config.cmd)
  dump(client.cmd)
  dump(client)
  print('root dir:', client.config.root_dir)
  print('client:')
  dump(client)
  print('bufnr:', bufnr)
end

local function custom_on_attach(client, bufnr)
  M.setup_keymappings()
  M.setup_commands()

  if client.config.flags then
    print('there is flags')
    client.config.flags.allow_incremental_sync = true
  end

  -- vim.cmd [[autocmd Lsp CursorHold  <buffer> lua vim.lsp.buf.document_highlight()]]
  -- vim.cmd [[autocmd Lsp CursorHoldI <buffer> lua vim.lsp.buf.document_highlight()]]
  -- vim.cmd [[autocmd Lsp CursorMoved <buffer> lua vim.lsp.buf.clear_references()]]
end

function setup_diagnostics()
  vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
      underline = true,

      signs = false,

      virtual_text = {
        spacing = 1,
        prefix = ' ',
      },

      update_in_insert = true,
    }
  )
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

-- debugs information from lsp client
function M.setup()
  setup_diagnostics()

  utils.augroup("Lsp")

  if settings.python_lsp == PythonLsp.pyls then
    lspconfig.pyls.setup(LspDefaults:with {
      settings = require"lsp_settings/pyls",
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
      settings = require'lsp_settings/sumneko_lua'
    }
  })

  lspconfig.jdtls.setup(LspDefaults)

  lspconfig.jsonls.setup(LspDefaults:with {
    cmd = {"json-languageserver", "--stdio"},
  })

  -- lspconfig.yamlls.setup {on_attach = custom_on_attach}

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

  lspconfig.rust_analyzer.setup(LspDefaults:with {
    settings = require"lsp_settings/rust_analyzer"
  })

  lspconfig.hls.setup(LspDefaults:with {
    root_dir = lspconfig.util.root_pattern("*.cabal", "stack.yaml", "cabal.project", "package.yaml", "hie.yaml", ".git");
    settings = require'lsp_settings/hls',
  })

  lspconfig.clojure_lsp.setup(LspDefaults)

  -- lspconfig.ccls.setup(LspDefaults)

  lspconfig.clangd.setup(LspDefaults)

  lspconfig.diagnosticls.setup(LspDefaults:with {
    filetypes = {"sh", "lua"},
    init_options = require"lsp_settings/diagnosticls",
  })

  -- general purpose language server for linters
  -- lspconfig.efm.setup(LspDefaults)
end

do
  local servers = {
    "rust_analyzer",
    "pyls",
    "sumneko_lua",
    "vimls",
    "jdtls",
    "clangd",
    "jsonls",
    "clojure_lsp",
    "texlab",
    "hls",
    "html",
    "cssls",
    "diagnosticls",
    "gopls",
    "bashls",
  }

  function M.install()
    print('installing lsp servers, some may not be able to be installed')
    for _, server in ipairs(servers) do
      vim.cmd('LspInstall ' .. server)
    end
  end
end

return M
