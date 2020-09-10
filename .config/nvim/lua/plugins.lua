-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer in your `opt` pack
vim.cmd [[packadd packer.nvim]]
-- Only if your version of Neovim doesn't have https://github.com/neovim/neovim/pull/12632 merged
vim._update_package_paths()

-- packer throws error if is not on
vim.cmd [[set termguicolors]]

return require('packer').startup(function()
    -- let packer optionally manage itself
    use {'wbthomason/packer.nvim', opt = true}

    ----------------------------- Looks --------------------------------------
    use {
        'morhetz/gruvbox',
        config = function()
            vim.cmd [[colorscheme gruvbox]]
            vim.cmd [[set background=dark]]
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
        config = function()   
            require'nvim_lsp'.rust_analyzer.setup{}
            require'nvim_lsp'.pyls.setup{}
            require'nvim_lsp'.vimls.setup{}
        end,
    }

    use {
        'nvim-lua/completion-nvim',
        config = function()
            vim.cmd [[autocmd! BufEnter * lua require'completion'.on_attach()]]
        end,
    }

    use {
        'nvim-lua/diagnostic-nvim',
        config = function()
            vim.cmd [[autocmd! BufEnter * lua require'diagnostics'.on_attach()]]
        end
    }

    use 'steelsojka/completion-buffers'

    use 'nvim-lua/lsp-status.nvim'

    use 'nvim-lua/popup.nvim'
    use 'nvim-lua/plenary.nvim'
    use 'nvim-lua/telescope.nvim'

    use 'tmsvg/pear-tree'

    use 'liuchengxu/vim-which-key'

    -- debug adapter client
    use {
        'puremourning/vimspector',
        run = function()
            vim.g.vimspector_install_gadgets = { 'debugpy', 'vscode-cpptools', 'CodeLLDB', 'vscode-bash-debug' }
            vim.cmd [['VimspectorInstall']]
        end,
        setup = function() vim.g.vimspector_enable_mappings = 'HUMAN' end,
    }

    use {'junegunn/fzf', run = ':call fzf#install()'}
    use 'junegunn/fzf.vim'

    use 'tpope/vim-dispatch'

    use {'janko/vim-test', ft = {'python', 'rust', 'vim'}}

    use 'liuchengxu/vista.vim'

    -- auto nohl
    use 'romainl/vim-cool'

    -- practice vim
    use {'ThePrimeagen/vim-be-good', cmd = 'VimBeGood'}

    ----------------------------- Editing -------------------------------------
    use 'tpope/vim-commentary'

    use {
        'machakann/vim-sandwich',
        config = vim.cmd [[runtime macros/sandwich/keymap/surround.vim]],
    }

    -- use '~/.local/share/nvim/site/pack/packer/start/macros/sandwich/keymap/surround.vim'

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
    use 'wellle/targets.vim'

    ----------------------------- Git -----------------------------------------
    use 'tpope/vim-fugitive'

    ----------------------------- Tmux ----------------------------------------
    -- use 'christoomey/vim-tmux-navigator', Cond($TMUX != '')
    -- use 'benmills/vimux', Cond($TMUX != '')

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
            vim.g.polyglot_disabled = {'markdown', 'latex', 'pest'}
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
    use {'euclidianAce/BetterLua.vim', ft = 'lua'}
end)
