local use = require"packer".use

local function setup()
  use "tpope/vim-fugitive"

  -- use gitsigns.nvim instead
  use {
    "mhinz/vim-signify",
    config = function()
      require "config/signify".setup()
    end,
    disable = true
  }

  use {
    "lewis6991/gitsigns.nvim",
    config = function()
      require "config/gitsigns".setup()
    end,
    disable = true,
  }

  use {
    "TimUntersberger/neogit",
    cmd = 'Neogit',
  }

  use "pwntester/octo.nvim"
end

return {
  setup = setup
}
