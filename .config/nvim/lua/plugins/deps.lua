local use = require("packer").use

local function setup()
  use "nvim-lua/plenary.nvim"
  use "nvim-lua/popup.nvim"

  -- icons
  use "kyazdani42/nvim-web-devicons"

  use "ryanoasis/vim-devicons"
end

return {
  setup = setup,
}
