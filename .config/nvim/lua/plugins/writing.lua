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

  local_use {
    "neuron.nvim",
    config = function() require"config/neuron".setup() end,
  }
end

return {
  setup = setup
}
