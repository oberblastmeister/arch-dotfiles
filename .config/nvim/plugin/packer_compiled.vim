" Automatically generated packer.nvim plugin loader code

lua << END
local plugins = {
  ["BetterLua.vim"] = {
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/brian/.local/share/nvim/site/pack/packer/opt/BetterLua.vim"
  },
  ["bracey.vim"] = {
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/brian/.local/share/nvim/site/pack/packer/opt/bracey.vim"
  },
  ["codi.vim"] = {
    commands = { "Codi" },
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/brian/.local/share/nvim/site/pack/packer/opt/codi.vim"
  },
  ["completion-buffers"] = {
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/brian/.local/share/nvim/site/pack/packer/opt/completion-buffers"
  },
  ["completion-nvim"] = {
    config = { "\27LJ\2\2N\0\0\2\0\4\0\b6\0\0\0'\1\1\0B\0\2\0029\1\2\0B\1\1\0019\1\3\0B\1\1\1K\0\1\0\nstart\vconfig\22config/completion\frequire\0" },
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/brian/.local/share/nvim/site/pack/packer/opt/completion-nvim"
  },
  ["emmet-vim"] = {
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/brian/.local/share/nvim/site/pack/packer/opt/emmet-vim"
  },
  ["goyo.vim"] = {
    commands = { "Goyo" },
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/brian/.local/share/nvim/site/pack/packer/opt/goyo.vim"
  },
  ["limelight.vim"] = {
    commands = { "Goyo" },
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/brian/.local/share/nvim/site/pack/packer/opt/limelight.vim"
  },
  ["markdown-preview.nvim"] = {
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/brian/.local/share/nvim/site/pack/packer/opt/markdown-preview.nvim"
  },
  ["notational-fzf-vim"] = {
    commands = { "NV" },
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/brian/.local/share/nvim/site/pack/packer/opt/notational-fzf-vim"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\2?\0\0\2\0\3\0\0066\0\0\0'\1\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\22config/treesitter\frequire\0" },
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/brian/.local/share/nvim/site/pack/packer/opt/nvim-treesitter"
  },
  ["packer.nvim"] = {
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/brian/.local/share/nvim/site/pack/packer/opt/packer.nvim"
  },
  ["pest.vim"] = {
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/brian/.local/share/nvim/site/pack/packer/opt/pest.vim"
  },
  ["splitjoin.vim"] = {
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/brian/.local/share/nvim/site/pack/packer/opt/splitjoin.vim"
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
  ["vim-closetag"] = {
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/brian/.local/share/nvim/site/pack/packer/opt/vim-closetag"
  },
  ["vim-markdown"] = {
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/brian/.local/share/nvim/site/pack/packer/opt/vim-markdown"
  },
  ["vim-polyglot"] = {
    config = { '\27LJ\2\2?\0\0\2\0\3\0\0056\0\0\0009\0\1\0)\1\0\0=\1\2\0K\0\1\0"python_highlight_space_errors\6g\bvim\0' },
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
  ["vim-test"] = {
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/brian/.local/share/nvim/site/pack/packer/opt/vim-test"
  },
  ["vim-vsnip"] = {
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/brian/.local/share/nvim/site/pack/packer/opt/vim-vsnip"
  },
  ["vim-vsnip-integ"] = {
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/brian/.local/share/nvim/site/pack/packer/opt/vim-vsnip-integ"
  },
  vimspector = {
    loaded = false,
    only_sequence = true,
    only_setup = true,
    path = "/home/brian/.local/share/nvim/site/pack/packer/opt/vimspector"
  },
  vimtex = {
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/brian/.local/share/nvim/site/pack/packer/opt/vimtex"
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
      vim._update_package_paths()
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

-- Pre-load configuration
-- Setup for: vim-polyglot
loadstring("\27LJ\2\2O\0\0\2\0\4\0\0056\0\0\0009\0\1\0005\1\3\0=\1\2\0K\0\1\0\1\5\0\0\rmarkdown\nlatex\tpest\blua\22polyglot_disabled\6g\bvim\0")()
vim.cmd("packadd vim-polyglot")
-- Setup for: vimspector
loadstring("\27LJ\2\2B\0\0\2\0\4\0\0056\0\0\0009\0\1\0'\1\3\0=\1\2\0K\0\1\0\nHUMAN\31vimspector_enable_mappings\6g\bvim\0")()
vim.cmd("packadd vimspector")
-- Post-load configuration
-- Config for: vim-sandwich
loadstring("\27LJ\2\2>\0\0\2\0\3\0\0066\0\0\0'\1\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\21config/sandwhich\frequire\0")()
-- Config for: gruvbox
loadstring("\27LJ\2\2Y\0\0\2\0\6\0\t6\0\0\0009\0\1\0'\1\2\0B\0\2\0016\0\0\0009\0\3\0'\1\5\0=\1\4\0K\0\1\0\tdark\15background\6o\24colorscheme gruvbox\bcmd\bvim\0")()
-- Config for: nvim-colorizer.lua
loadstring("\27LJ\2\0027\0\0\2\0\3\0\0066\0\0\0'\1\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14colorizer\frequire\0")()
-- Config for: nvim-lspconfig
loadstring("\27LJ\2\0028\0\0\2\0\3\0\0066\0\0\0'\1\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\15config/lsp\frequire\0")()
-- Config for: diagnostic-nvim
loadstring("\27LJ\2\2?\0\0\2\0\3\0\0066\0\0\0'\1\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\22config/diagnostic\frequire\0")()
-- Conditional loads
vim._update_package_paths()
END

function! s:load(names, cause) abort
call luaeval('_packer_load(_A[1], _A[2])', [a:names, a:cause])
endfunction

" Runtimepath customization

" Load plugins in order defined by `after`

" Command lazy-loads
command! -nargs=* -range -bang -complete=file Codi call s:load(['codi.vim'], { "cmd": "Codi", "l1": <line1>, "l2": <line2>, "bang": <q-bang>, "args": <q-args> })
command! -nargs=* -range -bang -complete=file StartupTime call s:load(['vim-startuptime'], { "cmd": "StartupTime", "l1": <line1>, "l2": <line2>, "bang": <q-bang>, "args": <q-args> })
command! -nargs=* -range -bang -complete=file UndotreeToggle call s:load(['undotree'], { "cmd": "UndotreeToggle", "l1": <line1>, "l2": <line2>, "bang": <q-bang>, "args": <q-args> })
command! -nargs=* -range -bang -complete=file Vista call s:load(['vista.vim'], { "cmd": "Vista", "l1": <line1>, "l2": <line2>, "bang": <q-bang>, "args": <q-args> })
command! -nargs=* -range -bang -complete=file Goyo call s:load(['limelight.vim', 'goyo.vim'], { "cmd": "Goyo", "l1": <line1>, "l2": <line2>, "bang": <q-bang>, "args": <q-args> })
command! -nargs=* -range -bang -complete=file VimwikiIndex call s:load(['vimwiki'], { "cmd": "VimwikiIndex", "l1": <line1>, "l2": <line2>, "bang": <q-bang>, "args": <q-args> })
command! -nargs=* -range -bang -complete=file VimBeGood call s:load(['vim-be-good'], { "cmd": "VimBeGood", "l1": <line1>, "l2": <line2>, "bang": <q-bang>, "args": <q-args> })
command! -nargs=* -range -bang -complete=file NV call s:load(['notational-fzf-vim'], { "cmd": "NV", "l1": <line1>, "l2": <line2>, "bang": <q-bang>, "args": <q-args> })

" Keymap lazy-loads

augroup packer_load_aucmds
  au!
  " Filetype lazy-loads
  au FileType lua ++once call s:load(['nvim-treesitter', 'BetterLua.vim'], { "ft": "lua" })
  au FileType html ++once call s:load(['vim-closetag', 'emmet-vim', 'bracey.vim'], { "ft": "html" })
  au FileType latex ++once call s:load(['vimtex'], { "ft": "latex" })
  au FileType pest ++once call s:load(['pest.vim'], { "ft": "pest" })
  au FileType javascript ++once call s:load(['emmet-vim', 'bracey.vim'], { "ft": "javascript" })
  au FileType markdown ++once call s:load(['nvim-treesitter', 'markdown-preview.nvim', 'vim-markdown'], { "ft": "markdown" })
  au FileType vim ++once call s:load(['splitjoin.vim', 'vim-test'], { "ft": "vim" })
  au FileType css ++once call s:load(['emmet-vim', 'bracey.vim'], { "ft": "css" })
  au FileType rust ++once call s:load(['nvim-treesitter', 'splitjoin.vim', 'vim-test'], { "ft": "rust" })
  au FileType python ++once call s:load(['nvim-treesitter', 'splitjoin.vim', 'vim-test'], { "ft": "python" })
  au FileType plaintex ++once call s:load(['vimtex'], { "ft": "plaintex" })
  " Event lazy-loads
  au InsertEnter * ++once call s:load(['vim-vsnip', 'vim-vsnip-integ', 'completion-nvim', 'completion-buffers'], { "event": "InsertEnter *" })
augroup END
