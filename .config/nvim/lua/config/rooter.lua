local rooter = require("rooter")
local function setup()
  rooter.set_config {
    echo = false,
  }
  rooter.setup()
end

return {
  setup = setup
}
