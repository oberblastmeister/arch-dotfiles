local use = require"packer".use

local function setup()
  use {
    "machakann/vim-sandwich",
    config = function()
      require "config/sandwhich".setup()
    end
  }

  use {
    "jiangmiao/auto-pairs",
    disable = false,
  }

  use {
    "andymass/vim-matchup",
    config = function()
      require "config/matchup".setup()
    end
  }
end

return {
  setup = setup
}
