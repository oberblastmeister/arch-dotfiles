local use = require"packer".use

local function setup()
  use "tjdevries/colorbuddy.nvim"

  use {
    "gruvbox-community/gruvbox",
    config = function()
      require "config/colorscheme".setup()
    end,
  }

  -- use "rktjmp/lush.nvim"

  -- use {
  --   "npxbr/gruvbox.nvim",
  --   requires = {"rktjmp/lush.nvim"},
  --   config = function()
  --     require "config/colorscheme".setup()
  --   end
  -- }

  use {
    "sainnhe/gruvbox-material",
    setup = function()
      vim.g.gruvbox_material_palette = "mix"
    end,
    disable = true
  }

  use {
    "sainnhe/sonokai",
    disable = true,
  }
end

return {
  setup = setup
}
