local telescope = require('telescope')
local pickers = require('telescope.pickers')
local api = vim.api
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

local function tree_maker(dir_name)
  if vim.fn.executable('exa') then
    return {'exa', '--level', '5', '--tree', '--color', 'always', '--group-directories-first', '--icons', dir_name}
  elseif vim.fn.executable('tree') then
    return {'tree', '-L', '5', dir_name}
  end
end

M.tree_previewer = defaulter(function(_)
  return previewers.new_termopen_previewer{
    get_command = function(entry)
      tree_maker(entry.value)
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
        -- return {'tree', '-L', '5', entry.value}
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

function M.menu(t, callback)
  pickers.new(opts, {
    prompt_title = 'Menu',
    finder = finders.new_tree {
      results = t,
    },
    sorter = conf.generic_sorter(opts),
    attach_mappings = function(prompt_bufnr)
      actions._goto_file_selection:replace(function()
        local entry = actions.get_selected_entry()
        local value = entry.value
        if value == "" then
          -- it is a leaf
          actions.close(prompt_bufnr)
          callback(entry.key)
        elseif type(value) == "table" then
          -- it is a node, recurse
          actions.close(prompt_bufnr)
          M.menu(value, callback)
          -- sometimes does not start insert for some reason
          api.nvim_input('i')
        else
          vim.cmd [[echoerr 'value must be leaf or table']]
        end
      end)

      return true
    end,
  }):find()
end

function M.test_menu()
  M.menu({
    hello = {
      dude = "",
      wow = "",
      another = "",
    },
    wothis = "",
    interstin = "",
  },
  function(value)
    print('this is a callback ', value)
  end)
end

function M.workspace_cd(opts)
  opts = opts or {}

  local results = vim.lsp.buf.list_workspace_folders()

  pickers.new(opts, {
    prompt_title = 'Workspace folders',
    finder = finders.new_table {
      results = results,
      -- entry_maker = function(entry)
      --   return {
      --     value = entry,
      --     ordinal = entry,
      --     display = entry,
      --   }
      -- end
    },
    previewer = previewers.new_termopen_previewer{
      get_command = function(entry)
        return {'exa', '--level', '3', '--tree', '--color', 'always', '--group-directories-first', '--icons', entry.value}
        -- return {'tree', '-L', '5', entry.value}
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

return M
