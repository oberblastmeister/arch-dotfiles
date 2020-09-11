-- Only required if you have packer in your `opt` pack
local packer_exists = pcall(vim.cmd, [[packadd packer.nvim]])

if not packer_exists then
  -- TODO: Maybe handle windows better?
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

  -- local use function
  local function get_path(name)
    local path
    if vim.fn.isdirectory(vim.fn.expand("~/plugins/" .. name)) == 1 then
      path = "~/plugins/" .. name
    else
      path = "~/projects/" .. name
    end
    return path
  end

  local function local_use(options)
    options[1] = get_path(options[1])

    use(options)
  end

  local function rtp_use(name)
    get_path(name)
  end

  -- local function rtp_use(name

  ----------------------------- Local Plugins --------------------------------------
  local_use {
    'highlighter.nvim',
    config = function() require'highlighter'.setup() end,
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
  }

  -- turn buffers into tabs on tabline
  use {
    'mengelbrecht/lightline-bufferline',
    requires = 'itchyny/lightline.vim',
  }

  -- functions to manipulate highlight groups
  use 'wincent/pinnacle'

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
    run = function() vim.cmd [[TSInstall all]] end,
    config = function()
      require'config/lsp'.setup()
    end,
  }

  -- deoplete completion engine
  -- use {
    --     'Shougo/deoplete.nvim',
    --     setup = function() vim.cmd [[let g:deoplete#enable_at_startup = 0]] end,
    --     config = function() require'config/deoplete'.setup() end,
    --     run = 'UpdateRemotePlugins',
    --     requires = {
      --         {'Shougo/deoplete-lsp'},
      --         {'honza/vim-snippets'},
      --         {
        --             'SirVer/ultisnips',
        --             config = function() require'config/ultisnips'.setup() end,
        --         },
        --     }
        -- }

        -- lsp tagbar
        use {
          'liuchengxu/vista.vim',
          cmd = 'Vista',
          config = function()
            require'config/vista'.setup()
          end
        }

        -- diagnostic wrapper
        use {
          'nvim-lua/diagnostic-nvim',
          config = function() require'config/diagnostic'.setup() end,
        }

        -- lsp status wrapper
        use 'nvim-lua/lsp-status.nvim'

        -- better syntax highlighting (load after diagnostics and nvim-lsp)
        use {
          'nvim-treesitter/nvim-treesitter',
          config = function() require'config/treesitter'.setup() end,
        }

        -- completion engine
        use {
          'nvim-lua/completion-nvim',
          config = function() require'config/completion'.config() end,
          requires = {
            {'steelsojka/completion-buffers'},
            {
              'SirVer/ultisnips',
              config = function() require'config/ultisnips'.setup() end
            },
            'honza/vim-snippets',
            'hrsh7th/vim-vsnip',
            'hrsh7th/vim-vsnip-integ',
          },
          disable = false,
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

        ----------------------------- Fuzzy Finding ----------------------------------
        -- lua fuzzy finder
        use {
          'nvim-lua/telescope.nvim',
          requires = {
            'nvim-lua/popup.nvim',
            'nvim-lua/plenary.nvim',
          },
        }

        use {'junegunn/fzf', run = ':call fzf#install()'}
        use 'junegunn/fzf.vim'

        ----------------------------- Testing ----------------------------------
        use 'tpope/vim-dispatch'

        use {
          'janko/vim-test',
          ft = {'python', 'rust', 'vim'},
          config = function()
            vim.cmd [[let test#strategy = "vimux"]]
          end,
        }

        use {
          'hkupty/iron.nvim',
          cmd = {'IronRepl', 'IronWatchCurrentFile', 'IronSend'}
        }

        ----------------------------- Editing -------------------------------------
        use 'tpope/vim-commentary'

        use {
          'machakann/vim-sandwich',
          config = function() require'config/sandwhich'.setup() end,
        }

        -- auto close on enter
        use {'rstacruz/vim-closer', disable = true}

        -- auto end statements
        use {
          'tpope/vim-endwise',
          ft = {'vim', 'lua', 'ruby'},
          disable = true,
        }

        use 'tpope/vim-repeat'

        use {
          'AndrewRadev/switch.vim',
          config = function() require'config/switch'.setup() end,
        }

        use 'AndrewRadev/splitjoin.vim'

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

        -- terminal float
        use 'voldikss/vim-floaterm'

        -- repl sratchpad
        use {'metakirby5/codi.vim', cmd = 'Codi'}

        -- auto nohl
        use 'romainl/vim-cool'

        -- practice vim
        use {'ThePrimeagen/vim-be-good', cmd = 'VimBeGood'}

        -- profile vim
        use {'dstein64/vim-startuptime', cmd = 'StartupTime'}


        ----------------------------- Text Objects --------------------------------
        use 'kana/vim-textobj-user'
        use 'kana/vim-textobj-entire'
        use 'glts/vim-textobj-comment'
        use 'wellle/targets.vim'

        ----------------------------- Git -----------------------------------------
        use 'tpope/vim-fugitive'

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
          run = ':call mkdp#util#install()',
          ft = 'markdown'
        }

        use {'junegunn/goyo.vim', cmd = 'Goyo'}
        use {'junegunn/limelight.vim', cmd = 'Goyo'}
        use {'alok/notational-fzf-vim', cmd = 'NV'}

        use {'vimwiki/vimwiki', cmd = 'VimwikiIndex'}

        ----------------------------- Web Developement ---------------------------
        use {'mattn/emmet-vim', ft = {'html', 'css', 'javascript'}}
        use {'alvan/vim-closetag', ft = 'html'}

        use {
          'turbio/bracey.vim',
          run = 'npm install --prefix server',
          ft = {'html', 'css', 'javascript'},
        }

        ----------------------------- Language Specific --------------------------
        -- syntax highlighting pack
        use {
          'sheerun/vim-polyglot',
          -- disable on some filetypes where there are other plugins running
          setup = function()
            vim.g.polyglot_disabled = {'markdown', 'latex', 'pest', 'lua'}
          end,
          config = function() vim.g.python_highlight_space_errors = 0 end,
        }

        -- markdown mode
        use {'plasticboy/vim-markdown', ft = 'markdown'}

        -- latex mode
        use {'lervag/vimtex', ft = {'plaintex', 'latex'}}

        -- rust pest files
        use {'pest-parser/pest.vim', ft = 'pest'}

        -- better lua highlighting
        use {'euclidianAce/BetterLua.vim', ft = 'lua'}
      end)
