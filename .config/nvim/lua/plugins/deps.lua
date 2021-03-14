local use = require("packer").use
local local_use = require("plugins/local").local_use

local function setup()
  -- use "nvim-lua/plenary.nvim"
  local_use "plenary.nvim"
  -- use "nvim-lua/plenary.nvim"

  use "nvim-lua/popup.nvim"

  -- icons
  use "kyazdani42/nvim-web-devicons"
end

return {
  setup = setup,
}
