local use = require("packer").use

local function setup()
  use "vim-test/vim-test"

  use {
    "tpope/vim-dispatch",
    cmd = {'Dispatch', 'Make', 'Focus', 'Start'},
  }
end

return {
  setup = setup
}
