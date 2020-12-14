local use = require"packer".use

local function setup()
  use {
    "Iron-E/nvim-libmodal",
    requires = {
      "Iron-E/nvim-tabmode",
    },
  }
end

return {
  setup = setup,
}
