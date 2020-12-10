" Automatically generated packer.nvim plugin loader code

if !has('nvim-0.5')
  echohl WarningMsg
  echom "Invalid Neovim version for packer.nvim!"
  echohl None
  finish
endif

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
  ["nvim-tree.lua"] = {
    config = { "\27LJ\1\0029\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\16config/tree\frequire\0" },
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/brian/.local/share/nvim/site/pack/packer/opt/nvim-tree.lua"
  },
  ["packer.nvim"] = {
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/brian/.local/share/nvim/site/pack/packer/opt/packer.nvim"
  },
  ["parinfer-rust"] = {
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/brian/.local/share/nvim/site/pack/packer/opt/parinfer-rust"
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
  ["vim-tmux-navigator"] = {
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/brian/.local/share/nvim/site/pack/packer/opt/vim-tmux-navigator"
  },
  vimspector = {
    commands = { "LaunchVimspector" },
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/brian/.local/share/nvim/site/pack/packer/opt/vimspector"
  },
  vimtex = {
    config = { "\27LJ\1\2;\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\18config/vimtex\frequire\0" },
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/brian/.local/share/nvim/site/pack/packer/opt/vimtex"
  },
  vimux = {
    config = { "\27LJ\1\2:\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\17config/vimux\frequire\0" },
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/brian/.local/share/nvim/site/pack/packer/opt/vimux"
  },
  vimwiki = {
    commands = { "VimwikiIndex" },
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/brian/.local/share/nvim/site/pack/packer/opt/vimwiki"
  },
  ["vista.vim"] = {
    commands = { "Vista" },
    config = { "\27LJ\1\2:\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\17config/vista\frequire\0" },
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

_packer_load = nil

local function handle_after(name, before)
  local plugin = plugins[name]
  plugin.load_after[before] = nil
  if next(plugin.load_after) == nil then
    _packer_load({name}, {})
  end
end

_packer_load = function(names, cause)
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
      local prefix = vim.v.count and vim.v.count or ''
      prefix = prefix .. '"' .. vim.v.register .. cause.prefix
      if vim.fn.mode('full') == 'no' then
        if vim.v.operator == 'c' then
          prefix = '' .. prefix
        end

        prefix = prefix .. vim.v.operator
      end

      vim.fn.feedkeys(prefix, 'n')
    end

    -- NOTE: I'm not sure if the below substitution is correct; it might correspond to the literal
    -- characters \<Plug> rather than the special <Plug> key.
    vim.fn.feedkeys(string.gsub(string.gsub(cause.keys, '^<Plug>', '\\<Plug>') .. extra, '<[cC][rR]>', '\r'))
  elseif cause.event then
    vim.cmd(fmt('doautocmd <nomodeline> %s', cause.event))
  elseif cause.ft then
    vim.cmd(fmt('doautocmd <nomodeline> %s FileType %s', 'filetypeplugin', cause.ft))
    vim.cmd(fmt('doautocmd <nomodeline> %s FileType %s', 'filetypeindent', cause.ft))
  end
end

-- Runtimepath customization

-- Pre-load configuration
-- Setup for: vimspector
loadstring("\27LJ\1\2B\0\0\2\0\4\0\0054\0\0\0007\0\1\0%\1\3\0:\1\2\0G\0\1\0\nHUMAN\31vimspector_enable_mappings\6g\bvim\0")()
-- Setup for: gruvbox-material
loadstring("\27LJ\1\2>\0\0\2\0\4\0\0054\0\0\0007\0\1\0%\1\3\0:\1\2\0G\0\1\0\bmix\29gruvbox_material_palette\6g\bvim\0")()
vim.cmd("packadd gruvbox-material")
-- Setup for: vim-polyglot
loadstring("\27LJ\1\2=\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\20config/polyglot\frequire\0")()
vim.cmd("packadd vim-polyglot")
-- Setup for: vimwiki
loadstring("\27LJ\1\2<\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\19config/vimwiki\frequire\0")()
-- Post-load configuration
-- Config for: nvim-lspconfig
loadstring("\27LJ\1\2:\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\17lsp_settings\frequire\0")()
-- Config for: vim-floaterm
loadstring("\27LJ\1\2=\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\20config/floaterm\frequire\0")()
-- Config for: gruvbox
loadstring("\27LJ\1\2@\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\23config/colorscheme\frequire\0")()
-- Config for: indentLine
loadstring("\27LJ\1\2@\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\23config/indent_line\frequire\0")()
-- Config for: fzf.vim
loadstring("\27LJ\1\0028\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\15config/fzf\frequire\0")()
-- Config for: lsp_extensions.nvim
loadstring("\27LJ\1\2C\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\26config/lsp_extensions\frequire\0")()
-- Config for: vim-matchup
loadstring("\27LJ\1\2<\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\19config/matchup\frequire\0")()
-- Config for: termwrapper.nvim
loadstring("\27LJ\1\2@\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\23config/termwrapper\frequire\0")()
-- Config for: telescope.nvim
loadstring("\27LJ\1\2>\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\21config/telescope\frequire\0")()
-- Config for: completion-nvim
loadstring("\27LJ\1\2?\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\22config/completion\frequire\0")()
-- Config for: nvim-colorizer.lua
loadstring("\27LJ\1\0027\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\14colorizer\frequire\0")()
-- Config for: vim-commentary
loadstring("\27LJ\1\2?\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\22config/commentary\frequire\0")()
-- Config for: rooter.nvim
loadstring("\27LJ\1\2;\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\18config/rooter\frequire\0")()
-- Config for: gitsigns.nvim
loadstring("\27LJ\1\2=\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\20config/gitsigns\frequire\0")()
-- Config for: nvim-lsputils
loadstring("\27LJ\1\2>\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\21config/lsp_utils\frequire\0")()
-- Config for: vim-sandwich
loadstring("\27LJ\1\2>\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\21config/sandwhich\frequire\0")()
-- Config for: galaxyline.nvim
loadstring("\27LJ\1\2G\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\30config/galaxyline/eviline\frequire\0")()
-- Config for: nvim-treesitter
loadstring("\27LJ\1\2?\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\22config/treesitter\frequire\0")()
-- Conditional loads
if
    loadstring("\27LJ\1\2X\0\0\2\0\4\1\v4\0\0\0007\0\1\0007\0\2\0%\1\3\0>\0\2\2\b\0\0\0T\0\2€)\0\1\0T\1\1€)\0\2\0H\0\2\0\26g:started_by_firenvim\vexists\afn\bvim\0\0")()
    then
      vim.cmd("packadd barbar.nvim")
    end
    
if
    loadstring("\27LJ\1\2{\0\0\3\0\a\0\0154\0\0\0007\0\1\0%\1\2\0>\0\2\0024\1\3\0007\1\4\0017\1\5\1%\2\6\0>\1\2\2\5\0\1\0T\0\2€)\0\1\0T\1\1€)\0\2\0H\0\2\0\28~/.config/yadm/repo.git\vexpand\afn\bvim\fGIT_DIR\vgetenv\aos\0")()
    then
      vim.cmd("packadd nvim-tree.lua")
	
	-- Config for: nvim-tree.lua
	loadstring("\27LJ\1\0029\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\16config/tree\frequire\0")()
	
    end
    
if
    loadstring("\27LJ\1\2>\0\0\2\0\3\0\n4\0\0\0007\0\1\0%\1\2\0>\0\2\2\v\0\0\0T\0\2€)\0\1\0T\1\1€)\0\2\0H\0\2\0\tTMUX\vgetenv\aos\0")()
    then
      vim.cmd("packadd vim-tmux-navigator")
	vim.cmd("packadd vimux")
	
	-- Config for: vimux
	loadstring("\27LJ\1\2:\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\17config/vimux\frequire\0")()
	
    end
    
-- Load plugins in order defined by `after`
END

function! s:load(names, cause) abort
call luaeval('_packer_load(_A[1], _A[2])', [a:names, a:cause])
endfunction


" Command lazy-loads
command! -nargs=* -range -bang -complete=file Make call s:load(['vim-dispatch'], { "cmd": "Make", "l1": <line1>, "l2": <line2>, "bang": <q-bang>, "args": <q-args> })
command! -nargs=* -range -bang -complete=file Neogit call s:load(['neogit'], { "cmd": "Neogit", "l1": <line1>, "l2": <line2>, "bang": <q-bang>, "args": <q-args> })
command! -nargs=* -range -bang -complete=file VimwikiIndex call s:load(['vimwiki'], { "cmd": "VimwikiIndex", "l1": <line1>, "l2": <line2>, "bang": <q-bang>, "args": <q-args> })
command! -nargs=* -range -bang -complete=file Dispatch call s:load(['vim-dispatch'], { "cmd": "Dispatch", "l1": <line1>, "l2": <line2>, "bang": <q-bang>, "args": <q-args> })
command! -nargs=* -range -bang -complete=file Start call s:load(['vim-dispatch'], { "cmd": "Start", "l1": <line1>, "l2": <line2>, "bang": <q-bang>, "args": <q-args> })
command! -nargs=* -range -bang -complete=file Vista call s:load(['vista.vim'], { "cmd": "Vista", "l1": <line1>, "l2": <line2>, "bang": <q-bang>, "args": <q-args> })
command! -nargs=* -range -bang -complete=file Lua call s:load(['nvim-luapad'], { "cmd": "Lua", "l1": <line1>, "l2": <line2>, "bang": <q-bang>, "args": <q-args> })
command! -nargs=* -range -bang -complete=file StartupTime call s:load(['vim-startuptime'], { "cmd": "StartupTime", "l1": <line1>, "l2": <line2>, "bang": <q-bang>, "args": <q-args> })
command! -nargs=* -range -bang -complete=file Luapad call s:load(['nvim-luapad'], { "cmd": "Luapad", "l1": <line1>, "l2": <line2>, "bang": <q-bang>, "args": <q-args> })
command! -nargs=* -range -bang -complete=file Goyo call s:load(['goyo.vim', 'limelight.vim'], { "cmd": "Goyo", "l1": <line1>, "l2": <line2>, "bang": <q-bang>, "args": <q-args> })
command! -nargs=* -range -bang -complete=file Codi call s:load(['codi.vim'], { "cmd": "Codi", "l1": <line1>, "l2": <line2>, "bang": <q-bang>, "args": <q-args> })
command! -nargs=* -range -bang -complete=file UndotreeToggle call s:load(['undotree'], { "cmd": "UndotreeToggle", "l1": <line1>, "l2": <line2>, "bang": <q-bang>, "args": <q-args> })
command! -nargs=* -range -bang -complete=file Search call s:load(['searchReplace.vim'], { "cmd": "Search", "l1": <line1>, "l2": <line2>, "bang": <q-bang>, "args": <q-args> })
command! -nargs=* -range -bang -complete=file Pencil call s:load(['vim-pencil'], { "cmd": "Pencil", "l1": <line1>, "l2": <line2>, "bang": <q-bang>, "args": <q-args> })
command! -nargs=* -range -bang -complete=file Focus call s:load(['vim-dispatch'], { "cmd": "Focus", "l1": <line1>, "l2": <line2>, "bang": <q-bang>, "args": <q-args> })
command! -nargs=* -range -bang -complete=file MarkdownPreview call s:load(['markdown-preview.nvim'], { "cmd": "MarkdownPreview", "l1": <line1>, "l2": <line2>, "bang": <q-bang>, "args": <q-args> })
command! -nargs=* -range -bang -complete=file VimBeGood call s:load(['vim-be-good'], { "cmd": "VimBeGood", "l1": <line1>, "l2": <line2>, "bang": <q-bang>, "args": <q-args> })
command! -nargs=* -range -bang -complete=file TSPlaygroundToggle call s:load(['playground'], { "cmd": "TSPlaygroundToggle", "l1": <line1>, "l2": <line2>, "bang": <q-bang>, "args": <q-args> })
command! -nargs=* -range -bang -complete=file LuaRun call s:load(['nvim-luapad'], { "cmd": "LuaRun", "l1": <line1>, "l2": <line2>, "bang": <q-bang>, "args": <q-args> })
command! -nargs=* -range -bang -complete=file LaunchVimspector call s:load(['vimspector'], { "cmd": "LaunchVimspector", "l1": <line1>, "l2": <line2>, "bang": <q-bang>, "args": <q-args> })
command! -nargs=* -range -bang -complete=file Todoist call s:load(['todoist.nvim'], { "cmd": "Todoist", "l1": <line1>, "l2": <line2>, "bang": <q-bang>, "args": <q-args> })

" Keymap lazy-loads

augroup packer_load_aucmds
  au!
  " Filetype lazy-loads
  au FileType lua ++once call s:load(['BetterLua.vim'], { "ft": "lua" })
  au FileType vimwiki ++once call s:load(['markdown-preview.nvim'], { "ft": "vimwiki" })
  au FileType lisp ++once call s:load(['parinfer-rust'], { "ft": "lisp" })
  au FileType fennel ++once call s:load(['parinfer-rust', 'conjure'], { "ft": "fennel" })
  au FileType pddl ++once call s:load(['parinfer-rust'], { "ft": "pddl" })
  au FileType tex ++once call s:load(['vimtex'], { "ft": "tex" })
  au FileType markdown ++once call s:load(['vim-markdown', 'markdown-preview.nvim'], { "ft": "markdown" })
  au FileType clojure ++once call s:load(['parinfer-rust', 'conjure'], { "ft": "clojure" })
  au FileType plaintex ++once call s:load(['vimtex'], { "ft": "plaintex" })
  au FileType jbuild ++once call s:load(['parinfer-rust'], { "ft": "jbuild" })
  au FileType scheme ++once call s:load(['parinfer-rust'], { "ft": "scheme" })
  au FileType racket ++once call s:load(['parinfer-rust'], { "ft": "racket" })
  " Event lazy-loads
augroup END
