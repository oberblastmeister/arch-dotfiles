local utils = require('utils')

utils.disable_distribution_plugins()

-- packer throws error if is not on
vim.o.termguicolors = true

-- disable python 2 support
vim.g.loaded_python_provider = 0

-- disable netrw
vim.g.loaded_netrwPlugin = 1

if not os.getenv('TMUX') then
  utils.nnoremap('<C-J>', '<cmd>normal! <C-W>j<CR>')
  utils.nnoremap('<C-k>', '<cmd>normal! <C-W>k<CR>')
  utils.nnoremap('<C-l>', '<cmd>normal! <C-W>l<CR>')
  utils.nnoremap('<C-h>', '<cmd>normal! <C-W>h<CR>')
end

if vim.fn.has('nvim') then
  vim.cmd [[let $GIT_EDITOR = 'nvr -cc split --remote-wait']]
end

require"plugins".setup()
require('utils')
