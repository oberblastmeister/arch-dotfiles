local use = require"packer".use

local function setup()
  use "liuchengxu/vim-which-key"

  -- indent lines
  use {
    "Yggdroot/indentLine",
    config = function() require'config/indent_line'.setup() end
  }

  use {
    "lukas-reineke/indent-blankline.nvim",
    branch = "lua",
  }

  use {
    "romgrk/barbar.nvim",
    cond = function()
      return vim.fn.exists('g:started_by_firenvim') == 0
    end,
  }

  use {
    "tjdevries/express_line.nvim",
    config = function()
      require "config/express_line".start()
    end,
    disable = true,
  }

  use {
    'glepnir/galaxyline.nvim',
    branch = 'main',
    -- config = function() require"config/galaxyline/spaceline".setup() end,
    config = function() require"config/galaxyline/eviline".setup() end,
  }

  -- colorize hex codes
  use {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require "colorizer".setup()
    end
  }
end

return {
  setup = setup
}
