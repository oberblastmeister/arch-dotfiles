local utils = require('utils')

local function setup()
  vim.g.fzf_preview_window = 'right'
  vim.g.fzf_layout = {
    window = {
      width = 0.8,
      height = 0.5
    }
  }
  vim.g.fzf_buffers_jump = 1
  vim.g.fzf_preview_window = 'right'
  vim.g.fzf_layout = {
    window = {
      width = 0.8,
      height = 0.5
    }
  }
  vim.g.fzf_buffers_jump = 1

  -- common
  utils.nnoremap('<c-p>', [[:nohl<CR>:Files<CR>]])
  utils.nnoremap('<c-f>', [[:nohl<CR>:Rg<CR>]])

  utils.nnoremap('<leader>.', [[:nohl<CR>:cd ~<CR>:Dotfiles<CR>]])
  utils.nnoremap('<leader>H', [[:nohl<CR>:Help<CR>]])
  utils.nnoremap('<leader>/', [[:nohl<CR>:BLines<CR>]])
  utils.nnoremap('<leader>?', [[:nohl<CR>:Lines<CR>]])
  utils.nnoremap('<leader>fw', [[:Windows<CR>]])
end

return {
  setup = setup
}
