local api = vim.api

local function setup()
  api.nvim_set_keymap('n', '<leader>', [[<cmd>WhichKey '<Space>'<CR>]], {noremap = true, silent = true})
  local map = require"config/whichkey/info"
  vim.g.which_key_map = map
  vim.fn['which_key#register']('<Space>', 'g:which_key_map')
  return map
end

return {setup = setup}
