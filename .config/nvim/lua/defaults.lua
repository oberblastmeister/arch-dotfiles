local api = vim.api

local function setup()

  api.nvim_exec([[
let mapleader = "\<Space>"
let maplocalleader = "\\"
]], false)

  api.nvim_exec([[
  inoremap jk <Esc>
  cnoremap jk <C-c>

  tnoremap <C-o> <C-\><C-n>
]], false)

  api.nvim_set_keymap('v', 'ie', ':<C-U>normal! ggVG<CR>', {silent = true, noremap = true})
  api.nvim_set_keymap('o', 'ie', '<cmd>normal vie<CR>', {})

  local utils = require('utils')

  utils.disable_distribution_plugins()

  -- if not os.getenv('TMUX') then
    utils.nnoremap('<C-J>', '<cmd>normal! <C-W>j<CR>')
    utils.nnoremap('<C-k>', '<cmd>normal! <C-W>k<CR>')
    utils.nnoremap('<C-l>', '<cmd>normal! <C-W>l<CR>')
    utils.nnoremap('<C-h>', '<cmd>normal! <C-W>h<CR>')
  -- end

  if vim.fn.has('nvim') then
    vim.cmd [[let $GIT_EDITOR = 'nvr -cc split --remote-wait']]
  end

  vim.cmd [[command! NeuronIndex lua require'config/neuron'.goto_index()]]
  vim.cmd [[nnoremap <leader>ni <cmd>NeuronIndex<CR>]]
end

return {setup = setup}
