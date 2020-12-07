local use = require"packer".use

local function setup()
  ----------------------------- Web Developement ---------------------------
  use {"mattn/emmet-vim", ft = {"html", "css", "javascript"}, disable = true}
  use {"alvan/vim-closetag", ft = "html", disable = true}

  use {
    "turbio/bracey.vim",
    run = "npm install --prefix server",
    ft = {"html", "css", "javascript"},
    disable = true
  }
end

return {
  setup = setup
}
