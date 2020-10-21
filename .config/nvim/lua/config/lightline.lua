local function setup()
  vim.g.lightline = {
    colorscheme = 'gruvbox',
    active = {
      left = {
        {'mode', 'paste', 'modified'},
        {'readonly', 'filename', 'fugitive'}
      },
      right = {
        {'lspstatus', 'percent'},
      }
    },
    component = {
      lineinfo = ' %3l:%-2v',
    },
    component_type = {
      readonly = 'error',
      linter_warnings = 'warning',
      linter_errors = 'error',
    },
    component_function = {
      treesitter = 'helpers#lightline#treesitter',
      readonly = 'helpers#lightline#read_only',
      fugitive = 'helpers#lightline#fugitive',
      cocstatus = 'coc#status',
      lspstatus = 'helpers#lightline#lsp',
      currentfunction = 'CocCurrentFunction',
      zoom = 'zoom#statusline'
    },
  }
end

return {
  setup = setup
}
