-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer in your `opt` pack
vim.cmd [[packadd packer.nvim]]
-- Only if your version of Neovim doesn't have https://github.com/neovim/neovim/pull/12632 merged
vim._update_package_paths()

-- packer throws error if is not on
vim.o.termguicolors = true

return require('packer').startup(function()
    -- let packer optionally manage itself
    use {'wbthomason/packer.nvim', opt = true}

    ----------------------------- Looks --------------------------------------
    use {
        'morhetz/gruvbox',
        config = function()
            vim.cmd [[colorscheme gruvbox]]
            vim.o.background = 'dark'
        end,
    }

    use 'itchyny/lightline.vim'

    -- turn buffers into tabs on tabline
    use 'mengelbrecht/lightline-bufferline'

    -- functions to manipulate highlight groups
    use 'wincent/pinnacle'

    use {
        'norcalli/nvim-colorizer.lua',
        config = function() require'colorizer'.setup() end,
    }

    ----------------------------- Important ----------------------------------
    use {
        'neovim/nvim-lspconfig',
        config = function() require'config/lsp'.setup() end,
    }

    use {
        'nvim-treesitter/nvim-treesitter',
        config = function() require'config/treesitter'.setup() end,
    }

    use {
        'nvim-lua/completion-nvim',
        event = 'InsertEnter *',
        config = function()
            local completion = require'config/completion'
            completion.config()
            completion.start()
        end,
        requires = {
            {'hrsh7th/vim-vsnip', event = 'InsertEnter *'},
            {'hrsh7th/vim-vsnip-integ', event = 'InsertEnter *'},
            {'steelsojka/completion-buffers', event = 'InsertEnter *'},
        }
    }

    use {
        'nvim-lua/diagnostic-nvim',
        config = function() require'config/diagnostic'.setup() end,
    }

    use 'nvim-lua/lsp-status.nvim'

    use {
        'nvim-lua/telescope.nvim',
        requires = {
            'nvim-lua/popup.nvim',
            'nvim-lua/plenary.nvim',
        },
    }

    use 'liuchengxu/vim-which-key'

    -- debug adapter client
    use {
        'puremourning/vimspector',
        run = function()
            vim.g.vimspector_install_gadgets = { 'debugpy', 'vscode-cpptools', 'CodeLLDB', 'vscode-bash-debug' }
            vim.cmd [[VimspectorInstall]]
        end,
        setup = function() vim.g.vimspector_enable_mappings = 'HUMAN' end,
    }

    use {'junegunn/fzf', run = ':call fzf#install()'}
    use 'junegunn/fzf.vim'

    use 'tpope/vim-dispatch'

    use {'janko/vim-test', ft = {'python', 'rust', 'vim'}}

    use {
        'liuchengxu/vista.vim',
        cmd = 'Vista'
    }

    -- auto nohl
    use 'romainl/vim-cool'

    -- practice vim
    use {'ThePrimeagen/vim-be-good', cmd = 'VimBeGood'}

    use {'dstein64/vim-startuptime', cmd = 'StartupTime'}

    ----------------------------- Editing -------------------------------------
    use 'tpope/vim-commentary'

    use {
        'machakann/vim-sandwich',
        config = function() require'config/sandwhich'.setup() end,
    }

    use 'tpope/vim-repeat'

    use 'AndrewRadev/switch.vim'

    use {'AndrewRadev/splitjoin.vim', ft = {'python', 'rust', 'vim'}}

    use 'junegunn/vim-easy-align'

    ----------------------------- General -------------------------------------
    use 'tpope/vim-unimpaired'
    use 'tpope/vim-eunuch'
    use 'psliwka/vim-smoothie'
    use {'mbbill/undotree', cmd = 'UndotreeToggle'}

    use 'dhruvasagar/vim-zoom'

    use 'sickill/vim-pasta'

    use 'airblade/vim-rooter'

    use 'voldikss/vim-floaterm'

    use {'metakirby5/codi.vim', cmd = 'Codi'}

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

    -- use {
    --     'christoomey/vim-tmux-navigator',
    --     -- cond = function() return os.getenv("TMUX") != nil end,
    --     cond = 'os.getenv("TMUX") != nil',
    -- }

    -- use {
    --     'benmills/vimux',
    --     cond = function() return os.getenv("TMUX") != nil end,
    -- }

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
