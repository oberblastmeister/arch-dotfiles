local use = require"packer".use

local function setup()
  use {
    "christoomey/vim-tmux-navigator",
    cond = function()
      return os.getenv("TMUX") ~= nil
    end
  }

  use {
    "benmills/vimux",
    cond = function()
      return os.getenv("TMUX") ~= nil
    end,
    config = function()
      require "config/vimux".setup()
    end
  }
end

return {
  setup = setup
}
