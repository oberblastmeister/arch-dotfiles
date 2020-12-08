local api = vim.api

local function setup()

  api.nvim_set_keymap('n', '<Space>', '<Leader>', {})
  api.nvim_set_keymap('n', [[\]], [[<LocalLeader>]], {})
  -- vim.g.mapleader = [[<Space>]]
  -- vim.g.maplocalleader = [[\]]

  api.nvim_exec([[
  inoremap jk <Esc>
  cnoremap jk <C-c>

  tnoremap <C-o> <C-\><C-n>

  function! TermWrapperStrategy(cmd)
  call v:lua.require('termwrapper').send_or_toggle(a:cmd)
  endfunction

  let g:test#custom_strategies = {'termwrapper': function('TermWrapperStrategy')}
  let g:test#strategy = 'termwrapper'
  ]], false)

  api.nvim_set_keymap('v', 'ie', ':<C-U>normal! ggVG<CR>', {silent = true, noremap = true})
  api.nvim_set_keymap('o', 'ie', '<cmd>normal vie<CR>', {})

  local utils = require('utils')

  utils.disable_distribution_plugins()

  if not os.getenv('TMUX') then
    utils.nnoremap('<C-J>', '<cmd>normal! <C-W>j<CR>')
    utils.nnoremap('<C-k>', '<cmd>normal! <C-W>k<CR>')
    utils.nnoremap('<C-l>', '<cmd>normal! <C-W>l<CR>')
    utils.nnoremap('<C-h>', '<cmd>normal! <C-W>h<CR>')
  end

  if vim.fn.has('nvim') then
    vim.cmd [[let $GIT_EDITOR = 'nvr -cc split --remote-wait']]
  end
end

return {setup = setup}
