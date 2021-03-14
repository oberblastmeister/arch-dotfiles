local use = require"packer".use

local function setup()
  -- indent lines
  use {
    "lukas-reineke/indent-blankline.nvim",
    branch = "lua",
    disable = true,
  }

  use {
    "glepnir/galaxyline.nvim",
    branch = 'main',
    -- config = function() require"config/galaxyline/spaceline".setup() end,
    config = function() require"config/galaxyline/eviline".setup() end,
  }

  -- colorize hex codes
  use {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require "colorizer".setup()
    end,
  }
end

return {
  setup = setup
}
