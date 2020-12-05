local telescope = require('telescope')
local pickers = require('telescope.pickers')
local finders = require('telescope.finders')
local previewers = require('telescope.previewers')
local conf = require('telescope.config').values
local make_entry = require('telescope.make_entry')
local sorters = require('telescope.sorters')
local tutils = require('telescope/utils')
local utils = require('utils')
local actions = require('telescope.actions')
local from_entry = require('telescope/from_entry')
local defaulter = tutils.make_default_callable
local builtin = require('telescope/builtin')

local M = {}

function M.setup()
  telescope.setup()
  telescope.load_extension('fzy_native')
  telescope.load_extension('ghcli')
  -- require('telescope').setup{
  --   prompt_prefix = "dude"
  -- }
  -- telescope.setup {
  --   set_env = { ['COLORTERM'] = 'truecolor' },
  --   prmopt_prefix = "this is a prefix",
  -- }

  -- dropdown_theme = require('telescope.themes').get_dropdown({
  --   results_height = 20;
  --   winblend = 20;
  --   width = 0.8;
  --   prompt_title = '';
  --   prompt_prefix = 'Files>';
  --   previewer = false;
  -- })

  -- general
  utils.nnoremap('<leader>ff', [[<cmd>lua require'telescope.builtin'.builtin(require('telescope.themes').get_dropdown())<CR>]])

  -- lsp stuff
  utils.nnoremap('<C-t>', [[<cmd>lua require'telescope.builtin'.lsp_document_symbols{}<CR>]])
  utils.nnoremap('<leader>fw', [[<cmd>lua require'telescope.builtin'.lsp_workspace_symbols{}<CR>]])
  utils.nnoremap('<leader>fa', [[<cmd>lua require'telescope.builtin'.lsp_code_actions(require('telescope.themes').get_dropdown())<CR>]])

  -- common
  utils.nnoremap('<c-b>', [[<cmd>lua require'telescope.builtin'.buffers()<cr>]])
  utils.nnoremap('<leader>/', [[<cmd>lua require'telescope.builtin'.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown())<cr>]])

  -- treesitter
  utils.nnoremap('<leader>ft', [[<cmd>lua require'telescope.builtin'.treesitter{}<CR>]])
  utils.nnoremap('<leader>H', [[<cmd>lua require'telescope.builtin'.help_tags{}<CR>]])

  -- misc
  utils.nnoremap('<leader>fo', [[<cmd>lua require'telescope.builtin'.vim_options()<CR>]])
  utils.nnoremap('<leader>fh', [[<cmd>lua require'telescope.builtin'.command_history(require('telescope.themes').get_dropdown())<CR>]])
  utils.nnoremap('<leader>fC', [[<cmd>lua require'telescope.builtin'.colorscheme(require('telescope.themes').get_dropdown())<CR>]])
  utils.nnoremap('<leader>fm', [[<cmd>lua require'telescope.builtin'.marks(require('telescope.themes').get_dropdown())<CR>]])
  utils.nnoremap('<leader>fM', [[<cmd>lua require'telescope.builtin'.man_pages(require('telescope.themes').get_dropdown())<CR>]])
  utils.nnoremap('<leader>fg', [[<cmd>lua require'telescope.builtin'.git_files{}<CR>]])
  utils.nnoremap('<leader>fu', [[<cmd>lua require'telescope.builtin'.oldfiles{}<CR>]])
  utils.nnoremap('<leader>;', [[<cmd>lua require'telescope.builtin'.commands(require('telescope.themes').get_dropdown())<CR>]])

  -- git
  utils.nnoremap('<leader>fs', [[<cmd>lua require'telescope.builtin'.git_status{}<CR>]])
  utils.nnoremap('<leader>fb', [[<cmd>lua require'telescope.builtin'.git_branches{}<CR>]])
  utils.nnoremap('<leader>fc', [[<cmd>lua require'telescope.builtin'.git_commits{}<CR>]])

  -- custom
  utils.nnoremap('<leader>.', [[<cmd>lua require'config/telescope'.dotfiles()<CR>]])

  utils.nnoremap('<leader>cd', [[<cmd>lua require'config/telescope'.cd()<CR>]])
  utils.nnoremap('<leader>`', [[<cmd>cd ~<CR><cmd>echo 'cd ~'<CR>]])
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

function M.cargo_search(opts)
  opts = opts or {}
  opts.entry_maker = opts.entry_maker or make_entry.gen_from_quickfix(opts)

  local live_search = finders.new_job(function(prompt)
      return {'cargo', 'search'}
    end,
    opts.entry_maker,
    opts.max_results
  )

  pickers.new(opts, {
    prompt_title = 'Live cargo search',
    finder = live_search,
    previewer = nil,
    sorter = conf.generic_sorter(opts),
  }):find()
end

local tree_previewer = defaulter(function(_)
  return previewers.new_termopen_previewer {
    get_command = function(entry)
      local path = from_entry.path(entry, true)
      if path == nil then return end
      return {'echo', 'hello'}
      -- return {'exa', '--level', '3', '--tree', '--color', 'always', '--group-directories-first', '--icons', path}
    end
  }
end, {})

function M.cd(opts)
  opts = opts or {}

  local find_command = opts.find_command or {"fd", "--type", "directory"}

  if not find_command then
    print("You need to install either find, fd, or rg. You can also submit a PR to add support for another file finder :)")
    return
  end

  if opts.cwd then
    opts.cwd = vim.fn.expand(opts.cwd)
  end

  opts.disable_devicons = true
  opts.entry_maker = opts.entry_maker or make_entry.gen_from_file(opts)

  pickers.new(opts, {
    prompt_title = 'cd',
    finder = finders.new_oneshot_job(
      find_command,
      opts
    ),
    previewer = previewers.new_termopen_previewer{
      get_command = function(entry)
        return {'exa', '--level', '3', '--tree', '--color', 'always', '--group-directories-first', '--icons', entry.value}
      end
    },
    sorter = conf.file_sorter(opts),
    attach_mappings = function(prompt_bufnr)
      actions._goto_file_selection:replace(function()
        local entry = actions.get_selected_entry()
        actions.close(prompt_bufnr)
        local dir = entry[1]
        if dir ~= nil or dir ~= '' then
          vim.cmd('cd ' .. dir)
        end
      end)

      return true
    end,
  }):find()
end

return M
