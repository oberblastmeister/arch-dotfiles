" Automatically generated packer.nvim plugin loader code

if !has('nvim-0.5')
  echohl WarningMsg
  echom "Invalid Neovim version for packer.nvim!"
  echohl None
  finish
endif

packadd packer.nvim

try

lua << END
local package_path_str = "/home/brian/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/brian/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/brian/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/brian/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/brian/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    print('Error running ' .. component .. ' for ' .. name)
    error(result)
  end
  return result
end

_G.packer_plugins = {
  ["BetterLua.vim"] = {
    loaded = false,
    path = "/home/brian/.local/share/nvim/site/pack/packer/opt/BetterLua.vim"
  },
  aniseed = {
    loaded = true,
    path = "/home/brian/.local/share/nvim/site/pack/packer/start/aniseed"
  },
  ["auto-pairs"] = {
    loaded = true,
    path = "/home/brian/.local/share/nvim/site/pack/packer/start/auto-pairs"
  },
  ["co_executor.nvim"] = {
    loaded = true,
    path = "/home/brian/.local/share/nvim/site/pack/packer/start/co_executor.nvim"
  },
  ["codi.vim"] = {
    commands = { "Codi" },
    loaded = false,
    path = "/home/brian/.local/share/nvim/site/pack/packer/opt/codi.vim"
  },
  ["colorbuddy.nvim"] = {
    loaded = true,
    path = "/home/brian/.local/share/nvim/site/pack/packer/start/colorbuddy.nvim"
  },
  ["completion-treesitter"] = {
    loaded = true,
    path = "/home/brian/.local/share/nvim/site/pack/packer/start/completion-treesitter"
  },
  conjure = {
    loaded = false,
    path = "/home/brian/.local/share/nvim/site/pack/packer/opt/conjure"
  },
  firenvim = {
    loaded = true,
    path = "/home/brian/.local/share/nvim/site/pack/packer/start/firenvim"
  },
  fzf = {
    loaded = true,
    path = "/home/brian/.local/share/nvim/site/pack/packer/start/fzf"
  },
  ["fzf.vim"] = {
    config = { "\27LJ\2\n8\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\15config/fzf\frequire\0" },
    loaded = true,
    path = "/home/brian/.local/share/nvim/site/pack/packer/start/fzf.vim"
  },
  ["galaxyline.nvim"] = {
    config = { "\27LJ\2\nG\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\30config/galaxyline/eviline\frequire\0" },
    loaded = true,
    path = "/home/brian/.local/share/nvim/site/pack/packer/start/galaxyline.nvim"
  },
  ["goyo.vim"] = {
    commands = { "Goyo" },
    loaded = false,
    path = "/home/brian/.local/share/nvim/site/pack/packer/opt/goyo.vim"
  },
  gruvbox = {
    config = { "\27LJ\2\n@\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\23config/colorscheme\frequire\0" },
    loaded = true,
    path = "/home/brian/.local/share/nvim/site/pack/packer/start/gruvbox"
  },
  ["gruvbox-material"] = {
    loaded = false,
    path = "/home/brian/.local/share/nvim/site/pack/packer/opt/gruvbox-material"
  },
  ["haskell-vim"] = {
    loaded = false,
    path = "/home/brian/.local/share/nvim/site/pack/packer/opt/haskell-vim"
  },
  ["indent-blankline.nvim"] = {
    loaded = true,
    path = "/home/brian/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim"
  },
  indentLine = {
    config = { "\27LJ\2\n@\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\23config/indent_line\frequire\0" },
    loaded = true,
    path = "/home/brian/.local/share/nvim/site/pack/packer/start/indentLine"
  },
  ["lalrpop.vim"] = {
    loaded = true,
    path = "/home/brian/.local/share/nvim/site/pack/packer/start/lalrpop.vim"
  },
  ["limelight.vim"] = {
    commands = { "Goyo" },
    loaded = false,
    path = "/home/brian/.local/share/nvim/site/pack/packer/opt/limelight.vim"
  },
  ["markdown-preview.nvim"] = {
    commands = { "MarkdownPreview" },
    loaded = false,
    path = "/home/brian/.local/share/nvim/site/pack/packer/opt/markdown-preview.nvim"
  },
  neogit = {
    commands = { "Neogit" },
    config = { "\27LJ\2\nG\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0(nnoremap <leader>gs <cmd>Neogit<CR>\bcmd\bvim\0" },
    loaded = false,
    path = "/home/brian/.local/share/nvim/site/pack/packer/opt/neogit"
  },
  ["neuron.nvim"] = {
    config = { "\27LJ\2\n;\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\18config/neuron\frequire\0" },
    loaded = true,
    path = "/home/brian/.local/share/nvim/site/pack/packer/start/neuron.nvim"
  },
  ["nlua.nvim"] = {
    loaded = true,
    path = "/home/brian/.local/share/nvim/site/pack/packer/start/nlua.nvim"
  },
  ["nvim-colorizer.lua"] = {
    config = { "\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14colorizer\frequire\0" },
    loaded = true,
    path = "/home/brian/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua"
  },
  ["nvim-compe"] = {
    config = { "\27LJ\2\n:\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\17config/compe\frequire\0" },
    loaded = true,
    path = "/home/brian/.local/share/nvim/site/pack/packer/start/nvim-compe"
  },
  ["nvim-dap"] = {
    config = { "\27LJ\2\n8\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\15config/dap\frequire\0" },
    loaded = true,
    path = "/home/brian/.local/share/nvim/site/pack/packer/start/nvim-dap"
  },
  ["nvim-dap-python"] = {
    loaded = true,
    path = "/home/brian/.local/share/nvim/site/pack/packer/start/nvim-dap-python"
  },
  ["nvim-dap-virtual-text"] = {
    loaded = true,
    path = "/home/brian/.local/share/nvim/site/pack/packer/start/nvim-dap-virtual-text"
  },
  ["nvim-libmodal"] = {
    loaded = true,
    path = "/home/brian/.local/share/nvim/site/pack/packer/start/nvim-libmodal"
  },
  ["nvim-lightbulb"] = {
    config = { "\27LJ\2\ns\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0Tautocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()\bcmd\bvim\0" },
    loaded = true,
    path = "/home/brian/.local/share/nvim/site/pack/packer/start/nvim-lightbulb"
  },
  ["nvim-lspconfig"] = {
    config = { "\27LJ\2\n:\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\17lsp_settings\frequire\0" },
    loaded = true,
    path = "/home/brian/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-luapad"] = {
    commands = { "LuaRun", "Lua", "Luapad" },
    loaded = false,
    path = "/home/brian/.local/share/nvim/site/pack/packer/opt/nvim-luapad"
  },
  ["nvim-tabmode"] = {
    loaded = true,
    path = "/home/brian/.local/share/nvim/site/pack/packer/start/nvim-tabmode"
  },
  ["nvim-tree.lua"] = {
    config = { "\27LJ\2\n9\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\16config/tree\frequire\0" },
    loaded = false,
    path = "/home/brian/.local/share/nvim/site/pack/packer/opt/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\n?\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\22config/treesitter\frequire\0" },
    loaded = true,
    path = "/home/brian/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-treesitter-refactor"] = {
    loaded = true,
    path = "/home/brian/.local/share/nvim/site/pack/packer/start/nvim-treesitter-refactor"
  },
  ["nvim-treesitter-textobjects"] = {
    loaded = true,
    path = "/home/brian/.local/share/nvim/site/pack/packer/start/nvim-treesitter-textobjects"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/brian/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = false,
    path = "/home/brian/.local/share/nvim/site/pack/packer/opt/packer.nvim"
  },
  ["pandoc.nvim"] = {
    loaded = true,
    path = "/home/brian/.local/share/nvim/site/pack/packer/start/pandoc.nvim"
  },
  ["pest.vim"] = {
    loaded = true,
    path = "/home/brian/.local/share/nvim/site/pack/packer/start/pest.vim"
  },
  playground = {
    commands = { "TSPlaygroundToggle" },
    loaded = false,
    path = "/home/brian/.local/share/nvim/site/pack/packer/opt/playground"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/brian/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/home/brian/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  ["repl.nvim"] = {
    loaded = true,
    path = "/home/brian/.local/share/nvim/site/pack/packer/start/repl.nvim"
  },
  ["rofl.nvim"] = {
    loaded = true,
    path = "/home/brian/.local/share/nvim/site/pack/packer/start/rofl.nvim"
  },
  ["rooter.nvim"] = {
    config = { "\27LJ\2\n;\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\18config/rooter\frequire\0" },
    loaded = true,
    path = "/home/brian/.local/share/nvim/site/pack/packer/start/rooter.nvim"
  },
  sonokai = {
    loaded = true,
    path = "/home/brian/.local/share/nvim/site/pack/packer/start/sonokai"
  },
  ["sql.nvim"] = {
    loaded = true,
    path = "/home/brian/.local/share/nvim/site/pack/packer/start/sql.nvim"
  },
  ["targets.vim"] = {
    loaded = true,
    path = "/home/brian/.local/share/nvim/site/pack/packer/start/targets.vim"
  },
  ["telescope-cheat.nvim"] = {
    config = { "\27LJ\2\nJ\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\ncheat\19load_extension\14telescope\frequire\0" },
    loaded = true,
    path = "/home/brian/.local/share/nvim/site/pack/packer/start/telescope-cheat.nvim"
  },
  ["telescope-dap.nvim"] = {
    loaded = true,
    path = "/home/brian/.local/share/nvim/site/pack/packer/start/telescope-dap.nvim"
  },
  ["telescope-frecency.nvim"] = {
    config = { "\27LJ\2\n=\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\20config/frecency\frequire\0" },
    loaded = true,
    path = "/home/brian/.local/share/nvim/site/pack/packer/start/telescope-frecency.nvim"
  },
  ["telescope-fzf-writer.nvim"] = {
    loaded = true,
    path = "/home/brian/.local/share/nvim/site/pack/packer/start/telescope-fzf-writer.nvim"
  },
  ["telescope-fzy-native.nvim"] = {
    loaded = true,
    path = "/home/brian/.local/share/nvim/site/pack/packer/start/telescope-fzy-native.nvim"
  },
  ["telescope-github.nvim"] = {
    loaded = true,
    path = "/home/brian/.local/share/nvim/site/pack/packer/start/telescope-github.nvim"
  },
  ["telescope-media-files.nvim"] = {
    config = { "\27LJ\2\nJ\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\ncheat\19load_extension\14telescope\frequire\0" },
    loaded = true,
    path = "/home/brian/.local/share/nvim/site/pack/packer/start/telescope-media-files.nvim"
  },
  ["telescope-packer.nvim"] = {
    loaded = true,
    path = "/home/brian/.local/share/nvim/site/pack/packer/start/telescope-packer.nvim"
  },
  ["telescope-symbols.nvim"] = {
    loaded = true,
    path = "/home/brian/.local/share/nvim/site/pack/packer/start/telescope-symbols.nvim"
  },
  ["telescope-vimspector.nvim"] = {
    loaded = true,
    path = "/home/brian/.local/share/nvim/site/pack/packer/start/telescope-vimspector.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\n>\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\21config/telescope\frequire\0" },
    loaded = true,
    path = "/home/brian/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  ["termwrapper.nvim"] = {
    config = { "\27LJ\2\n@\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\23config/termwrapper\frequire\0" },
    loaded = true,
    path = "/home/brian/.local/share/nvim/site/pack/packer/start/termwrapper.nvim"
  },
  undotree = {
    commands = { "UndotreeToggle" },
    loaded = false,
    path = "/home/brian/.local/share/nvim/site/pack/packer/opt/undotree"
  },
  ["vim-be-good"] = {
    commands = { "VimBeGood" },
    loaded = false,
    path = "/home/brian/.local/share/nvim/site/pack/packer/opt/vim-be-good"
  },
  ["vim-commentary"] = {
    config = { "\27LJ\2\n?\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\22config/commentary\frequire\0" },
    loaded = true,
    path = "/home/brian/.local/share/nvim/site/pack/packer/start/vim-commentary"
  },
  ["vim-cool"] = {
    loaded = true,
    path = "/home/brian/.local/share/nvim/site/pack/packer/start/vim-cool"
  },
  ["vim-devicons"] = {
    loaded = true,
    path = "/home/brian/.local/share/nvim/site/pack/packer/start/vim-devicons"
  },
  ["vim-dispatch"] = {
    commands = { "Dispatch", "Make", "Focus", "Start" },
    loaded = false,
    path = "/home/brian/.local/share/nvim/site/pack/packer/opt/vim-dispatch"
  },
  ["vim-easy-align"] = {
    loaded = true,
    path = "/home/brian/.local/share/nvim/site/pack/packer/start/vim-easy-align"
  },
  ["vim-floaterm"] = {
    config = { "\27LJ\2\n=\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\20config/floaterm\frequire\0" },
    loaded = true,
    path = "/home/brian/.local/share/nvim/site/pack/packer/start/vim-floaterm"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/home/brian/.local/share/nvim/site/pack/packer/start/vim-fugitive"
  },
  ["vim-markdown"] = {
    loaded = false,
    path = "/home/brian/.local/share/nvim/site/pack/packer/opt/vim-markdown"
  },
  ["vim-pencil"] = {
    commands = { "Pencil" },
    loaded = false,
    path = "/home/brian/.local/share/nvim/site/pack/packer/opt/vim-pencil"
  },
  ["vim-polyglot"] = {
    loaded = false,
    path = "/home/brian/.local/share/nvim/site/pack/packer/opt/vim-polyglot"
  },
  ["vim-repeat"] = {
    loaded = true,
    path = "/home/brian/.local/share/nvim/site/pack/packer/start/vim-repeat"
  },
  ["vim-smoothie"] = {
    loaded = true,
    path = "/home/brian/.local/share/nvim/site/pack/packer/start/vim-smoothie"
  },
  ["vim-startuptime"] = {
    commands = { "StartupTime" },
    loaded = false,
    path = "/home/brian/.local/share/nvim/site/pack/packer/opt/vim-startuptime"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/home/brian/.local/share/nvim/site/pack/packer/start/vim-surround"
  },
  ["vim-test"] = {
    loaded = true,
    path = "/home/brian/.local/share/nvim/site/pack/packer/start/vim-test"
  },
  ["vim-unimpaired"] = {
    loaded = true,
    path = "/home/brian/.local/share/nvim/site/pack/packer/start/vim-unimpaired"
  },
  ["vim-vsnip"] = {
    loaded = true,
    path = "/home/brian/.local/share/nvim/site/pack/packer/start/vim-vsnip"
  },
  vimtex = {
    config = { "\27LJ\2\n;\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\18config/vimtex\frequire\0" },
    loaded = false,
    path = "/home/brian/.local/share/nvim/site/pack/packer/opt/vimtex"
  },
  vimux = {
    config = { "\27LJ\2\n:\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\17config/vimux\frequire\0" },
    loaded = false,
    path = "/home/brian/.local/share/nvim/site/pack/packer/opt/vimux"
  },
  ["vista.vim"] = {
    commands = { "Vista" },
    config = { "\27LJ\2\n:\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\17config/vista\frequire\0" },
    loaded = false,
    path = "/home/brian/.local/share/nvim/site/pack/packer/opt/vista.vim"
  },
  ["windowmode.nvim"] = {
    loaded = true,
    path = "/home/brian/.local/share/nvim/site/pack/packer/start/windowmode.nvim"
  }
}

