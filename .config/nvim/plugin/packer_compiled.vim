" Automatically generated packer.nvim plugin loader code

if !has('nvim-0.5')
  echohl WarningMsg
  echom "Invalid Neovim version for packer.nvim!"
  echohl None
  finish
endif
try

lua << END
local plugins = {
  ["BetterLua.vim"] = {
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/brian/.local/share/nvim/site/pack/packer/opt/BetterLua.vim"
  },
  ["barbar.nvim"] = {
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/brian/.local/share/nvim/site/pack/packer/opt/barbar.nvim"
  },
  ["codi.vim"] = {
    commands = { "Codi" },
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/brian/.local/share/nvim/site/pack/packer/opt/codi.vim"
  },
  conjure = {
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/brian/.local/share/nvim/site/pack/packer/opt/conjure"
  },
  ["goyo.vim"] = {
    commands = { "Goyo" },
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/brian/.local/share/nvim/site/pack/packer/opt/goyo.vim"
  },
  ["gruvbox-material"] = {
    loaded = false,
    only_sequence = true,
    only_setup = true,
    path = "/home/brian/.local/share/nvim/site/pack/packer/opt/gruvbox-material"
  },
  ["haskell-vim"] = {
    loaded = false,
    only_sequence = true,
    only_setup = true,
    path = "/home/brian/.local/share/nvim/site/pack/packer/opt/haskell-vim"
  },
  ["limelight.vim"] = {
    commands = { "Goyo" },
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/brian/.local/share/nvim/site/pack/packer/opt/limelight.vim"
  },
  ["markdown-preview.nvim"] = {
    commands = { "MarkdownPreview" },
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/brian/.local/share/nvim/site/pack/packer/opt/markdown-preview.nvim"
  },
  neogit = {
    commands = { "Neogit" },
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/brian/.local/share/nvim/site/pack/packer/opt/neogit"
  },
  ["nvim-luapad"] = {
    commands = { "LuaRun", "Lua", "Luapad" },
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/brian/.local/share/nvim/site/pack/packer/opt/nvim-luapad"
  },
  ["packer.nvim"] = {
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/brian/.local/share/nvim/site/pack/packer/opt/packer.nvim"
  },
  playground = {
    commands = { "TSPlaygroundToggle" },
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/brian/.local/share/nvim/site/pack/packer/opt/playground"
  },
  ["searchReplace.vim"] = {
    commands = { "Search" },
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/brian/.local/share/nvim/site/pack/packer/opt/searchReplace.vim"
  },
  ["todoist.nvim"] = {
    commands = { "Todoist" },
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/brian/.local/share/nvim/site/pack/packer/opt/todoist.nvim"
  },
  undotree = {
    commands = { "UndotreeToggle" },
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/brian/.local/share/nvim/site/pack/packer/opt/undotree"
  },
  ["vim-be-good"] = {
    commands = { "VimBeGood" },
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/brian/.local/share/nvim/site/pack/packer/opt/vim-be-good"
  },
  ["vim-dispatch"] = {
    commands = { "Dispatch", "Make", "Focus", "Start" },
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/brian/.local/share/nvim/site/pack/packer/opt/vim-dispatch"
  },
  ["vim-markdown"] = {
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/brian/.local/share/nvim/site/pack/packer/opt/vim-markdown"
  },
  ["vim-pencil"] = {
    commands = { "Pencil" },
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/brian/.local/share/nvim/site/pack/packer/opt/vim-pencil"
  },
  ["vim-polyglot"] = {
    loaded = false,
    only_sequence = true,
    only_setup = true,
    path = "/home/brian/.local/share/nvim/site/pack/packer/opt/vim-polyglot"
  },
  ["vim-startuptime"] = {
    commands = { "StartupTime" },
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/brian/.local/share/nvim/site/pack/packer/opt/vim-startuptime"
  },
  vimspector = {
    commands = { "LaunchVimspector" },
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/brian/.local/share/nvim/site/pack/packer/opt/vimspector"
  },
  vimtex = {
    config = { "\27LJ\2\n;\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\18config/vimtex\frequire\0" },
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/brian/.local/share/nvim/site/pack/packer/opt/vimtex"
  },
  vimux = {
    config = { "\27LJ\2\n:\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\17config/vimux\frequire\0" },
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/brian/.local/share/nvim/site/pack/packer/opt/vimux"
  },
  ["vista.vim"] = {
    commands = { "Vista" },
    config = { "\27LJ\2\n:\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\17config/vista\frequire\0" },
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/brian/.local/share/nvim/site/pack/packer/opt/vista.vim"
  }
}

