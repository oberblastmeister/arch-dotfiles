local use = require"packer".use

local get_path
do
  local dirs = {
    "~/plugins/",
    "~/projects/"
  }

  -- return the path of the name in dirs or nil if the name is not in dirs
  local function name_in_dirs(name)
    for _, dir in ipairs(dirs) do
      if vim.fn.isdirectory(vim.fn.expand(dir .. name)) == 1 then
        return dir .. name
      end
    end
  end

  -- get the full path from the short name or return the path if the path is already full path
  get_path = function(name)
    if string.find(name, "/") == nil then
      return name_in_dirs(name)
    else
      return name
    end
  end
end

-- local use function
local function local_use(options)
  if type(options) == "table" then
    local path = get_path(options[1])
    if path == nil then
      vim.api.nvim_err_writeln(
      "[plugins] " .. options[1] .. " was not found in the directories " .. vim.inspect(dirs)
      )
      return
    end
    options[1] = path
  elseif type(options) == "string" then
    local path = get_path(options)
    options = path
  end

  use(options)
end

-- use plugin without copying it to nvim/site
local function rtp_use(options)
  if type(options) == "string" then
    local path = get_path(options)
    vim.cmd("set rtp+=" .. path)
  elseif type(options) == "table" then
    local path = get_path(options[1])
    vim.cmd("set rtp+=" .. path)

    -- call the config function
    if options["config"] ~= nil then
      options["config"]()
    end
  end
end

local function setup()
  local_use {
    "rust-analyzer.nvim"
  }

  local_use {
    "termwrapper.nvim",
    config = function() require"config/termwrapper".setup() end,
  }

  local_use {
    "test_plug.nvim"
  }

  local_use {
    "ungrammar.nvim"
  }

  -- local_use {
  --   "tree-sitter-lua"
  -- }

  -- local_use {
  --   "insta.nvim"
  -- }
end

return {
  local_use = local_use,
  setup = setup,
  rtp_use = rtp_use,
}
