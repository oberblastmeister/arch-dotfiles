local utils = require('utils')

local function setup()
  vim.g.fzf_preview_window = {'right:50%', 'ctrl-/'}
  vim.g.fzf_layout = {
    window = {
      width = 0.8,
      height = 0.5
    }
  }
  vim.g.fzf_buffers_jump = 1

  -- common
  -- find files to edit
  utils.nnoremap('<leader>fe', [[:nohl<CR>:Files<CR>]])
  utils.nnoremap('<c-f>', [[:nohl<CR>:Rg<CR>]])

  -- utils.nnoremap('<leader>fw', [[:Windows<CR>]])
end

return {
  setup = setup
}
