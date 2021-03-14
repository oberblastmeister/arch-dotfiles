local use = require"packer".use

local function setup()
  use "tpope/vim-fugitive"

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

  use {"pwntester/octo.nvim", disable = true}
end

return {
  setup = setup
}
