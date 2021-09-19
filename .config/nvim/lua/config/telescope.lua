local vim = vim
local api = vim.api
local telescope = require('telescope')
local previewers = require('telescope.previewers')
local actions = require('telescope.actions')

local M = {}

function M.load_extensions()
  telescope.load_extension('fzy_native')
  -- telescope.load_extension('gh')
end

function M.setup_keymappings()
  -- general
  api.nvim_set_keymap('n', '<leader>ff', [[<cmd>lua require'telescope.builtin'.builtin(require('telescope.themes').get_dropdown())<CR>]], {noremap = true})

  -- lsp stuff
  api.nvim_set_keymap('n', '<leader>ft', [[<cmd>lua require'telescope.builtin'.lsp_document_symbols{}<CR>]], {noremap = true})
  api.nvim_set_keymap('n', '<leader>fw', [[<cmd>lua require'telescope.builtin'.lsp_dynamic_workspace_symbols{}<CR>]], {noremap = true})
  api.nvim_set_keymap('n', '<leader>a', [[<cmd>lua require'telescope.builtin'.lsp_code_actions(require('telescope.themes').get_dropdown())<CR>]], {noremap = true})
  api.nvim_set_keymap('x', '<leader>fa', [[<cmd>lua require'telescope.builtin'.lsp_code_actions(require('telescope.themes').get_dropdown())<CR>]], {noremap = true})

  -- diagnostics
  api.nvim_set_keymap('n', '<leader>fd', [[<cmd>lua require'telescope.builtin'.lsp_document_diagnostics()<CR>]], {noremap = true})
  api.nvim_set_keymap('n', '<leader>fD', [[<cmd>lua require'telescope.builtin'.lsp_workspace_diagnostics()<CR>]], {noremap = true})

  -- common
  api.nvim_set_keymap('n', '<c-p>', [[<cmd>lua require'telescope.builtin'.find_files()<cr>]], {noremap = true})
  api.nvim_set_keymap('n', '<c-b>', [[<cmd>lua require'telescope.builtin'.buffers()<cr>]], {noremap = true})
  api.nvim_set_keymap('n', '<leader>/', [[<cmd>lua require'telescope.builtin'.current_buffer_fuzzy_find()<cr>]], {noremap = true})

  -- treesitter
  api.nvim_set_keymap('n', '<leader>fT', [[<cmd>lua require'telescope.builtin'.treesitter{}<CR>]], {noremap = true})
  api.nvim_set_keymap('n', '<leader>H', [[<cmd>lua require'telescope.builtin'.help_tags{}<CR>]], {noremap = true})

  -- misc
  api.nvim_set_keymap('n', '<leader>fo', [[<cmd>lua require'telescope.builtin'.vim_options()<CR>]], {noremap = true})
  api.nvim_set_keymap('n', '<leader>fh', [[<cmd>lua require'telescope.builtin'.command_history(require('telescope.themes').get_dropdown())<CR>]], {noremap = true})
  api.nvim_set_keymap('n', '<leader>fC', [[<cmd>lua require'telescope.builtin'.colorscheme(require('telescope.themes').get_dropdown())<CR>]], {noremap = true})
  -- api.nvim_set_keymap('n', '<leader>fm', [[<cmd>lua require'telescope.builtin'.marks(require('telescope.themes').get_dropdown())<CR>]], {noremap = true})

  api.nvim_set_keymap('n', '<leader>fm', [[<cmd>lua require'telescope.builtin'.test_menu()<CR>]], {noremap = true})

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
  api.nvim_set_keymap('n', '<leader>fp', [[<cmd>lua require'config/telescope/my_builtin'.packer()<CR>]], {noremap = true})

  -- file browser
  -- api.nvim_set_keymap('n', '_', [[<cmd>lua require'telescope.builtin'.file_browser()<cr>]], {noremap = true})
  -- api.nvim_set_keymap('n', '-', [[<cmd>lua require'telescope.builtin'.file_browser { cwd = vim.fn.expand('%:p:h') }<cr>]], {noremap = true})
  vim.cmd [[nnoremap <silent> - :exe "FloatermNew lf " . expand('%:p')<CR>]]

  -- api.nvim_set_keymap("n", "<leader><leader>", "<Cmd>lua require('telescope').extensions.frecency.frecency()<CR>", {noremap = true, silent = true})

  -- api.nvim_set_keymap('i', '<C-s>', [[<cmd>Telescope symbols<CR>]], {noremap = true})
end

function M.setup()
  telescope.setup {
    defaults = {
      layout_strategy = "flex",
      sorting_strategy = "descending",
    },

    extensions = {
      fzf = {
        fuzzy = true,                    -- false will only do exact matching
        override_generic_sorter = true, -- override the generic sorter
        override_file_sorter = true,     -- override the file sorter
        case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
      }
    },
  }

  M.load_extensions()
  M.setup_keymappings()
end

return M
