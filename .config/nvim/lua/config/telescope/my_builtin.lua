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
local flatten = vim.tbl_flatten
local Job = require('plenary/job')
local Node = require('telescope/builtin/menu').Node

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

  opts.disable_devicons = false

  -- By creating the entry maker after the cwd options,
  -- we ensure the maker uses the cwd options when being created.
  opts.entry_maker = opts.entry_maker or make_entry.gen_from_file(opts)

  pickers.new(opts, {
    prompt_title = 'Dotfiles',
    finder = finders.new_oneshot_job(
      {"yadm", "ls-files"},
      opts
    ),
    previewer = previewers.vim_buffer_cat.new(opts),
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

function M.cargo_search_live(opts)
  opts = opts or {}
  opts.entry_maker = opts.entry_maker or make_entry.gen_from_string(opts)

  local live_search = finders.new_job(function(prompt)
      if not prompt or prompt == "" then
        return nil
      end

      return {'cargo', 'search', prompt}
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

function M.cargo_index(opts)
  opts = opts or {}

  opts.entry_maker = opts.entry_maker or make_entry.gen_from_string(opts)

  pickers.new(opts, {
    prompt_title = 'cargo search',
    finder = finders.new_oneshot_job(
      {"crates-index", "list"},
      opts
    ),
    previewer = nil,
    sorter = conf.generic_sorter(opts),
    attach_mappings = function(prompt_bufnr)
      actions._goto_file_selection:replace(function()
        local entry = actions.get_selected_entry()
        local value = entry.value
        actions.close(prompt_bufnr)

        builtin.menu {
          t = {
            "yes",
            "no",
          },
          title = "use latest version?",
          callback = function(res)
            if res == "no" then
              M.crate_version(value)
              api.nvim_input('i')
            else
              M.latest_version(value)
            end
          end
        }
        api.nvim_input('i')
      end)

      return true
    end,
  }):find()
end

function M.crate_version(crate)
  pickers.new(opts, {
    prompt_title = 'pick version',
    finder = finders.new_oneshot_job(
    {"crates-index", "versions", crate},
    opts
    ),
    previewer = nil,
    sorter = conf.generic_sorter(opts),
    attach_mappings = function(prompt_bufnr)
      actions._goto_file_selection:replace(function()
        local entry = actions.get_selected_entry()
        actions.close(prompt_bufnr)
        api.nvim_put({string.format('%s = "%s"', crate, entry.value)}, "l", true, true)
      end)

      return true
    end
  }):find()
end

function M.latest_version(crate)
  Job:new {
    command = 'crates-index',
    args = {'latest', crate},
    on_stderr = function(_, _)
    end,
    on_stdout = vim.schedule_wrap(function(error, data)
      assert(not error, error)
      api.nvim_put({string.format('%s = "%s"', crate, data)}, "l", true, true)
    end),
    on_exit = function(_, _, _)
    end,
  }:start()
end

function M.my_fd(opts)
  opts = opts or {}

  opts.entry_maker = opts.entry_maker or make_entry.gen_from_string(opts)

  pickers.new(opts, {
    prompt_title = 'cargo search',
    finder = finders.new_oneshot_job(
      {"fd"},
      opts
    ),
    previewer = nil,
    sorter = conf.generic_sorter(opts),
  }):find()
end

function M.my_rg(opts)
  opts = opts or {}

  opts.entry_maker = opts.entry_maker or make_entry.gen_from_vimgrep(opts)

  pickers.new(opts, {
    prompt_title = 'ripgrep',
    finder = finders.new_oneshot_job(
      {
        'rg',
        '--color=never',
        '--no-heading',
        '--with-filename',
        '--line-number',
        '--column',
        '--smart-case',
        ".*",
      },

function M.cargo_search_query(opts)
  opts = opts or {}

  pickers.new(opts, {
    prompt_title = 'cargo search',
    finder = finders.new_oneshot_job(
      {"cargo", "search", opts.search},
      opts
    ),
    sorter = conf.generic_sorter(opts),
  }):find()
end

function M.packer()
  builtin.menu(Node.new_root {
    {
      "sync",
      "install",
      "update",
      "clean",
      "compile",
    },
    callback = function(selections)
      require('packer')[selections:last()]()
    end,
    title = 'packer'
  })
end

function M.yay()
  opts = opts or {}

  pickers.new(opts, {
    prompt_title = 'Yay search',
    finder = finders.new_oneshot_job(
      {"yay", "-Slq"},
      opts
    ),
    previewer = nil,
    sorter = conf.generic_sorter(opts),
    -- attach_mappings = function(prompt_bufnr)
    --   actions._goto_file_selection:replace(function()
    --     local entry = actions.get_selected_entry()
    --     actions.close(prompt_bufnr)
    --     local dir = entry[1]
    --     if dir ~= nil or dir ~= '' then
    --       vim.cmd('cd ' .. dir)
    --     end
    --   end)
    -- end
  }):find()
end

return M
