local nvim_lsp = require('nvim_lsp')
local nvim_lsp_configs = require('nvim_lsp/configs')
local diagnostic = require('diagnostic')
local lsp_status = require('lsp-status')

local settings = require'config/settings'

if settings.lsp_status == true then
  lsp_status.register_progress()
end

local M = {}

M.keymappings = {
  {'n', 'gd', '<cmd>lua vim.lsp.buf.declaration()<CR>'},
  {'n', '<c-]>', '<cmd>lua vim.lsp.buf.definition()<CR>'},
  {'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>'},
  {'n', 'gD', '<cmd>lua vim.lsp.buf.implementation()<CR>'},
  {'n', 'gy', '<cmd>lua vim.lsp.buf.type_definition()<CR>'},
  {'n', '<leader>lr', '<cmd>lua vim.lsp.buf.references()<CR>'},
  {'n', 'gr', "<cmd>lua require'telescope.builtin'.lsp_references{}<CR>"},
  {'n', 'g0', '<cmd>lua vim.lsp.buf.document_symbol()<CR>'},
  {'n', 'gW', '<cmd>lua vim.lsp.buf.workspace_symbol()<CR>'},
  {'n', '<leader>=', '<cmd>lua vim.lsp.buf.formatting()<CR>'},
  {'n', '<leader>e', '<cmd>lua vim.lsp.util.show_line_diagnostics()<CR>'},
  {'n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>'},
  {'n', '<leader>la', '<cmd>lua vim.lsp.buf.code_action()<CR>'},
  {'n', '<leader>li', '<cmd>lua vim.lsp.buf.incoming_call()<CR>'},
  {'n', '<leader>lo', '<cmd>lua vim.lsp.buf.outgoing_calls()<CR>'},
}

function M.setup_keymappings()
  local map = function(keymapping)
    print('keymapping:', keymapping)
    vim.api.nvim_buf_set_keymap(0, keymapping[1], keymapping[2], keymapping[3], {noremap = true, silent = true})
  end

  for _, keymapping in ipairs(keymappings) do
    print('keymapping:', keymapping)
    map(keymapping)
  end
end

local function on_attach(client, bufnr)
  diagnostic.on_attach(client, bufnr)
  if settings.lsp_status == true then
    lsp_status.on_attach(client, bufnr)
  end

  -- auto diagnostic popup
  -- vim.cmd [[autocmd CursorHold <buffer> lua vim.lsp.util.show_line_diagnostics()]]
  vim.api.nvim_exec(
[[
augroup lsp
  au!
  au CursorHold,CursorHoldI *.rs :lua require'lsp_extensions'.inlay_hints{ only_current_line = true }
augroup END
]],
false)
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
    cmd = {"lua-language-server"},
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
