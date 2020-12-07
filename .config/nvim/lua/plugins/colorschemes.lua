local use = require"packer".use

local function setup()
  use "tjdevries/colorbuddy.nvim"

  use {
    "gruvbox-community/gruvbox",
    config = function()
      require "config/colorscheme".setup()
    end,
  }

  use {
    "sainnhe/gruvbox-material",
    setup = function()
      vim.g.gruvbox_material_palette = "mix"
    end
  }

  use "sainnhe/sonokai"
end

return {
  setup = setup
}
