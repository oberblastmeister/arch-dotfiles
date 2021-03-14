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
local filter = vim.tbl_filter
local action_state = require('telescope.actions.state')
local state = require('telescope.state')

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
  builtin.menu {
    tree = {
      {
        "sync",
        "install",
        "update",
        "clean",
        "compile",
      },
      callback = function(selections)
        require('packer')[selections[#selections]]()
      end,
      title = 'packer'
    }
  }
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

function M.hoogle(opts)
  opts = opts or {}

  local live_hoogle = finders.new_job(function(prompt)
      -- TODO: Probably could add some options for smart case and whatever else rg offers.

      if not prompt or prompt == "" then
        return nil
      end

      return {'hoogle', 'search', prompt}
    end,
    opts.entry_maker or make_entry.gen_from_string(opts),
    opts.max_results
  )

  pickers.new(opts, {
    prompt_title = 'Live Hoogle',
    finder = live_hoogle,
    previewer = nil,
    sorter = conf.generic_sorter(opts),
  }):find()
end

local function gen_buffer_finder(opts)
  local opts = opts or {}

  local bufnrs = filter(function(b)
    if 1 ~= vim.fn.buflisted(b) then
        return false
    end
    if not opts.show_all_buffers and not vim.api.nvim_buf_is_loaded(b) then
      return false
    end
    if opts.ignore_current_buffer and b == vim.api.nvim_get_current_buf() then
      return false
    end
    return true
  end, vim.api.nvim_list_bufs())
  if not next(bufnrs) then return end

  local buffers = {}
  local default_selection_idx = 1
  for _, bufnr in ipairs(bufnrs) do
    local flag = bufnr == vim.fn.bufnr('') and '%' or (bufnr == vim.fn.bufnr('#') and '#' or ' ')

    if opts.sort_lastused and not opts.ignore_current_buffer and flag == "#" then
      default_selection_idx = 2
    end

    local element = {
      bufnr = bufnr,
      flag = flag,
      info = vim.fn.getbufinfo(bufnr)[1],
    }

    if opts.sort_lastused and (flag == "#" or flag == "%") then
      local idx = ((buffers[1] ~= nil and buffers[1].flag == "%") and 2 or 1)
      table.insert(buffers, idx, element)
    else
      table.insert(buffers, element)
    end
  end

  if not opts.bufnr_width then
    local max_bufnr = math.max(unpack(bufnrs))
    opts.bufnr_width = #tostring(max_bufnr)
  end

    return finders.new_table {
      results = buffers,
      entry_maker = opts.entry_maker or make_entry.gen_from_buffer(opts)
    }
end

local function gen_file_finder(opts)
  opts = opts or {}

  local find_command = opts.find_command
  local hidden = opts.hidden
  local follow = opts.follow
  local search_dirs = opts.search_dirs

  if search_dirs then
    for k,v in pairs(search_dirs) do
      search_dirs[k] = vim.fn.expand(v)
    end
  end

  if not find_command then
    if 1 == vim.fn.executable("fd") then
      find_command = { 'fd', '--type', 'f' }
      if hidden then table.insert(find_command, '--hidden') end
      if follow then table.insert(find_command, '-L') end
      if search_dirs then
        table.insert(find_command, '.')
        for _,v in pairs(search_dirs) do
          table.insert(find_command, v)
        end
      end
    elseif 1 == vim.fn.executable("fdfind") then
      find_command = { 'fdfind', '--type', 'f' }
      if hidden then table.insert(find_command, '--hidden') end
      if follow then table.insert(find_command, '-L') end
      if search_dirs then
        table.insert(find_command, '.')
        for _,v in pairs(search_dirs) do
          table.insert(find_command, v)
        end
      end
    elseif 1 == vim.fn.executable("rg") then
      find_command = { 'rg', '--files' }
      if hidden then table.insert(find_command, '--hidden') end
      if follow then table.insert(find_command, '-L') end
      if search_dirs then
        for _,v in pairs(search_dirs) do
          table.insert(find_command, v)
        end
      end
    elseif 1 == vim.fn.executable("find") then
      find_command = { 'find', '.', '-type', 'f' }
      if not hidden then
        table.insert(find_command, { '-not', '-path', "*/.*" })
        find_command = vim.tbl_flatten(find_command)
      end
      if follow then table.insert(find_command, '-L') end
      if search_dirs then
        table.remove(find_command, 2)
        for _,v in pairs(search_dirs) do
          table.insert(find_command, 2, v)
        end
      end
    end
  end

  if not find_command then
    print("You need to install either find, fd, or rg. " ..
          "You can also submit a PR to add support for another file finder :)")
    return
  end

  if opts.cwd then
    opts.cwd = vim.fn.expand(opts.cwd)
  end

  opts.entry_maker = opts.entry_maker or make_entry.gen_from_file(opts)

  return finders.new_oneshot_job(
    find_command,
    opts
  )
end

do
  local bufnr
  local done = false
  local start = false

  function M.buffer_files(opts)
    opts = opts or {}

    local buffer_finder = gen_buffer_finder()
    local files_finder = gen_file_finder()

    pickers.new(opts, {
      prompt_title = 'Find Buffers and Files',
      finder = buffer_finder,
      -- previewer = conf.file_previewer(opts),
      previewer = conf.grep_previewer(opts),
      sorter = conf.generic_sorter(opts),

      attach_mappings = function(prompt_bufnr, _)
        bufnr = prompt_bufnr
        return true
      end,

      on_input_filter_cb = function()
        local entry = action_state.get_selected_entry()
        if entry == nil then
          -- print(bufnr)
          -- if not done then
          --   done = true
          --   vim.defer_fn(function()
          --     print('refreshing')
          --     local current_picker = action_state.get_current_picker(bufnr)
          --     current_picker:refresh(files_finder, { reset_prompt = false })
          --   end, 2000)
          -- end
          if start then
            local current_picker = action_state.get_current_picker(bufnr)
            if current_picker then
              current_picker:refresh(buffer_finder, { reset_prompt = false })
            end
          end
          vim.defer_fn(function()
            start = true
          end, 2000)
        end
      end
    }):find()
  end
end

return M
