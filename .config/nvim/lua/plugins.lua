-- Only required if you have packer in your `opt` pack
local packer_exists = pcall(vim.cmd, [[packadd packer.nvim]])

-- install packer using git
function InstallPacker()
  -- TODO: Maybe handle windows better?
  if packer_exists then
    vim.api.nvim_err_writeln('[plugins] Packer is already installed')
    return
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

return require('packer').startup(function()
    -- let packer optionally manage itself
    use {'wbthomason/packer.nvim', opt = true}

    local dirs = {
      "~/plugins/",
      "~/projects/",
    }

    -- return the path of the name in dirs or nil if the name is not in dirs
    local function name_in_dirs(name)
      for _, dir in ipairs(dirs) do
        if vim.fn.isdirectory(vim.fn.expand(dir .. name)) == 1 then
          return dir .. name
        end
      end
    end

    -- get the full path from the short name or return the path if the path is already full path
    local function get_path(name)
      if string.find(name, '/') == nil then
        return name_in_dirs(name)
      else
        return name
      end
    end

    -- local use function
    local function local_use(options)
      local path = get_path(options[1])
      if path == nil then
        vim.api.nvim_err_writeln('[plugins] ' .. options[1] .. ' was not found in the directories ' .. vim.inspect(dirs))
        return
      end
      options[1] = path

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

    local_use {
        'rooter.nvim',
        config = function() require'config/rooter'.setup() end,
      }

      local_use {
        'termwrapper.nvim'
      }

    ----------------------------- Looks --------------------------------------
    use 'tjdevries/colorbuddy.nvim'

    use {
        'gruvbox-community/gruvbox',
        config = function() require'config/colorscheme'.setup() end,
      }

    use {
        'sainnhe/gruvbox-material',
        setup = function() vim.g.gruvbox_material_palette = 'mix' end,
      }

    use 'sainnhe/sonokai'

    -- indent lines
    use {
        'Yggdroot/indentLine',
        config = function()
          -- remove on terminal files and dashboard
          vim.g.indentLine_fileTypeExclude = {'dashboard', ''}
        end,
      }

    use {
        'tjdevries/express_line.nvim',
        config = function() require'config/express_line'.start() end,
        disable = false,
      }

    -- colorize hex codes
    use {
        'norcalli/nvim-colorizer.lua',
        config = function() require'colorizer'.setup() end,
      }

    ----------------------------- Dependencies ----------------------------------------
    use 'nvim-lua/plenary.nvim'
    use 'nvim-lua/popup.nvim'

    -- icons
    use 'kyazdani42/nvim-web-devicons'

    use 'ryanoasis/vim-devicons'


    ----------------------------- LSP/DAP ----------------------------------
    -- lsp configs
    use {
        'neovim/nvim-lspconfig',
        config = function() require'config/lsp'.setup() end,
      }

    -- completion engine
    use {
        'nvim-lua/completion-nvim',
        config = function() require'config/completion'.setup() end,
        requires = {
          'steelsojka/completion-buffers',
          {
            'SirVer/ultisnips',
            config = function() require'config/ultisnips'.setup() end,
          },
          'honza/vim-snippets',
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

    -- lsp inlay hints
    use {
        'tjdevries/lsp_extensions.nvim',
        config = function() require'config/lsp_extensions'.setup() end,
      }

    use {
        'RishabhRD/nvim-lsputils',
        config = function() require'config/lsp_utils'.setup() end,
        requires = 'RishabhRD/popfix'
      }

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

    -- linting when there is no lsp (for now cannot run multiple lsp servers)
    use {
        'w0rp/ale',
        ft = {'sh', 'markdown'},
        cmd = 'ALEEnable',
        setup = function()
          vim.g.ale_disable_lsp = 1
        end,
        config = function()
          require'config/ale'.config()
          vim.cmd [[ALEDisable]]
        end,
      }

    ----------------------------- Treesitter ----------------------------
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function() vim.cmd [[TSInstall all]] end,
        config = function() require'config/treesitter'.setup() end,
      }

    use 'nvim-treesitter/nvim-treesitter-refactor'

    use 'nvim-treesitter/nvim-treesitter-textobjects'

    use 'romgrk/nvim-treesitter-context'

    use {
        'nvim-treesitter/playground',
        cmd = 'TSPlaygroundToggle',
      }

    use 'nvim-treesitter/completion-treesitter'

    ----------------------------- Fuzzy Finding ----------------------------
    -- lua fuzzy finder
    local_use {
      'telescope.nvim',
      config = function() require'config/telescope'.setup() end,
    }

    use {
        'junegunn/fzf.vim',
        requires = {
          'junegunn/fzf',
          run = function() vim.fn['fzf#install()']() end,
        },
        config = function() require'config/fzf'.setup() end,
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
    -- local_use {
      -- 'commentary.nvim'
    -- }

    use 'tpope/vim-repeat'

    use {
        'AndrewRadev/switch.vim',
        config = function() require'config/switch'.setup() end,
      }

    use 'junegunn/vim-easy-align'

    use 'tommcdo/vim-exchange'

    ----------------------------- General -------------------------------------
    use 'tpope/vim-unimpaired'

    -- smooth scrolling
    use 'psliwka/vim-smoothie'

    -- visualize undotree
    use {'mbbill/undotree', cmd = 'UndotreeToggle'}

    -- indent aware pasting
    use 'sickill/vim-pasta'

    -- auto change to root dir
    use {
        'airblade/vim-rooter',
        cmd = 'Rooter',
        config = function() require'config/rooter'.setup() end,
        disable = true,
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
        config = function() require'config/tree'.setup() end,
        -- only turn on when yadm is not active, prevents lagging vim
        cond = function()
          return os.getenv("GIT_DIR") ~= vim.fn.expand("~/.config/yadm/repo.git")
        end,
      }

    -- terminal float for lf
    use {
        'voldikss/vim-floaterm',
        config = function() require'config/floaterm'.setup() end,
      }

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
        config = function() require'config/matchup'.setup() end,
      }

    ----------------------------- Git -----------------------------------------
    use 'tpope/vim-fugitive'

    -- use gitsigns.nvim instead
    use {
      'mhinz/vim-signify',
      config = function() require'config/signify'.setup() end,
      disable = true,
    }

    use {
      'lewis6991/gitsigns.nvim',
      config = function() require'config/gitsigns'.setup() end,
    }

    ----------------------------- Tmux ----------------------------------------
    use {
        'christoomey/vim-tmux-navigator',
        cond = function() return os.getenv('TMUX') ~= nil end,
      }

    use {
        'benmills/vimux',
        cond = function() return os.getenv('TMUX') ~= nil end,
        config = function() require'config/vimux'.setup() end,
      }

    ----------------------------- Terminal ------------------------------------
    use {
        'hkupty/iron.nvim',
        config = function()
          vim.g.iron_map_defaults = 0
          vim.g.iron_map_extended = 0
        end,
      }

    ----------------------------- Notes/Writing -------------------------------
    use {
        'iamcco/markdown-preview.nvim',
        run = function() vim.fn['mkdp#util#install']() end,
        ft = {'markdown', 'vimwiki'},
        cmd = 'MarkdownPreview',
      }

    use {
        'junegunn/goyo.vim',
        cmd = 'Goyo',
      }

    use {'junegunn/limelight.vim', cmd = 'Goyo'}

    use {
        'vimwiki/vimwiki',
        cmd = 'VimwikiIndex',
        setup = function() require'config/vimwiki'.setup() end,
      }

    use {
        'reedes/vim-pencil',
        cmd = 'Pencil',
      }

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
          vim.g.polyglot_disabled = {'markdown', 'latex', 'pest', 'lua', 'lalrpop'}
          vim.g.python_highlight_space_errors = 0
        end,
        -- ft = {},
      }

    use 'euclidianAce/BetterLua.vim'

    -- markdown mode
    use {'plasticboy/vim-markdown', ft = 'markdown', disable = true}

    -- latex mode
    use {
        'lervag/vimtex',
        ft = {'plaintex', 'tex'},
        config = function() require'config/vimtex'.setup() end,
      }

    -- rust pest files
    use 'pest-parser/pest.vim'

    use 'qnighy/lalrpop.vim'

    use {
        'tjdevries/nlua.nvim',
        ft = 'lua',
        disable = true,
      }

    use {
        'rafcamlet/nvim-luapad', cmd = 'Luapad'
      }

    use {
        'glacambre/firenvim',
        run = function() vim.fn['firenvim#install'](0) end
      }

    use {
        'Xuyuanp/scrollbar.nvim',
        disable = true,
        config = function() require'config/scrollbar'.setup() end,
      }

    -- Lisp stuff
    local sexp_filetypes = {'clojure', 'lisp', 'scheme', 'racket', 'jbuild', 'fennel', 'pddl'}

    use {
      'eraserhd/parinfer-rust',
      run = 'cargo build --release',
      ft = sexp_filetypes
    }

    use {
      'Olical/conjure',
      ft = {'fennel', 'clojure'},
    }

    use {
      'Olical/aniseed',
    }

    local_use {
      'pandoc.nvim',
    }

    use 'mhartington/formatter.nvim'
  end
)