-- Setup for: gruvbox-material
try_loadstring("\27LJ\2\n>\0\0\2\0\4\0\0056\0\0\0009\0\1\0'\1\3\0=\1\2\0K\0\1\0\bmix\29gruvbox_material_palette\6g\bvim\0", "setup", "gruvbox-material")
vim.cmd [[packadd gruvbox-material]]
-- Setup for: vim-polyglot
try_loadstring("\27LJ\2\n=\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\20config/polyglot\frequire\0", "setup", "vim-polyglot")
vim.cmd [[packadd vim-polyglot]]
-- Setup for: haskell-vim
try_loadstring("\27LJ\2\nE\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\28config/polyglot/haskell\frequire\0", "setup", "haskell-vim")
vim.cmd [[packadd haskell-vim]]
-- Config for: nvim-colorizer.lua
try_loadstring("\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14colorizer\frequire\0", "config", "nvim-colorizer.lua")
-- Config for: telescope-media-files.nvim
try_loadstring("\27LJ\2\nJ\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\ncheat\19load_extension\14telescope\frequire\0", "config", "telescope-media-files.nvim")
-- Config for: gruvbox
try_loadstring("\27LJ\2\n@\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\23config/colorscheme\frequire\0", "config", "gruvbox")
-- Config for: indentLine
try_loadstring("\27LJ\2\n@\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\23config/indent_line\frequire\0", "config", "indentLine")
-- Config for: telescope.nvim
try_loadstring("\27LJ\2\n>\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\21config/telescope\frequire\0", "config", "telescope.nvim")
-- Config for: fzf.vim
try_loadstring("\27LJ\2\n8\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\15config/fzf\frequire\0", "config", "fzf.vim")
-- Config for: vim-floaterm
try_loadstring("\27LJ\2\n=\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\20config/floaterm\frequire\0", "config", "vim-floaterm")
-- Config for: vim-commentary
try_loadstring("\27LJ\2\n?\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\22config/commentary\frequire\0", "config", "vim-commentary")
-- Config for: rooter.nvim
try_loadstring("\27LJ\2\n;\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\18config/rooter\frequire\0", "config", "rooter.nvim")
-- Config for: termwrapper.nvim
try_loadstring("\27LJ\2\n@\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\23config/termwrapper\frequire\0", "config", "termwrapper.nvim")
-- Config for: nvim-lightbulb
try_loadstring("\27LJ\2\ns\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0Tautocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()\bcmd\bvim\0", "config", "nvim-lightbulb")
-- Config for: galaxyline.nvim
try_loadstring("\27LJ\2\nG\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\30config/galaxyline/eviline\frequire\0", "config", "galaxyline.nvim")
-- Config for: nvim-treesitter
try_loadstring("\27LJ\2\n?\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\22config/treesitter\frequire\0", "config", "nvim-treesitter")
-- Config for: nvim-compe
try_loadstring("\27LJ\2\n:\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\17config/compe\frequire\0", "config", "nvim-compe")
-- Config for: telescope-frecency.nvim
try_loadstring("\27LJ\2\n=\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\20config/frecency\frequire\0", "config", "telescope-frecency.nvim")
-- Config for: telescope-cheat.nvim
try_loadstring("\27LJ\2\nJ\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\ncheat\19load_extension\14telescope\frequire\0", "config", "telescope-cheat.nvim")
-- Config for: neuron.nvim
try_loadstring("\27LJ\2\n;\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\18config/neuron\frequire\0", "config", "neuron.nvim")
-- Config for: nvim-dap
try_loadstring("\27LJ\2\n8\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\15config/dap\frequire\0", "config", "nvim-dap")
-- Config for: nvim-lspconfig
try_loadstring("\27LJ\2\n:\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\17lsp_settings\frequire\0", "config", "nvim-lspconfig")
-- Conditional loads
if
  try_loadstring("\27LJ\2\n>\0\0\3\0\3\0\n6\0\0\0009\0\1\0'\2\2\0B\0\2\2\v\0\0\0X\0\2€+\0\1\0X\1\1€+\0\2\0L\0\2\0\tTMUX\vgetenv\aos\0", "condition", "vimux")
