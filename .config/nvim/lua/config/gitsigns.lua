local function setup()
  require('gitsigns').setup {
    signs = {
      add          = {hl = 'GitGutterAdd'   , text = '┃'},
      change       = {hl = 'GitGutterChange', text = '┃'},
      delete       = {hl = 'GitGutterDelete', text = '┃'},
      topdelete    = {hl = 'GitGutterDelete', text = '┃'},
      changedelete = {hl = 'GitGutterChangeDelete', text = '┃'},
    },
    use_decoration_api = false,
    -- current_line_blame = true,
  }
end

return {
  setup = setup
}
