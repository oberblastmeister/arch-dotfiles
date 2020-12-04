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
  -- utils.nnoremap_buf('<leader>fr', '<cmd>lua vim.lsp.buf.references()<CR>')
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

  -- vim.cmd [[autocmd Lsp CursorHold  <buffer> lua vim.lsp.buf.document_highlight()]]
  -- vim.cmd [[autocmd Lsp CursorHoldI <buffer> lua vim.lsp.buf.document_highlight()]]
  -- vim.cmd [[autocmd Lsp CursorMoved <buffer> lua vim.lsp.buf.clear_references()]]

  -- auto diagnostic popup
  -- vim.cmd [[autocmd Lsp CursorHold <buffer> lua vim.lsp.util.show_line_diagnostics()]]
end

function setup_diagnostics()
  vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
      underline = true,

      virtual_text = true,

      signs = false,

      virtual_text = {
        spacing = 1,
        prefix = ' ',
      },

      update_in_insert = true,
    }
  )
end

-- debugs information from lsp client
function M.setup()
  setup_diagnostics()

  utils.augroup("Lsp")

  -- vim.cmd [[autocmd Lsp BufEnter * lua print('num_clients: ', vim.tbl_count(vim.lsp.buf_get_clients(0)))]]

  if settings.python_lsp == PythonLsp.pyls then
    lspconfig.pyls.setup {
      on_attach = custom_on_attach,
      settings = require"lsp_settings/pyls",
    }
  elseif settings.python_lsp == PythonLsp.pyls_ms then

    lspconfig.pyls_ms.setup {on_attach = custom_on_attach}

  elseif settings.python_lsp == PythonLsp.jedi_language_server then

    lspconfig.jedi_language_server.setup{on_attach = custom_on_attach}

  end

  lspconfig.vimls.setup {on_attach = custom_on_attach}

  lspconfig.sumneko_lua.setup {
    on_attach = custom_on_attach,
    -- cmd = {"lua-language-server"},
    settings = require'lsp_settings/sumneko_lua'
  }

  lspconfig.jdtls.setup {on_attach = custom_on_attach}

  lspconfig.jsonls.setup {
    on_attach = custom_on_attach,
    cmd = {"json-languageserver", "--stdio"},
  }

  -- lspconfig.yamlls.setup {on_attach = custom_on_attach}

  lspconfig.gopls.setup {
    on_attach = custom_on_attach,
    root_dir = lspconfig.util.root_pattern('go.mod', '.git', '')
  }

  lspconfig.texlab.setup {
    on_attach = custom_on_attach,
    filetypes = {"tex", "bib", "plaintex"},
  }

  lspconfig.bashls.setup {on_attach = custom_on_attach}

  lspconfig.html.setup {on_attach = custom_on_attach}

  lspconfig.tsserver.setup {on_attach = custom_on_attach}

  lspconfig.cssls.setup {on_attach = custom_on_attach}

  lspconfig.rust_analyzer.setup {
    on_attach = custom_on_attach,
    settings = require"lsp_settings/rust_analyzer"
  }

  lspconfig.hls.setup {
    on_attach = custom_on_attach,
    root_dir = lspconfig.util.root_pattern("*.cabal", "stack.yaml", "cabal.project", "package.yaml", "hie.yaml", ".git");
    settings = require'lsp_settings/hls',
  }

  lspconfig.clojure_lsp.setup {on_attach = custom_on_attach}

  -- nvim_lsp.ccls.setup {on_attach = custom_on_attach}

  lspconfig.clangd.setup {on_attach = custom_on_attach}

  lspconfig.diagnosticls.setup {
    on_attach = custom_on_attach,
    -- filetypes = {"markdown", "sh", "lua"},
    filetypes = {"sh", "lua"},
    init_options = require"lsp_settings/diagnosticls",
  }

  -- general purpose language server for linters
  -- lspconfig.efm.setup{on_attach = custom_on_attach}
end

-- function M.install()
  --   print('installing lsp servers, some may not be able to be installed')
  --   for server, _ in pairs(servers) do
  --     vim.cmd('LspInstall ' .. server)
  --   end
  -- end

  return M
