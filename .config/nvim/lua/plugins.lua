vim.cmd [[packadd packer.nvim]]
-- Only if your version of Neovim doesn't have https://github.com/neovim/neovim/pull/12632 merged
vim._update_package_paths()

-- packer throws error if is not on
vim.o.termguicolors = true

-- disable python 2 support
vim.g.loaded_python_provider = 0

-- command to start python3 executable
vim.g.python3_host_prog = '/usr/bin/python3'

return require('packer').startup(function()
    -- let packer optionally manage itself
    use {'wbthomason/packer.nvim', opt = true}

    ----------------------------- Looks --------------------------------------
    -- colorscheme
    use {
        'morhetz/gruvbox',
        config = function()
            vim.cmd [[colorscheme gruvbox]]
            vim.g.gruvbox_sign_column='bg0'
            vim.o.background = 'dark'
        end,
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
    use {'wincent/pinnacle'}

    -- colorize hex codes
    use {
        'norcalli/nvim-colorizer.lua',
        config = function() require'colorizer'.setup() end,
    }

    ----------------------------- LSP/Treesitter/DAP ----------------------------------
    -- lsp configs
    use {
        'neovim/nvim-lspconfig',
        config = function()
          require'config/lsp'.setup()
        end,
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
            {'honza/vim-snippets'},
            {'hrsh7th/vim-vsnip'},
            {'hrsh7th/vim-vsnip-integ'},
        },
        disable = false,
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

    use 'nvim-lua/lsp-status.nvim'

    -- better syntax highlighting (load after diagnostics and nvim-lsp)
    use {
        'nvim-treesitter/nvim-treesitter',
        config = function() require'config/treesitter'.setup() end,
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
        ft = {'vim', 'lua', 'ruby'}
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
    use {'christoomey/vim-tmux-navigator'}

    use {'benmills/vimux'}

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
