local use = require"packer".use

local function setup()
  use {
    "kyazdani42/nvim-tree.lua",
    config = function()
      require "config/tree".setup()
    end,
    -- only turn on when yadm is not active, prevents lagging vim
    cond = function()
      return os.getenv("GIT_DIR") ~= vim.fn.expand("~/.config/yadm/repo.git")
    end,
    disable = true,
  }

  -- terminal float for lf
  use {
    "voldikss/vim-floaterm",
    config = function()
      require "config/floaterm".setup()
    end
  }

  -- use "justinmk/vim-dirvish"
end

return {
  setup = setup
}
