local use = require"packer".use
local local_use = require"plugins/local".local_use

local function setup()
  use "tpope/vim-fugitive"

  use {
    "lewis6991/gitsigns.nvim",
    config = function()
      require "config/gitsigns".setup()
    end,
  }
  -- local_use {
  --   "gitsigns.nvim",
  --   config = function()
  --     require "config/gitsigns".setup()
  --   end,
  -- }

  use {
    "TimUntersberger/neogit",
  }

  use {
    "pwntester/octo.nvim",
    cmd = 'Octo',
  }
end

return {
  setup = setup
}
