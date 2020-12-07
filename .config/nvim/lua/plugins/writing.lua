local use = require"packer".use

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
  }

  use {
    "reedes/vim-pencil",
    cmd = "Pencil"
  }
end

return {
  setup = setup
}
