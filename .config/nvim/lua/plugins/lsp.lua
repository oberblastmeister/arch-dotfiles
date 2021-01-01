local use = require"packer".use

local function setup()
  -- lsp configs
  use {
    "neovim/nvim-lspconfig",
    config = function() require "lsp_settings".setup() end
  }

  -- completion engine
  use {
    "nvim-lua/completion-nvim",
    config = function()
      require "config/completion".setup()
    end,
    requires = {
      "steelsojka/completion-buffers",
      {
        "SirVer/ultisnips",
        config = function()
          require "config/ultisnips".setup()
        end,
        disable = true,
      },
      "hrsh7th/vim-vsnip",
      "hrsh7th/vim-vsnip-integ",
    }
  }

  -- diagnostic wrapper
  use {
    "nvim-lua/diagnostic-nvim",
    config = function()
      require "config/diagnostic".setup()
    end,
    disable = true,
  }

  -- lsp inlay hints
  use {
    "tjdevries/lsp_extensions.nvim",
    config = function()
      require "config/lsp_extensions".setup()
    end,
    disable = true,
  }

  use {
    "RishabhRD/nvim-lsputils",
    config = function()
      require "config/lsp_utils".setup()
    end,
    requires = "RishabhRD/popfix",
    disable = true,
  }

  -- lsp tagbar
  use {
    "liuchengxu/vista.vim",
    cmd = "Vista",
    config = function()
      require "config/vista".setup()
    end
  }

  use {
    "aca/pylance.nvim",
    run = "./install.sh",
    disable = true,
  }
end

return {
  setup = setup,
}
