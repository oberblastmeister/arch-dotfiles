local use = require"packer".use
local local_use = require"plugins/local".local_use

local function setup()
  use {
    "nvim-treesitter/nvim-treesitter",
    run = function()
      vim.cmd [[TSInstall all]]
    end,
    config = function()
      require "config/treesitter".setup()
    end
  }

  -- local_use {
  --   "nvim-treesitter",
  --   run = function()
  --     vim.cmd [[TSInstall all]]
  --   end,
  --   config = function()
  --     require "config/treesitter".setup()
  --   end
  -- }

  use "nvim-treesitter/nvim-treesitter-refactor"

  use "nvim-treesitter/nvim-treesitter-textobjects"

  -- use "romgrk/nvim-treesitter-context"
  local_use {
    "nvim-treesitter-context",
    disable = true,
  }

  use {
    "nvim-treesitter/playground",
    cmd = "TSPlaygroundToggle"
  }

  -- use "theHamsta/nvim-treesitter-pairs"

  -- use "lewis6991/spellsitter.nvim"
end

return {
  setup = setup
}