local function handle_bufread(names)
  for _, name in ipairs(names) do
    local path = plugins[name].path
    for _, dir in ipairs({ 'ftdetect', 'ftplugin', 'after/ftdetect', 'after/ftplugin' }) do
      if #vim.fn.finddir(dir, path) > 0 then
        vim.cmd('doautocmd BufRead')
        return
      end
    end
  end
end

local packer_load = nil
local function handle_after(name, before)
  local plugin = plugins[name]
  plugin.load_after[before] = nil
  if next(plugin.load_after) == nil then
    packer_load({name}, {})
  end
end

packer_load = function(names, cause)
  local some_unloaded = false
  for _, name in ipairs(names) do
    if not plugins[name].loaded then
      some_unloaded = true
      break
    end
  end

  if not some_unloaded then return end

  local fmt = string.format
  local del_cmds = {}
  local del_maps = {}
  for _, name in ipairs(names) do
    if plugins[name].commands then
      for _, cmd in ipairs(plugins[name].commands) do
        del_cmds[cmd] = true
      end
    end

    if plugins[name].keys then
      for _, key in ipairs(plugins[name].keys) do
        del_maps[key] = true
      end
    end
  end

  for cmd, _ in pairs(del_cmds) do
    vim.cmd('silent! delcommand ' .. cmd)
  end

  for key, _ in pairs(del_maps) do
    vim.cmd(fmt('silent! %sunmap %s', key[1], key[2]))
  end

  for _, name in ipairs(names) do
    if not plugins[name].loaded then
      vim.cmd('packadd ' .. name)
      if plugins[name].config then
        for _i, config_line in ipairs(plugins[name].config) do
          loadstring(config_line)()
        end
      end

      if plugins[name].after then
        for _, after_name in ipairs(plugins[name].after) do
          handle_after(after_name, name)
          vim.cmd('redraw')
        end
      end

      plugins[name].loaded = true
    end
  end

  handle_bufread(names)

  if cause.cmd then
    local lines = cause.l1 == cause.l2 and '' or (cause.l1 .. ',' .. cause.l2)
    vim.cmd(fmt('%s%s%s %s', lines, cause.cmd, cause.bang, cause.args))
  elseif cause.keys then
    local keys = cause.keys
    local extra = ''
    while true do
      local c = vim.fn.getchar(0)
      if c == 0 then break end
      extra = extra .. vim.fn.nr2char(c)
    end

    if cause.prefix then
      local prefix = vim.v.count ~= 0 and vim.v.count or ''
      prefix = prefix .. '"' .. vim.v.register .. cause.prefix
      if vim.fn.mode('full') == 'no' then
        if vim.v.operator == 'c' then
          prefix = '' .. prefix
        end

        prefix = prefix .. vim.v.operator
      end

      vim.fn.feedkeys(prefix, 'n')
    end

    local escaped_keys = vim.api.nvim_replace_termcodes(cause.keys .. extra, true, true, true)
    vim.api.nvim_feedkeys(escaped_keys, 'm', true)
  elseif cause.event then
    vim.cmd(fmt('doautocmd <nomodeline> %s', cause.event))
  elseif cause.ft then
    vim.cmd(fmt('doautocmd <nomodeline> %s FileType %s', 'filetypeplugin', cause.ft))
    vim.cmd(fmt('doautocmd <nomodeline> %s FileType %s', 'filetypeindent', cause.ft))
  end
end

_packer_load_wrapper = function(names, cause)
  success, err_msg = pcall(packer_load, names, cause)
  if not success then
    vim.cmd('echohl ErrorMsg')
    vim.cmd('echomsg "Error in packer_compiled: ' .. vim.fn.escape(err_msg, '"') .. '"')
    vim.cmd('echomsg "Please check your config for correctness"')
    vim.cmd('echohl None')
  end
end

-- Runtimepath customization

