local use = require"packer".use

local function setup()
  use {"tpope/vim-surround"}

  use {
    "jiangmiao/auto-pairs",
    disable = true,
  }

  use {
    "steelsojka/pears.nvim",
    config = function()
      require"config/pears".setup()
    end
  }
end

return {
  setup = setup
}
