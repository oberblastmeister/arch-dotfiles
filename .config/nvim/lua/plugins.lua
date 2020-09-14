-- Only required if you have packer in your `opt` pack
local packer_exists = pcall(vim.cmd, [[packadd packer.nvim]])

-- install packer using git
function InstallPacker()
  -- TODO: Maybe handle windows better?
  if packer_exists then
    if vim.fn.input("Packer already exists. Are you sure that you want to download it? (y for yes)") ~= "y" then
      return
    end
  end

  if vim.fn.input("Download Packer? (y for yes)") ~= "y" then
    return
  end

  local directory = string.format(
  '%s/site/pack/packer/opt/',
  vim.fn.stdpath('data')
  )

  vim.fn.mkdir(directory, 'p')

  local out = vim.fn.system(string.format(
  'git clone %s %s',
  'https://github.com/wbthomason/packer.nvim',
  directory .. '/packer.nvim'
  ))

  print(out)
  print("Downloading packer.nvim...")
end

if not packer_exists then
  InstallPacker()
  return
end

-- packer throws error if is not on
vim.o.termguicolors = true

-- disable python 2 support
vim.g.loaded_python_provider = 0

-- command to start python3 executable
vim.g.python3_host_prog = '/usr/bin/python3'

return require('packer').startup(function()
  -- let packer optionally manage itself
  use {'wbthomason/packer.nvim', opt = true}

  local dirs = {
    "~/plugins/",
    "~/projects/",
  }

  -- get the full path from the short name
  local function get_path(name)
    for _, dir in ipairs(dirs) do
      if vim.fn.isdirectory(vim.fn.expand(dir .. name)) == 1 then
        return dir .. name
      end
    end
  end

  -- local use function
  local function local_use(options)
    options[1] = get_path(options[1])

    use(options)
  end

  -- use plugin without copying it to nvim/site
  local function rtp_use(options)
    if type(options) == "string" then
      local path = get_path(options)
      vim.cmd('set rtp+=' .. path)
    elseif type(options) == "table" then
      local path = get_path(options[1])
      vim.cmd('set rtp+=' .. path)

      -- call the config function
      if options["config"] ~= nil then
        options["config"]()
      end
    end
  end

  rtp_use {
  	'highlighter.nvim',
    config = function() require'highlighter' end,
  }

  ----------------------------- Looks --------------------------------------
  -- colorscheme
  use {
    'morhetz/gruvbox',
    config = function() require'config/colorscheme'.setup() end,
  }

  -- indent lines
  use {
    'Yggdroot/indentLine',
    config = function()
      vim.g.indentLine_fileTypeExclude = {'dashboard'}
    end,
  }

  -- status bar
  use {
    'itchyny/lightline.vim',
    config = function() require'config/lightline'.setup() end,
    disable = true,
  }

  -- turn buffers into tabs on tabline
  use {
    'mengelbrecht/lightline-bufferline',
    requires = 'itchyny/lightline.vim',
    disable = true,
  }

  use 'nvim-lua/plenary.nvim'
  use {
    'tjdevries/express_line.nvim',
    config = function() require'config/express_line'.setup() end,
  }

  -- colorize hex codes
  use {
    'norcalli/nvim-colorizer.lua',
    config = function() require'colorizer'.setup() end,
  }

  -- icons
  use 'ryanoasis/vim-devicons'

  ----------------------------- LSP/Treesitter/DAP ----------------------------------
  -- lsp configs
  use {
    'neovim/nvim-lspconfig',
    -- Todo: buggy
    -- run = function() require'config/lsp'.install() end,
    config = function() require'config/lsp'.setup() end,
  }

  -- better syntax highlighting (load after diagnostics and nvim-lsp)
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function() vim.cmd [[TSInstall all]] end,
    config = function() require'config/treesitter'.setup() end,
  }

  -- completion engine
  use {
    'nvim-lua/completion-nvim',
    config = function()
      local completion = require'config/completion'
      completion.setup()
    end,
    requires = {
      'steelsojka/completion-buffers',
      {
        'SirVer/ultisnips',
        config = function() require'config/ultisnips'.setup() end,
      },
      'honza/vim-snippets',
      'nvim-treesitter/completion-treesitter',
      'hrsh7th/vim-vsnip',
      'hrsh7th/vim-vsnip-integ',
    }
  }

  -- diagnostic wrapper
  use {
    'nvim-lua/diagnostic-nvim',
    config = function() require'config/diagnostic'.setup() end,
  }

  -- lsp status wrapper
  use 'nvim-lua/lsp-status.nvim'

  -- lsp tagbar
  use {
    'liuchengxu/vista.vim',
    cmd = 'Vista',
    config = function()
      require'config/vista'.setup()
    end
  }

  -- debug adapter client
  use {
    'puremourning/vimspector',
    run = function()
      vim.g.vimspector_install_gadgets = { 'debugpy', 'vscode-cpptools', 'CodeLLDB', 'vscode-bash-debug' }
      vim.cmd [[VimspectorInstall]]
    end,
    setup = function() vim.g.vimspector_enable_mappings = 'HUMAN' end,
    cmd = 'LaunchVimspector'
  }

  ----------------------------- Fuzzy Finding ----------------------------
  -- lua fuzzy finder
  use {
    'nvim-lua/telescope.nvim',
    requires = {
      'nvim-lua/popup.nvim',
      'nvim-lua/plenary.nvim',
    },
  }

  use {
    'junegunn/fzf.vim',
    requires = {
      'junegunn/fzf',
      run = function() vim.fn['fzf#install()']() end,
    }
  }

  ----------------------------- Testing -------------------------------------
  use {
    'tpope/vim-dispatch',
    cmd = {'Dispatch', 'Make', 'Focus', 'Start'},
  }

  use {
    'janko/vim-test',
    cmd = {'TestNearest', 'TestFile', 'TestSuite', 'TestLast', 'TestVisit'},
    config = function()
      vim.cmd [[let test#strategy = "vimux"]]
    end,
  }

  ----------------------------- Editing -------------------------------------
  use 'tpope/vim-commentary'

  use 'tpope/vim-repeat'

  use {
    'AndrewRadev/switch.vim',
    config = function() require'config/switch'.setup() end,
  }

  use {
    'AndrewRadev/splitjoin.vim',
    keys = {'n', 'gS', 'n', 'gJ'}
  }

  use 'junegunn/vim-easy-align'

  ----------------------------- General -------------------------------------
  use 'tpope/vim-unimpaired'
  use 'tpope/vim-eunuch'

  -- smooth scrolling
  use 'psliwka/vim-smoothie'

  -- visualize undotree
  use {'mbbill/undotree', cmd = 'UndotreeToggle'}

  -- zoom like tmux
  use 'dhruvasagar/vim-zoom'

  -- indent aware pasting
  use 'sickill/vim-pasta'

  -- auto change to root dir
  use {
    'airblade/vim-rooter',
    cmd = 'Rooter',
    config = function() require'config/rooter'.setup() end,
  }

  -- repl sratchpad
  use {'metakirby5/codi.vim', cmd = 'Codi'}

  -- auto nohl
  use 'romainl/vim-cool'

  -- practice vim
  use {'ThePrimeagen/vim-be-good', cmd = 'VimBeGood'}

  -- profile vim
  use {'dstein64/vim-startuptime', cmd = 'StartupTime'}

  ----------------------------- File Visualizers ----------------------------
  -- file tree lua, has issues with writing file
  use {
    'kyazdani42/nvim-tree.lua',
    cmd = 'LuaTreeFindFile',
    disable = true,
    requires = {
      'kyazdani42/nvim-web-devicons',
      cmd = 'LuaTreeFindFile',
    }
  }

  -- python file tree
  use {
    'ms-jpq/chadtree',
    branch = 'chad',
    cmd = 'CHADopen',
    run = ':UpdateRemotePlugins'
  }

  -- terminal float for lf
  use 'voldikss/vim-floaterm'

  ----------------------------- Text Objects --------------------------------
  use 'kana/vim-textobj-user'
  use 'kana/vim-textobj-entire'
  use 'glts/vim-textobj-comment'
  use 'wellle/targets.vim'

  ----------------------------- Delimiters ----------------------------------
  use {
    'machakann/vim-sandwich',
    config = function() require'config/sandwhich'.setup() end,
  }

  use 'jiangmiao/auto-pairs'

  use {
    'andymass/vim-matchup',
    event = 'VimEnter *',
    config = function() require'config/matchup'.setup() end,
  }

  ----------------------------- Git -----------------------------------------
  use 'tpope/vim-fugitive'
  use {
    'mhinz/vim-signify',
    config = function() require'config/signify'.setup() end,
  }

  ----------------------------- Tmux ----------------------------------------
  use {
    'christoomey/vim-tmux-navigator',
    cond = function() return os.getenv('TMUX') ~= nil end,
  }

  use {
    'benmills/vimux',
    cond = function() return os.getenv('TMUX') ~= nil end,
  }

  ----------------------------- Notes/Writing -------------------------------
  use {
    'iamcco/markdown-preview.nvim',
    run = function() vim.fn['mkdp#util#install']() end,
    ft = {'markdown', 'vimwiki'},
    cmd = 'MarkdownPreview',
  }

  use {'junegunn/goyo.vim', cmd = 'Goyo'}
  use {'junegunn/limelight.vim', cmd = 'Goyo'}
  use {'alok/notational-fzf-vim', cmd = 'NV'}

  use {'vimwiki/vimwiki', cmd = 'VimwikiIndex'}

  ----------------------------- Web Developement ---------------------------
  use {'mattn/emmet-vim', ft = {'html', 'css', 'javascript'}, disable = true}
  use {'alvan/vim-closetag', ft = 'html', disable = true}

  use {
    'turbio/bracey.vim',
    run = 'npm install --prefix server',
    ft = {'html', 'css', 'javascript'},
    disable = true,
  }

  ----------------------------- Language Specific --------------------------
  -- syntax highlighting pack
  use {
    'sheerun/vim-polyglot',
    -- disable on some filetypes where there are other plugins running
    setup = function()
      vim.g.polyglot_disabled = {'markdown', 'latex', 'pest', 'lua'}
      vim.g.python_highlight_space_errors = 0
    end,
  }

  -- markdown mode
  use {'plasticboy/vim-markdown', ft = 'markdown'}

  -- latex mode
  use {'lervag/vimtex', ft = {'plaintex', 'latex'}}

  -- rust pest files
  use {'pest-parser/pest.vim', ft = 'pest'}

  -- better lua highlighting
  use 'euclidianAce/BetterLua.vim'

  use {'tjdevries/nlua.nvim', disable = true}

  use {'rafcamlet/nvim-luapad', ft = 'lua'}

  use {
    'glacambre/firenvim',
    run = function() vim.fn['firenvim#install'](0) end
  }
end)
