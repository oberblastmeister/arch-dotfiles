local settings = require'config/settings'

local function setup()
  vim.g.lightline = {
    colorscheme = 'gruvbox',
    active = {
      left = {
        {'mode', 'paste', 'zoom'},
        {'fugitive'}
      },
      right = {
        {'lspstatus', 'percent'},
      }
    },
    tabline = {
      left = {{'buffers'}},
      right = {{}}
    },
    component = {
      lineinfo = ' %3l:%-2v',
    },
    component_expand = {
      buffers = 'lightline#bufferline#buffers'
    },
    component_type = {
      buffers = 'tabsel',
      readonly = 'error',
      linter_warnings = 'warning',
      linter_errors = 'error',
    },
    component_function = {
      readonly = 'helpers#lightline#read_only',
      fugitive = 'helpers#lightline#fugitive',
      cocstatus = 'coc#status',
      lspstatus = 'helpers#lightline#lsp',
      currentfunction = 'CocCurrentFunction',
      zoom = 'zoom#statusline'
    },
    component_raw = {
      buffers = 1
    }
  }

  vim.g['lightline#bufferline#show_number'] = 2
  vim.g['lightline#bufferline#clickable'] = 1
  vim.g['lightline#bufferline#modified'] = ' '
  vim.g['lightline#bufferline#read_only'] = ' '
  vim.g['lightline#bufferline#more_buffers'] = '…'
  vim.g['lightline#bufferline#unnamed'] = '_'
end

return {
  setup = setup
}
