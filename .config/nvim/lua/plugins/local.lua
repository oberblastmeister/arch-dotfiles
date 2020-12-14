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
  local path = get_path(options[1])
  if path == nil then
    vim.api.nvim_err_writeln(
    "[plugins] " .. options[1] .. " was not found in the directories " .. vim.inspect(dirs)
    )
    return
  end
  options[1] = path

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
    "rooter.nvim",
    config = function()
      require "config/rooter".setup()
    end
  }

  local_use {
    "telescope.nvim",
    config = function()
      require "config/telescope".setup()
    end,
    requires = {
      "nvim-telescope/telescope-symbols.nvim",
      "nvim-telescope/telescope-fzy-native.nvim",
      "nvim-telescope/telescope-github.nvim",
      "nvim-telescope/telescope-packer.nvim",
      "nvim-telescope/telescope-fzf-writer.nvim",
      "nvim-telescope/telescope-vimspector.nvim",
    },
  }


  local_use {
    "termwrapper.nvim",
    config = function() require"config/termwrapper".setup() end,
  }

  local_use {
    "pandoc.nvim"
  }

  local_use {
    "autopairs.nvim",
    -- config = function() require'config/autopairs'.setup() end,
    disable = true,
  }
  
  local_use {
    "windowmode.nvim",
  }
end

return {
  local_use = local_use,
  setup = setup,
  rtp_use = rtp_use,
}
