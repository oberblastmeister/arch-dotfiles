local local_use = require"plugins/local".local_use
local use = require"packer".use

local function setup()
  -- lsp configs
  use {
    "neovim/nvim-lspconfig",
    config = function() require "lsp_settings".setup() end
  }

  use {
    "kosayoda/nvim-lightbulb",
    config = function()
      vim.cmd [[autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()]]
    end
  }

  -- local_use {
  --   "rofl.nvim",
  -- }

  use {
    "ms-jpq/kok.nvim",
    config = function()
      require("kok/recommends").all()
      -- vim.cmd [[autocmd InsertEnter * ++once KoKstart]]
    end,
    disable = true,
  }

  local_use {
    "project.nvim",
    config = function()
      require'config/project'.setup()
    end
  }

  use {
    "hrsh7th/nvim-compe",
    config = function()
      require"config/compe".setup()
    end,
  }

  use {
    "hrsh7th/vim-vsnip",
  }

  -- use {
  --   "norcalli/snippets.nvim",
  --   config = function() require"config/snippets".setup() end,
  -- }

  -- lsp inlay hints
  use {
    "tjdevries/lsp_extensions.nvim",
    config = function()
      require "config/lsp_extensions".setup()
    end,
    disable = true,
  }
end

return {
  setup = setup,
}
