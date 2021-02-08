local use = require"packer".use

local function setup()
  use {
    "machakann/vim-sandwich",
    config = function()
      require "config/sandwhich".setup()
    end,
    disable = true,
  }

  use {"tpope/vim-surround"}

  use {
    "jiangmiao/auto-pairs",
    -- disable = true,
  }

  use {
    "windwp/nvim-autopairs",
    config = function()
      require('nvim-autopairs').setup()
    end,
    disable = true,
  }

  use {
    "andymass/vim-matchup",
    config = function()
      require "config/matchup".setup()
    end,
    disable = true,
  }
end

return {
  setup = setup
}