then
	vim.cmd [[packadd vimux]]
	-- Config for: vimux
	try_loadstring("\27LJ\2\n:\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\17config/vimux\frequire\0", "config", "vimux")
end

if
  try_loadstring("\27LJ\2\n{\0\0\4\0\a\0\0156\0\0\0009\0\1\0'\2\2\0B\0\2\0026\1\3\0009\1\4\0019\1\5\1'\3\6\0B\1\2\2\5\0\1\0X\0\2€+\0\1\0X\1\1€+\0\2\0L\0\2\0\28~/.config/yadm/repo.git\vexpand\afn\bvim\fGIT_DIR\vgetenv\aos\0", "condition", "nvim-tree.lua")
then
	vim.cmd [[packadd nvim-tree.lua]]
	-- Config for: nvim-tree.lua
	try_loadstring("\27LJ\2\n9\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\16config/tree\frequire\0", "config", "nvim-tree.lua")
end


-- Command lazy-loads
vim.cmd [[command! -nargs=* -range -bang -complete=file Start lua require("packer.load")({'vim-dispatch'}, { cmd = "Start", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file Codi lua require("packer.load")({'codi.vim'}, { cmd = "Codi", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file VimBeGood lua require("packer.load")({'vim-be-good'}, { cmd = "VimBeGood", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file StartupTime lua require("packer.load")({'vim-startuptime'}, { cmd = "StartupTime", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file LuaRun lua require("packer.load")({'nvim-luapad'}, { cmd = "LuaRun", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file Lua lua require("packer.load")({'nvim-luapad'}, { cmd = "Lua", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file Luapad lua require("packer.load")({'nvim-luapad'}, { cmd = "Luapad", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file MarkdownPreview lua require("packer.load")({'markdown-preview.nvim'}, { cmd = "MarkdownPreview", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file Goyo lua require("packer.load")({'goyo.vim', 'limelight.vim'}, { cmd = "Goyo", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file TSPlaygroundToggle lua require("packer.load")({'playground'}, { cmd = "TSPlaygroundToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file UndotreeToggle lua require("packer.load")({'undotree'}, { cmd = "UndotreeToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file Vista lua require("packer.load")({'vista.vim'}, { cmd = "Vista", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file Pencil lua require("packer.load")({'vim-pencil'}, { cmd = "Pencil", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file Neogit lua require("packer.load")({'neogit'}, { cmd = "Neogit", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file Dispatch lua require("packer.load")({'vim-dispatch'}, { cmd = "Dispatch", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file Make lua require("packer.load")({'vim-dispatch'}, { cmd = "Make", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file Focus lua require("packer.load")({'vim-dispatch'}, { cmd = "Focus", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
vim.cmd [[au FileType fennel ++once lua require("packer.load")({'conjure'}, { ft = "fennel" }, _G.packer_plugins)]]
vim.cmd [[au FileType vimwiki ++once lua require("packer.load")({'markdown-preview.nvim'}, { ft = "vimwiki" }, _G.packer_plugins)]]
vim.cmd [[au FileType markdown ++once lua require("packer.load")({'markdown-preview.nvim', 'vim-markdown'}, { ft = "markdown" }, _G.packer_plugins)]]
vim.cmd [[au FileType clojure ++once lua require("packer.load")({'conjure'}, { ft = "clojure" }, _G.packer_plugins)]]
vim.cmd [[au FileType lua ++once lua require("packer.load")({'BetterLua.vim'}, { ft = "lua" }, _G.packer_plugins)]]
vim.cmd [[au FileType plaintex ++once lua require("packer.load")({'vimtex'}, { ft = "plaintex" }, _G.packer_plugins)]]
vim.cmd [[au FileType tex ++once lua require("packer.load")({'vimtex'}, { ft = "tex" }, _G.packer_plugins)]]
vim.cmd("augroup END")
END

catch
  echohl ErrorMsg
  echom "Error in packer_compiled: " .. v:exception
  echom "Please check your config for correctness"
  echohl None
endtry
