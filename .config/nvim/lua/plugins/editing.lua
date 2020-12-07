local use = require"packer".use

local function setup()
  use "tpope/vim-commentary"

  use "tpope/vim-repeat"

  use "junegunn/vim-easy-align"
end

return {
  setup = setup
}
