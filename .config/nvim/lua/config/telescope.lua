local pickers = require('telescope.pickers')
local finders = require('telescope.finders')
local previewers = require('telescope.previewers')
local conf = require('telescope.config').values
local make_entry = require('telescope.make_entry')
local sorters = require('telescope.sorters')

-- local pickers = require('telescope.pickers')
local utils = require('utils')

local M = {}

function M.setup()
  -- lsp stuff
  -- utils.nnoremap('<c-t>', [[<cmd>lua require'telescope.builtin'.lsp_document_symbols{}<CR>]])
  utils.nnoremap('<leader>ft', [[<cmd>lua require'telescope.builtin'.lsp_workspace_symbols{}<CR>]])
  utils.nnoremap('<leader>fa', [[<cmd>lua require'telescope.builtin'.lsp_code_actions(require('telescope.themes').get_dropdown())<CR>]])

  -- common
  utils.nnoremap('<c-b>', [[<cmd>lua require'telescope.builtin'.buffers(require('telescope.themes').get_dropdown())<cr>]])
  utils.nnoremap('<leader>/', [[<cmd>lua require'telescope.builtin'.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown())<cr>]])

  -- treesitter
  utils.nnoremap('<leader>fT', [[<cmd>lua require'telescope.builtin'.treesitter{}<CR>]])
  utils.nnoremap('<leader>H', [[<cmd>lua require'telescope.builtin'.help_tags{}<CR>]])

  -- misc
  utils.nnoremap('<leader>fh', [[<cmd>lua require'telescope.builtin'.command_history(require('telescope.themes').get_dropdown())<CR>]])
  utils.nnoremap('<leader>fc', [[<cmd>lua require'telescope.builtin'.colorscheme(require('telescope.themes').get_dropdown())<CR>]])
  utils.nnoremap('<leader>fm', [[<cmd>lua require'telescope.builtin'.marks(require('telescope.themes').get_dropdown())<CR>]])
  utils.nnoremap('<leader>fM', [[<cmd>lua require'telescope.builtin'.man_pages(require('telescope.themes').get_dropdown())<CR>]])
  utils.nnoremap('<leader>fg', [[<cmd>lua require'telescope.builtin'.git_files{}<CR>]])
  utils.nnoremap('<leader>fu', [[<cmd>lua require'telescope.builtin'.oldfiles{}<CR>]])
  utils.nnoremap('<leader>fh', [[<cmd>lua require'telescope.builtin'.command_history(require('telescope.themes').get_dropdown())<CR>]])
  utils.nnoremap('<leader>fb', [[<cmd>lua require'telescope.builtin'.builtin(require('telescope.themes').get_dropdown())<CR>]])

  -- custom
  utils.nnoremap('<leader>.', [[<cmd>lua require'config/telescope'.dotfiles()<CR>]])
end

function M.dotfiles(opts)
  opts = opts or {}

  opts.cwd = os.getenv('HOME')

  opts.disable_devicons = true
  -- By creating the entry maker after the cwd options,
  -- we ensure the maker uses the cwd options when being created.
  opts.entry_maker = opts.entry_maker or make_entry.gen_from_file(opts)

  pickers.new(opts, {
    prompt_title = 'Dotfiles',
    finder = finders.new_oneshot_job(
      {"yadm", "ls-files"},
      opts
    ),
    previewer = previewers.cat.new(opts),
    sorter = conf.file_sorter(opts),
  }):find()
end

return M
