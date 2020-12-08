local vim = vim
local api = vim.api
local telescope = require('telescope')

local M = {}

function M.load_extensions()
  telescope.load_extension('fzy_native')
  telescope.load_extension('ghcli')
end

function M.setup_keymappings()
  -- general
  api.nvim_set_keymap('n', '<leader>ff', [[<cmd>lua require'telescope.builtin'.builtin(require('telescope.themes').get_dropdown())<CR>]], {noremap = true})

  -- lsp stuff
  api.nvim_set_keymap('n', '<leader>ft', [[<cmd>lua require'telescope.builtin'.lsp_document_symbols{}<CR>]], {noremap = true})
  api.nvim_set_keymap('n', '<leader>fw', [[<cmd>lua require'telescope.builtin'.lsp_workspace_symbols{}<CR>]], {noremap = true})
  api.nvim_set_keymap('n', '<leader>fa', [[<cmd>lua require'telescope.builtin'.lsp_code_actions(require('telescope.themes').get_dropdown())<CR>]], {noremap = true})

  -- common
  api.nvim_set_keymap('n', '<c-b>', [[<cmd>lua require'telescope.builtin'.buffers()<cr>]], {noremap = true})
  api.nvim_set_keymap('n', '<leader>/', [[<cmd>lua require'telescope.builtin'.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown())<cr>]], {noremap = true})

  -- treesitter
  api.nvim_set_keymap('n', '<leader>fT', [[<cmd>lua require'telescope.builtin'.treesitter{}<CR>]], {noremap = true})
  api.nvim_set_keymap('n', '<leader>H', [[<cmd>lua require'telescope.builtin'.help_tags{}<CR>]], {noremap = true})

  -- misc
  api.nvim_set_keymap('n', '<leader>fo', [[<cmd>lua require'telescope.builtin'.vim_options()<CR>]], {noremap = true})
  api.nvim_set_keymap('n', '<leader>fh', [[<cmd>lua require'telescope.builtin'.command_history(require('telescope.themes').get_dropdown())<CR>]], {noremap = true})
  api.nvim_set_keymap('n', '<leader>fC', [[<cmd>lua require'telescope.builtin'.colorscheme(require('telescope.themes').get_dropdown())<CR>]], {noremap = true})
  api.nvim_set_keymap('n', '<leader>fm', [[<cmd>lua require'telescope.builtin'.marks(require('telescope.themes').get_dropdown())<CR>]], {noremap = true})
  api.nvim_set_keymap('n', '<leader>fM', [[<cmd>lua require'telescope.builtin'.man_pages(require('telescope.themes').get_dropdown())<CR>]], {noremap = true})
  api.nvim_set_keymap('n', '<leader>fg', [[<cmd>lua require'telescope.builtin'.git_files{}<CR>]], {noremap = true})
  api.nvim_set_keymap('n', '<leader>fu', [[<cmd>lua require'telescope.builtin'.oldfiles{}<CR>]], {noremap = true})
  api.nvim_set_keymap('n', '<leader>;', [[<cmd>lua require'telescope.builtin'.commands(require('telescope.themes').get_dropdown())<CR>]], {noremap = true})

  -- git
  api.nvim_set_keymap('n', '<leader>fs', [[<cmd>lua require'telescope.builtin'.git_status{}<CR>]], {noremap = true})
  api.nvim_set_keymap('n', '<leader>fb', [[<cmd>lua require'telescope.builtin'.git_branches{}<CR>]], {noremap = true})
  api.nvim_set_keymap('n', '<leader>fc', [[<cmd>lua require'telescope.builtin'.git_commits{}<CR>]], {noremap = true})

  -- custom
  api.nvim_set_keymap('n', '<leader>.', [[<cmd>lua require'config/telescope/my_builtin'.dotfiles()<CR>]], {noremap = true})

  api.nvim_set_keymap('n', '<leader>cd', [[<cmd>lua require'config/telescope/my_builtin'.cd()<CR>]], {noremap = true})
  api.nvim_set_keymap('n', '<leader>`', [[<cmd>cd ~<CR><cmd>echo 'cd ~'<CR>]], {noremap = true})
  api.nvim_set_keymap('n', '<leader>c.', [[<cmd>cd ..<CR><cmd>pwd<CR>]], {noremap = true})
end

function M.setup()
  telescope.setup()
  M.load_extensions()
  M.setup_keymappings()
end

return M
