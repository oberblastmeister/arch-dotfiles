-- Only required if you have packer in your `opt` pack
local packer_exists = pcall(vim.cmd, [[packadd packer.nvim]])

-- install packer using git
function InstallPacker()
  -- TODO: Maybe handle windows better?
  if packer_exists then
    vim.api.nvim_err_writeln("[plugins] Packer is already installed")
    return
  end

  if vim.fn.input("Download Packer? (y for yes)") ~= "y" then
    return
  end

  local directory = string.format("%s/site/pack/packer/opt/", vim.fn.stdpath("data"))

  vim.fn.mkdir(directory, "p")

  local out =
    vim.fn.system(
    string.format("git clone %s %s", "https://github.com/wbthomason/packer.nvim", directory .. "/packer.nvim")
  )

  print(out)
  print("Downloading packer.nvim...")
end

if not packer_exists then
  InstallPacker()
  return
end

local packer = nil
local function setup()

  if packer == nil then
    packer = require('packer')
    packer.init {
      disable_commands = false,
    }
  end

  local use = packer.use
  packer.reset()

  use {"wbthomason/packer.nvim", opt = true}

  require"plugins/looks".setup()
  require"plugins/colorschemes".setup()
  require"plugins/local".setup()
  require"plugins/lsp".setup()
  require"plugins/treesitter".setup()
  require"plugins/fuzzy_finding".setup()
  require"plugins/editing".setup()
  require"plugins/misc".setup()
  require"plugins/delimiters".setup()
  require"plugins/git".setup()
  require"plugins/tmux".setup()
  require"plugins/web".setup()
  require"plugins/writing".setup()
  require"plugins/language".setup()
  require"plugins/text_objects".setup()
  require"plugins/files".setup()
  require"plugins/deps".setup()
  require"plugins/debugging".setup()
  require"plugins/dispatch".setup()

  -- todo: add testing
end

return {
  setup = setup,
}
