local nvim_lsp = require('nvim_lsp')
local nvim_lsp_configs = require('nvim_lsp/configs')
local diagnostic = require('diagnostic')
local settings = require('settings')
-- local lsp_status = require('lsp-status')

local utils = require('utils')

local M = {}

function M.setup_keymappings()
  -- goto stuff
  utils.nnoremap_buf('gd', '<cmd>lua vim.lsp.buf.declaration()<CR>')
  utils.nnoremap_buf('<c-]>', '<cmd>lua vim.lsp.buf.definition()<CR>')
  utils.nnoremap_buf('gD', '<cmd>lua vim.lsp.buf.implementation()<CR>')
  utils.nnoremap_buf('gy', '<cmd>lua vim.lsp.buf.type_definition()<CR>')

  utils.nnoremap_buf('K', '<cmd>lua vim.lsp.buf.hover()<CR>')

  -- references
  utils.nnoremap_buf('gr', '<cmd>lua vim.lsp.buf.references()<CR>')
  utils.nnoremap_buf('<leader>fr', "<cmd>lua require'telescope.builtin'.lsp_references{}<CR>") -- fuzzy references

  -- symbols
  utils.nnoremap_buf('g0', '<cmd>lua vim.lsp.buf.document_symbol()<CR>')
  utils.nnoremap_buf('gW', '<cmd>lua vim.lsp.buf.workspace_symbol()<CR>')

  -- format with lsp
  utils.nnoremap_buf('<leader>=', '<cmd>lua vim.lsp.buf.formatting()<CR><cmd>echo "Formatted!"<CR>')

  -- actions
  utils.nnoremap_buf('<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>')
  utils.nnoremap_buf('<leader>la', '<cmd>lua vim.lsp.buf.code_action()<CR>')

  -- calls
  utils.nnoremap_buf('<leader>li', '<cmd>lua vim.lsp.buf.incoming_call()<CR>')
  utils.nnoremap_buf('<leader>lo', '<cmd>lua vim.lsp.buf.outgoing_calls()<CR>')

  -- show diagnostic
  utils.nnoremap_buf('<leader>e', '<cmd>lua vim.lsp.util.show_line_diagnostics()<CR>')

  -- navigate diagnostics
  utils.nnoremap_buf(']g', '<cmd>NextDiagnostic<CR>')
  utils.nnoremap_buf('[g', '<cmd>PrevDiagnostic<CR>')
  utils.nnoremap_buf(']G', '<cmd>FirstDiagnostic<CR>')
  utils.nnoremap_buf('[G', '<cmd>LastDiagnostic<CR>')
end

function M.setup_commands()
  vim.cmd [[command! -nargs=0 -buffer FormatLsp lua vim.lsp.buf.formatting()]]
end

local function custom_on_attach(client, bufnr)
  diagnostic.on_attach(client, bufnr)
  M.setup_keymappings()
  M.setup_commands()

  -- vim.cmd [[autocmd Lsp CursorHold  <buffer> lua vim.lsp.buf.document_highlight()]]
  -- vim.cmd [[autocmd Lsp CursorHoldI <buffer> lua vim.lsp.buf.document_highlight()]]
  -- vim.cmd [[autocmd Lsp CursorMoved <buffer> lua vim.lsp.buf.clear_references()]]

  -- auto diagnostic popup
  -- vim.cmd [[autocmd Lsp CursorHold <buffer> lua vim.lsp.util.show_line_diagnostics()]]
end

-- debugs information from lsp client
local function debug_client(client, bufnr)
  -- lsp_status.on_attach(client, bufnr)
  -- print('attached')
  -- print('client:')
  -- dump(client)
  -- print('root dir:', client.config.root_dir)
  -- print('client:')
  -- dump(client)
  -- print('bufnr:', bufnr)
end

function M.setup()
  -- lsp_status.register_progress()

  utils.augroup("Lsp")

  -- vim.cmd [[autocmd Lsp BufEnter * lua print('num_clients: ', vim.tbl_count(vim.lsp.buf_get_clients(0)))]]

  if settings.python_lsp == PythonLsp.pyls then
    nvim_lsp.pyls.setup {
      on_attach = custom_on_attach,
      settings = {
        pyls = {
          configurationSources = {"pycodestyle", "pyflakes"},
          plugins = {
            jedi_completion = {
              enabled = true,
              fuzzy = false,
            },
            mccabe = {
              enabled = true
            },
            pycodestyle = {
              enabled = true
            },
            pydocstyle = {
              enabled = true
            },
            pyflakes = {
              enabled = true
            },
            pylint = {
              enabled = false
            },
            rope_completion = {
              enabled = true
            },
            yapf = {
              enabled = true
            },
            -- mypy type checking
            pyls_mypy = {
              enabled = true,
              live_mode = true,
            }
          }
        }
      }
    }
  elseif settings.python_lsp == PythonLsp.pyls_ms then

    nvim_lsp.pyls_ms.setup {on_attach = custom_on_attach}

  elseif settings.python_lsp == PythonLsp.jedi_language_server then

    nvim_lsp.jedi_language_server.setup{on_attach = custom_on_attach}

  end

  nvim_lsp.vimls.setup {on_attach = custom_on_attach}

  nvim_lsp.sumneko_lua.setup {
    on_attach = custom_on_attach,
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
  }

  nvim_lsp.jdtls.setup {on_attach = custom_on_attach}

  nvim_lsp.jsonls.setup {
    on_attach = custom_on_attach,
    cmd = {"json-languageserver", "--stdio"},
  }

  nvim_lsp.yamlls.setup {on_attach = custom_on_attach}

  nvim_lsp.gopls.setup {
    on_attach = custom_on_attach,
    root_dir = nvim_lsp.util.root_pattern('go.mod', '.git', '')
  }

  nvim_lsp.texlab.setup {
    on_attach = custom_on_attach,
    filetypes = {"tex", "bib", "plaintex"},
  }

  nvim_lsp.bashls.setup {on_attach = custom_on_attach}

  nvim_lsp.html.setup {on_attach = custom_on_attach}

  nvim_lsp.tsserver.setup {on_attach = custom_on_attach}

  nvim_lsp.cssls.setup {on_attach = custom_on_attach}

  nvim_lsp.rust_analyzer.setup {
    on_attach = custom_on_attach,
    settings = {
      ["rust-analyzer"] = {
        completion = {
          addCallArgumentSnippets = true,
          addCallParenthesis = true,
        }
      }
    }
  }

  nvim_lsp.hls.setup {
    on_attach = custom_on_attach,
    -- root_dir = nvim_lsp.util.root_pattern("*.cabal", "stack.yaml", "cabal.project", "package.yaml", "hie.yaml", ".git", "xmonad.hs");
    root_dir = nvim_lsp.util.root_pattern("*.cabal", "stack.yaml", "cabal.project", "package.yaml", "hie.yaml", ".git");
  }

  nvim_lsp.clojure_lsp.setup {on_attach = custom_on_attach}
end

-- function M.install()
--   print('installing lsp servers, some may not be able to be installed')
--   for server, _ in pairs(servers) do
--     vim.cmd('LspInstall ' .. server)
--   end
-- end

return M
