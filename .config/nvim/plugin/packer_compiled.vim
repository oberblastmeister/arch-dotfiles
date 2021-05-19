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
  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time("Luarocks path setup", true)
local package_path_str = "/home/brian/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/brian/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/brian/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/brian/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/brian/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time("Luarocks path setup", false)
time("try_loadstring definition", true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    print('Error running ' .. component .. ' for ' .. name)
    error(result)
  end
  return result
end

time("try_loadstring definition", false)
time("Defining packer_plugins", true)
_G.packer_plugins = {
  aniseed = {
    loaded = true,
    path = "/home/brian/.local/share/nvim/site/pack/packer/start/aniseed"
  },
  ["colorbuddy.nvim"] = {
    loaded = true,
    path = "/home/brian/.local/share/nvim/site/pack/packer/start/colorbuddy.nvim"
  },
  conjure = {
    loaded = false,
    needs_bufread = false,
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
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\n=\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\20config/gitsigns\frequire\0" },
    loaded = true,
    path = "/home/brian/.local/share/nvim/site/pack/packer/start/gitsigns.nvim"
  },
  ["goyo.vim"] = {
    commands = { "Goyo" },
    loaded = false,
    needs_bufread = false,
    path = "/home/brian/.local/share/nvim/site/pack/packer/opt/goyo.vim"
  },
  gruvbox = {
    config = { "\27LJ\2\n@\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\23config/colorscheme\frequire\0" },
    loaded = true,
    path = "/home/brian/.local/share/nvim/site/pack/packer/start/gruvbox"
  },
  ["haskell-vim"] = {
    loaded = false,
    needs_bufread = true,
    path = "/home/brian/.local/share/nvim/site/pack/packer/opt/haskell-vim"
  },
  ["lalrpop.vim"] = {
    loaded = true,
    path = "/home/brian/.local/share/nvim/site/pack/packer/start/lalrpop.vim"
  },
  ["limelight.vim"] = {
    commands = { "Goyo" },
    loaded = false,
    needs_bufread = false,
    path = "/home/brian/.local/share/nvim/site/pack/packer/opt/limelight.vim"
  },
  ["markdown-preview.nvim"] = {
    commands = { "MarkdownPreview" },
    loaded = false,
    needs_bufread = false,
    path = "/home/brian/.local/share/nvim/site/pack/packer/opt/markdown-preview.nvim"
  },
  neogit = {
    loaded = true,
    path = "/home/brian/.local/share/nvim/site/pack/packer/start/neogit"
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
    needs_bufread = false,
    path = "/home/brian/.local/share/nvim/site/pack/packer/opt/nvim-luapad"
  },
  ["nvim-terminal.lua"] = {
    config = { "\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rterminal\frequire\0" },
    loaded = true,
    path = "/home/brian/.local/share/nvim/site/pack/packer/start/nvim-terminal.lua"
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
  ["octo.nvim"] = {
    commands = { "Octo" },
    loaded = false,
    needs_bufread = false,
    path = "/home/brian/.local/share/nvim/site/pack/packer/opt/octo.nvim"
  },
  ["packer.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/brian/.local/share/nvim/site/pack/packer/opt/packer.nvim"
  },
  ["parinfer-rust"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/brian/.local/share/nvim/site/pack/packer/opt/parinfer-rust"
  },
  ["pest.vim"] = {
    loaded = true,
    path = "/home/brian/.local/share/nvim/site/pack/packer/start/pest.vim"
  },
  playground = {
    commands = { "TSPlaygroundToggle" },
    loaded = false,
    needs_bufread = true,
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
  ["project.nvim"] = {
    config = { "\27LJ\2\n<\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\19config/project\frequire\0" },
    loaded = true,
    path = "/home/brian/.local/share/nvim/site/pack/packer/start/project.nvim"
  },
  ["targets.vim"] = {
    loaded = true,
    path = "/home/brian/.local/share/nvim/site/pack/packer/start/targets.vim"
  },
  ["telescope-fzy-native.nvim"] = {
    loaded = true,
    path = "/home/brian/.local/share/nvim/site/pack/packer/start/telescope-fzy-native.nvim"
  },
  ["telescope-github.nvim"] = {
    loaded = true,
    path = "/home/brian/.local/share/nvim/site/pack/packer/start/telescope-github.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\n>\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\21config/telescope\frequire\0" },
    loaded = true,
    path = "/home/brian/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  ["vim-commentary"] = {
    config = { "\27LJ\2\n?\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\22config/commentary\frequire\0" },
    loaded = true,
    path = "/home/brian/.local/share/nvim/site/pack/packer/start/vim-commentary"
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
  ["vim-repeat"] = {
    loaded = true,
    path = "/home/brian/.local/share/nvim/site/pack/packer/start/vim-repeat"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/home/brian/.local/share/nvim/site/pack/packer/start/vim-surround"
  },
  ["vim-test"] = {
    loaded = true,
    path = "/home/brian/.local/share/nvim/site/pack/packer/start/vim-test"
  },
  ["vim-vsnip"] = {
    loaded = true,
    path = "/home/brian/.local/share/nvim/site/pack/packer/start/vim-vsnip"
  },
  vimtex = {
    config = { "\27LJ\2\n;\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\18config/vimtex\frequire\0" },
    loaded = false,
    needs_bufread = true,
    path = "/home/brian/.local/share/nvim/site/pack/packer/opt/vimtex"
  }
}

time("Defining packer_plugins", false)
-- Setup for: haskell-vim
time("Setup for haskell-vim", true)
try_loadstring("\27LJ\2\nE\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\28config/polyglot/haskell\frequire\0", "setup", "haskell-vim")
time("Setup for haskell-vim", false)
time("packadd for haskell-vim", true)
vim.cmd [[packadd haskell-vim]]
time("packadd for haskell-vim", false)
-- Config for: nvim-terminal.lua
time("Config for nvim-terminal.lua", true)
try_loadstring("\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rterminal\frequire\0", "config", "nvim-terminal.lua")
time("Config for nvim-terminal.lua", false)
-- Config for: nvim-lightbulb
time("Config for nvim-lightbulb", true)
try_loadstring("\27LJ\2\ns\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0Tautocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()\bcmd\bvim\0", "config", "nvim-lightbulb")
time("Config for nvim-lightbulb", false)
-- Config for: telescope.nvim
time("Config for telescope.nvim", true)
try_loadstring("\27LJ\2\n>\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\21config/telescope\frequire\0", "config", "telescope.nvim")
time("Config for telescope.nvim", false)
-- Config for: project.nvim
time("Config for project.nvim", true)
try_loadstring("\27LJ\2\n<\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\19config/project\frequire\0", "config", "project.nvim")
time("Config for project.nvim", false)
-- Config for: nvim-treesitter
time("Config for nvim-treesitter", true)
try_loadstring("\27LJ\2\n?\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\22config/treesitter\frequire\0", "config", "nvim-treesitter")
time("Config for nvim-treesitter", false)
-- Config for: vim-commentary
time("Config for vim-commentary", true)
try_loadstring("\27LJ\2\n?\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\22config/commentary\frequire\0", "config", "vim-commentary")
time("Config for vim-commentary", false)
-- Config for: nvim-compe
time("Config for nvim-compe", true)
try_loadstring("\27LJ\2\n:\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\17config/compe\frequire\0", "config", "nvim-compe")
time("Config for nvim-compe", false)
-- Config for: vim-floaterm
time("Config for vim-floaterm", true)
try_loadstring("\27LJ\2\n=\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\20config/floaterm\frequire\0", "config", "vim-floaterm")
time("Config for vim-floaterm", false)
-- Config for: nvim-colorizer.lua
time("Config for nvim-colorizer.lua", true)
try_loadstring("\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14colorizer\frequire\0", "config", "nvim-colorizer.lua")
time("Config for nvim-colorizer.lua", false)
-- Config for: gruvbox
time("Config for gruvbox", true)
try_loadstring("\27LJ\2\n@\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\23config/colorscheme\frequire\0", "config", "gruvbox")
time("Config for gruvbox", false)
-- Config for: gitsigns.nvim
time("Config for gitsigns.nvim", true)
try_loadstring("\27LJ\2\n=\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\20config/gitsigns\frequire\0", "config", "gitsigns.nvim")
time("Config for gitsigns.nvim", false)
-- Config for: fzf.vim
time("Config for fzf.vim", true)
try_loadstring("\27LJ\2\n8\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\15config/fzf\frequire\0", "config", "fzf.vim")
time("Config for fzf.vim", false)
-- Config for: nvim-lspconfig
time("Config for nvim-lspconfig", true)
try_loadstring("\27LJ\2\n:\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\17lsp_settings\frequire\0", "config", "nvim-lspconfig")
time("Config for nvim-lspconfig", false)

-- Command lazy-loads
time("Defining lazy-load commands", true)
vim.cmd [[command! -nargs=* -range -bang -complete=file Luapad lua require("packer.load")({'nvim-luapad'}, { cmd = "Luapad", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file Octo lua require("packer.load")({'octo.nvim'}, { cmd = "Octo", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file MarkdownPreview lua require("packer.load")({'markdown-preview.nvim'}, { cmd = "MarkdownPreview", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file Lua lua require("packer.load")({'nvim-luapad'}, { cmd = "Lua", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file Goyo lua require("packer.load")({'limelight.vim', 'goyo.vim'}, { cmd = "Goyo", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file TSPlaygroundToggle lua require("packer.load")({'playground'}, { cmd = "TSPlaygroundToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file LuaRun lua require("packer.load")({'nvim-luapad'}, { cmd = "LuaRun", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
time("Defining lazy-load commands", false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time("Defining lazy-load filetype autocommands", true)
vim.cmd [[au FileType tex ++once lua require("packer.load")({'vimtex'}, { ft = "tex" }, _G.packer_plugins)]]
vim.cmd [[au FileType racket ++once lua require("packer.load")({'parinfer-rust'}, { ft = "racket" }, _G.packer_plugins)]]
vim.cmd [[au FileType clojure ++once lua require("packer.load")({'parinfer-rust', 'conjure'}, { ft = "clojure" }, _G.packer_plugins)]]
vim.cmd [[au FileType lisp ++once lua require("packer.load")({'parinfer-rust'}, { ft = "lisp" }, _G.packer_plugins)]]
vim.cmd [[au FileType markdown ++once lua require("packer.load")({'markdown-preview.nvim'}, { ft = "markdown" }, _G.packer_plugins)]]
vim.cmd [[au FileType vimwiki ++once lua require("packer.load")({'markdown-preview.nvim'}, { ft = "vimwiki" }, _G.packer_plugins)]]
vim.cmd [[au FileType jbuild ++once lua require("packer.load")({'parinfer-rust'}, { ft = "jbuild" }, _G.packer_plugins)]]
vim.cmd [[au FileType fennel ++once lua require("packer.load")({'parinfer-rust', 'conjure'}, { ft = "fennel" }, _G.packer_plugins)]]
vim.cmd [[au FileType pddl ++once lua require("packer.load")({'parinfer-rust'}, { ft = "pddl" }, _G.packer_plugins)]]
vim.cmd [[au FileType scheme ++once lua require("packer.load")({'parinfer-rust'}, { ft = "scheme" }, _G.packer_plugins)]]
vim.cmd [[au FileType plaintex ++once lua require("packer.load")({'vimtex'}, { ft = "plaintex" }, _G.packer_plugins)]]
time("Defining lazy-load filetype autocommands", false)
vim.cmd("augroup END")
vim.cmd [[augroup filetypedetect]]
time("Sourcing ftdetect script at: /home/brian/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/tex.vim", true)
vim.cmd [[source /home/brian/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/tex.vim]]
time("Sourcing ftdetect script at: /home/brian/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/tex.vim", false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

END

catch
  echohl ErrorMsg
  echom "Error in packer_compiled: " .. v:exception
  echom "Please check your config for correctness"
  echohl None
endtry
