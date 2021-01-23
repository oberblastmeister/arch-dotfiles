local local_use = require"plugins/local".local_use
local use = require"packer".use

local function setup()
  -- lsp configs
  use {
    "neovim/nvim-lspconfig",
    config = function() require "lsp_settings".setup() end
  }

  -- completion engine
  local_use {
    "completion-nvim",
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
    },
  }

  -- use {
  --   "nvim-lua/completion-nvim",
  --   config = function()
  --     require "config/completion".setup()
  --   end,
  --   requires = {
  --     "steelsojka/completion-buffers",
  --     {
  --       "SirVer/ultisnips",
  --       config = function()
  --         require "config/ultisnips".setup()
  --       end,
  --       disable = true,
  --     },
  --     "hrsh7th/vim-vsnip",
  --     "hrsh7th/vim-vsnip-integ",
  --   },
  -- }

  use {
    "hrsh7th/nvim-compe",
    config = function()
      require'compe'.setup {
        enabled = true,
        debug = false,
        preselect = 'always',
        -- throttle_time = 40,
        -- source_timeout = ... number ...;
        incomplete_delay = 60,
        allow_prefix_unmatch = false,

        source = {
          path = true,
          buffer = true,
          vsnip = true,
          nvim_lsp = true,
        };
      };
      vim.cmd [[inoremap <silent><expr> <Tab> compe#confirm('<Tab>')]]
    end,
    requires = {
      "hrsh7th/vim-vsnip",
      "hrsh7th/vim-vsnip-integ",
    },
    disable = true,
  }

  -- use {
  --   "norcalli/snippets.nvim",
  --   config = function() require"config/snippets".setup() end,
  -- }

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

  -- use {
  --   "RishabhRD/nvim-lsputils",
  --   config = function()
  --     require "config/lsp_utils".setup()
  --   end,
  --   requires = "RishabhRD/popfix",
  --   disable = true,
  -- }

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
