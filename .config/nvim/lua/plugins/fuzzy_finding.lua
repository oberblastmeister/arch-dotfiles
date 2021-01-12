local use = require"packer".use
local local_use = require"plugins/local".local_use

local function setup()
  local_use {
    "telescope.nvim",
    config = function()
      require "config/telescope".setup()
    end,
    requires = {
      "nvim-telescope/telescope-symbols.nvim",
      "nvim-telescope/telescope-fzy-native.nvim",
      "nvim-telescope/telescope-github.nvim",
      "nvim-telescope/telescope-packer.nvim",
      "nvim-telescope/telescope-fzf-writer.nvim",
      "nvim-telescope/telescope-vimspector.nvim",
    },
  }

  use {
    "Yggdroot/LeaderF",
    run = ':LeaderfInstallCExtension',
    disable = true,
  }

  -- use "RishabhRD/nvim-finder"
  -- use "RishabhRD/popfix"

  use {
    "junegunn/fzf.vim",
    requires = {
      "junegunn/fzf",
      run = function()
        vim.fn["fzf#install()"]()
      end
    },
    config = function()
      require "config/fzf".setup()
    end
  }

  use {'lotabout/skim.vim', disable = true}
end

return {
  setup = setup
}
