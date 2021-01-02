local use = require"packer".use
local local_use = require"plugins/local".local_use

local function setup()
  use {
    "iamcco/markdown-preview.nvim",
    run = function()
      vim.fn["mkdp#util#install"]()
    end,
    ft = {"markdown", "vimwiki"},
    cmd = "MarkdownPreview"
  }

  use {
    "junegunn/goyo.vim",
    cmd = "Goyo"
  }

  use {"junegunn/limelight.vim", cmd = "Goyo"}

  use {
    "vimwiki/vimwiki",
    cmd = "VimwikiIndex",
    setup = function() require "config/vimwiki".setup() end,
    disable = true,
  }

  use {
    "reedes/vim-pencil",
    cmd = "Pencil"
  }

  use {
    "fiatjaf/neuron.vim",
  }

  local_use {
    "neuron.nvim",
    config = function() require"config/neuron".setup() end,
  }
end

return {
  setup = setup
}
