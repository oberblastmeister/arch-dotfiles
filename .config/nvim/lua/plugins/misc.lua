local use = require"packer".use

local function setup()
  use {
    "liuchengxu/vim-which-key",
    config = function() require"config/whichkey".setup() end,
    disable = true,
  }

  -- smooth scrolling
  use "psliwka/vim-smoothie"

  -- visualize undotree
  use {"mbbill/undotree", cmd = "UndotreeToggle"}

  -- indent aware pasting
  -- use "sickill/vim-pasta"

  -- auto change to root dir
  use {
    "airblade/vim-rooter",
    cmd = "Rooter",
    config = function()
      require "config/rooter".setup()
    end,
    disable = true
  }

  -- repl sratchpad
  use {"metakirby5/codi.vim", cmd = "Codi"}

  -- auto nohl
  use "romainl/vim-cool"

  -- practice vim
  use {"ThePrimeagen/vim-be-good", cmd = "VimBeGood"}

  -- profile vim
  use {"dstein64/vim-startuptime", cmd = "StartupTime"}

  use {
    "mhartington/formatter.nvim",
    config = function()
      require "config/formatter".setup()
    end,
    cmd = "Format",
    disable = true,
  }

  use {
    "lukas-reineke/format.nvim",
    cmd = "Format",
    disable = true,
  }

  use {
    "romgrk/searchReplace.vim",
    cmd = "Search",
    disable = true,
  }

  use {
    "romgrk/todoist.nvim",
    run = ":TodoistInstall",
    cmd = "Todoist",
    disable = true,
  }

  -- linting when there is no lsp (for now cannot run multiple lsp servers)
  use {
    "w0rp/ale",
    ft = {"sh", "markdown"},
    cmd = "ALEEnable",
    setup = function()
      vim.g.ale_disable_lsp = 1
    end,
    config = function()
      require "config/ale".config()
      vim.cmd [[ALEDisable]]
    end,
    disable = true,
  }
end

return {
  setup = setup
}
