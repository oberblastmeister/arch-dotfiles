local use = require"packer".use
local local_use = require"plugins/local".local_use

local function setup()
  -- use {
  --   "nvim-treesitter/nvim-treesitter",
  --   run = function()
  --     vim.cmd [[TSInstall all]]
  --   end,
  --   config = function()
  --     require "config/treesitter".setup()
  --   end
  -- }

  local_use {
    "nvim-treesitter",
    run = function()
      vim.cmd [[TSInstall all]]
    end,
    config = function()
      require "config/treesitter".setup()
    end
  }

  use "nvim-treesitter/nvim-treesitter-refactor"

  use "nvim-treesitter/nvim-treesitter-textobjects"

  use "romgrk/nvim-treesitter-context"

  use {
    "nvim-treesitter/playground",
    cmd = "TSPlaygroundToggle"
  }

  use "nvim-treesitter/completion-treesitter"
end

return {
  setup = setup
}
