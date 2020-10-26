local function setup()
  require('gitsigns').setup {
    signs = {
      add          = {hl = 'GitGutterAdd'   , text = '┃'},
      change       = {hl = 'GitGutterChange', text = '┃'},
      delete       = {hl = 'GitGutterDelete', text = '┃'},
      topdelete    = {hl = 'GitGutterDelete', text = '┃'},
      changedelete = {hl = 'GitGutterChangeDelete', text = '┃'},
    },
    keymaps = {
      [']h']         = '<cmd>lua require("gitsigns").next_hunk()<CR>',
      ['[h']         = '<cmd>lua require("gitsigns").prev_hunk()<CR>',
      ['<leader>hs'] = '<cmd>lua require("gitsigns").stage_hunk()<CR>',
      ['<leader>hu'] = '<cmd>lua require("gitsigns").undo_stage_hunk()<CR>',
      ['<leader>hr'] = '<cmd>lua require("gitsigns").reset_hunk()<CR>',
    },
    watch_index = {
      enabled = true,
      interval = 1000
    }
  }
end

return {
  setup = setup
}
