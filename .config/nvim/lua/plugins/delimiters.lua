local use = require"packer".use

local function setup()
  use {"tpope/vim-surround"}

  use {
    "jiangmiao/auto-pairs",
  }
end

return {
  setup = setup
}
