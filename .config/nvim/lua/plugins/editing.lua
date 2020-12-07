local use = require"packer".use

local function setup()
  use {
    "tpope/vim-commentary",
    config = function() require"config/commentary".setup() end
  }

  use "tpope/vim-repeat"

  use "junegunn/vim-easy-align"
end

return {
  setup = setup
}