-- Pre-load configuration
-- Setup for: haskell-vim
loadstring("\27LJ\2\nE\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\28config/polyglot/haskell\frequire\0")()
vim.cmd("packadd haskell-vim")
-- Setup for: vimspector
loadstring("\27LJ\2\nB\0\0\2\0\4\0\0056\0\0\0009\0\1\0'\1\3\0=\1\2\0K\0\1\0\nHUMAN\31vimspector_enable_mappings\6g\bvim\0")()
-- Setup for: vim-polyglot
loadstring("\27LJ\2\n=\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\20config/polyglot\frequire\0")()
vim.cmd("packadd vim-polyglot")
-- Setup for: gruvbox-material
loadstring("\27LJ\2\n>\0\0\2\0\4\0\0056\0\0\0009\0\1\0'\1\3\0=\1\2\0K\0\1\0\bmix\29gruvbox_material_palette\6g\bvim\0")()
vim.cmd("packadd gruvbox-material")
-- Post-load configuration
-- Config for: vim-floaterm
loadstring("\27LJ\2\n=\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\20config/floaterm\frequire\0")()
-- Config for: vim-sandwich
loadstring("\27LJ\2\n>\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\21config/sandwhich\frequire\0")()
-- Config for: rooter.nvim
loadstring("\27LJ\2\n;\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\18config/rooter\frequire\0")()
-- Config for: neuron.nvim
loadstring("\27LJ\2\n;\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\18config/neuron\frequire\0")()
-- Config for: telescope.nvim
loadstring("\27LJ\2\n>\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\21config/telescope\frequire\0")()
-- Config for: gruvbox
loadstring("\27LJ\2\n@\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\23config/colorscheme\frequire\0")()
-- Config for: nvim-dap
loadstring("\27LJ\2\n8\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\15config/dap\frequire\0")()
-- Config for: indentLine
loadstring("\27LJ\2\n@\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\23config/indent_line\frequire\0")()
-- Config for: vim-matchup
loadstring("\27LJ\2\n<\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\19config/matchup\frequire\0")()
-- Config for: galaxyline.nvim
loadstring("\27LJ\2\nG\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\30config/galaxyline/eviline\frequire\0")()
-- Config for: fzf.vim
loadstring("\27LJ\2\n8\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\15config/fzf\frequire\0")()
-- Config for: nvim-lspconfig
loadstring("\27LJ\2\n:\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\17lsp_settings\frequire\0")()
-- Config for: vim-commentary
loadstring("\27LJ\2\n?\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\22config/commentary\frequire\0")()
-- Config for: completion-nvim
loadstring("\27LJ\2\n?\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\22config/completion\frequire\0")()
-- Config for: nvim-treesitter
loadstring("\27LJ\2\n?\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\22config/treesitter\frequire\0")()
-- Config for: termwrapper.nvim
loadstring("\27LJ\2\n@\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\23config/termwrapper\frequire\0")()
-- Config for: nvim-colorizer.lua
loadstring("\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14colorizer\frequire\0")()
-- Conditional loads
if
  loadstring("\27LJ\2\nX\0\0\3\0\4\1\v6\0\0\0009\0\1\0009\0\2\0'\2\3\0B\0\2\2\b\0\0\0X\0\2€+\0\1\0X\1\1€+\0\2\0L\0\2\0\26g:started_by_firenvim\vexists\afn\bvim\0\0")()
then
	vim.cmd("packadd barbar.nvim")
end

if
  loadstring("\27LJ\2\n>\0\0\3\0\3\0\n6\0\0\0009\0\1\0'\2\2\0B\0\2\2\v\0\0\0X\0\2€+\0\1\0X\1\1€+\0\2\0L\0\2\0\tTMUX\vgetenv\aos\0")()
then
	vim.cmd("packadd vimux")
	-- Config for: vimux
	loadstring("\27LJ\2\n:\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\17config/vimux\frequire\0")()
end

-- Load plugins in order defined by `after`
END

function! s:load(names, cause) abort
  call luaeval('_packer_load_wrapper(_A[1], _A[2])', [a:names, a:cause])
endfunction


" Command lazy-loads
command! -nargs=* -range -bang -complete=file Todoist call s:load(['todoist.nvim'], { "cmd": "Todoist", "l1": <line1>, "l2": <line2>, "bang": <q-bang>, "args": <q-args> })
command! -nargs=* -range -bang -complete=file MarkdownPreview call s:load(['markdown-preview.nvim'], { "cmd": "MarkdownPreview", "l1": <line1>, "l2": <line2>, "bang": <q-bang>, "args": <q-args> })
command! -nargs=* -range -bang -complete=file Goyo call s:load(['goyo.vim', 'limelight.vim'], { "cmd": "Goyo", "l1": <line1>, "l2": <line2>, "bang": <q-bang>, "args": <q-args> })
command! -nargs=* -range -bang -complete=file LuaRun call s:load(['nvim-luapad'], { "cmd": "LuaRun", "l1": <line1>, "l2": <line2>, "bang": <q-bang>, "args": <q-args> })
command! -nargs=* -range -bang -complete=file Pencil call s:load(['vim-pencil'], { "cmd": "Pencil", "l1": <line1>, "l2": <line2>, "bang": <q-bang>, "args": <q-args> })
command! -nargs=* -range -bang -complete=file Luapad call s:load(['nvim-luapad'], { "cmd": "Luapad", "l1": <line1>, "l2": <line2>, "bang": <q-bang>, "args": <q-args> })
command! -nargs=* -range -bang -complete=file UndotreeToggle call s:load(['undotree'], { "cmd": "UndotreeToggle", "l1": <line1>, "l2": <line2>, "bang": <q-bang>, "args": <q-args> })
command! -nargs=* -range -bang -complete=file Neogit call s:load(['neogit'], { "cmd": "Neogit", "l1": <line1>, "l2": <line2>, "bang": <q-bang>, "args": <q-args> })
command! -nargs=* -range -bang -complete=file Codi call s:load(['codi.vim'], { "cmd": "Codi", "l1": <line1>, "l2": <line2>, "bang": <q-bang>, "args": <q-args> })
command! -nargs=* -range -bang -complete=file TSPlaygroundToggle call s:load(['playground'], { "cmd": "TSPlaygroundToggle", "l1": <line1>, "l2": <line2>, "bang": <q-bang>, "args": <q-args> })
command! -nargs=* -range -bang -complete=file VimBeGood call s:load(['vim-be-good'], { "cmd": "VimBeGood", "l1": <line1>, "l2": <line2>, "bang": <q-bang>, "args": <q-args> })
command! -nargs=* -range -bang -complete=file LaunchVimspector call s:load(['vimspector'], { "cmd": "LaunchVimspector", "l1": <line1>, "l2": <line2>, "bang": <q-bang>, "args": <q-args> })
command! -nargs=* -range -bang -complete=file StartupTime call s:load(['vim-startuptime'], { "cmd": "StartupTime", "l1": <line1>, "l2": <line2>, "bang": <q-bang>, "args": <q-args> })
command! -nargs=* -range -bang -complete=file Lua call s:load(['nvim-luapad'], { "cmd": "Lua", "l1": <line1>, "l2": <line2>, "bang": <q-bang>, "args": <q-args> })
command! -nargs=* -range -bang -complete=file Dispatch call s:load(['vim-dispatch'], { "cmd": "Dispatch", "l1": <line1>, "l2": <line2>, "bang": <q-bang>, "args": <q-args> })
command! -nargs=* -range -bang -complete=file Make call s:load(['vim-dispatch'], { "cmd": "Make", "l1": <line1>, "l2": <line2>, "bang": <q-bang>, "args": <q-args> })
command! -nargs=* -range -bang -complete=file Focus call s:load(['vim-dispatch'], { "cmd": "Focus", "l1": <line1>, "l2": <line2>, "bang": <q-bang>, "args": <q-args> })
command! -nargs=* -range -bang -complete=file Vista call s:load(['vista.vim'], { "cmd": "Vista", "l1": <line1>, "l2": <line2>, "bang": <q-bang>, "args": <q-args> })
command! -nargs=* -range -bang -complete=file Search call s:load(['searchReplace.vim'], { "cmd": "Search", "l1": <line1>, "l2": <line2>, "bang": <q-bang>, "args": <q-args> })
command! -nargs=* -range -bang -complete=file Start call s:load(['vim-dispatch'], { "cmd": "Start", "l1": <line1>, "l2": <line2>, "bang": <q-bang>, "args": <q-args> })

" Keymap lazy-loads

augroup packer_load_aucmds
  au!
  " Filetype lazy-loads
  au FileType tex ++once call s:load(['vimtex'], { "ft": "tex" })
  au FileType lua ++once call s:load(['BetterLua.vim'], { "ft": "lua" })
  au FileType markdown ++once call s:load(['vim-markdown', 'markdown-preview.nvim'], { "ft": "markdown" })
  au FileType clojure ++once call s:load(['conjure'], { "ft": "clojure" })
  au FileType fennel ++once call s:load(['conjure'], { "ft": "fennel" })
  au FileType vimwiki ++once call s:load(['markdown-preview.nvim'], { "ft": "vimwiki" })
  au FileType plaintex ++once call s:load(['vimtex'], { "ft": "plaintex" })
  " Event lazy-loads
  " Function lazy-loads
augroup END

catch
  echohl ErrorMsg
  echom "Error in packer_compiled: " .. v:exception
  echom "Please check your config for correctness"
  echohl None
endtry
