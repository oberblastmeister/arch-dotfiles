local use = require"packer".use

local function setup()
  ----------------------------- Language Specific --------------------------
  -- syntax highlighting pack
  use {
    "sheerun/vim-polyglot",
    setup = function() require'config/polyglot'.setup() end,
    disable = true,
  }

  use {
    "neovimhaskell/haskell-vim",
    setup = function() require"config/polyglot/haskell".setup() end,
  }

  use {
    "euclidianAce/BetterLua.vim",
    ft = "lua",
    disable = true,
  }

  -- latex mode
  use {
    "lervag/vimtex",
    ft = {"plaintex", "tex"},
    config = function()
      require "config/vimtex".setup()
    end,
  }

  -- rust pest files
  use "pest-parser/pest.vim"

  use "qnighy/lalrpop.vim"

  use {
    "glacambre/firenvim",
    run = function()
      vim.fn["firenvim#install"](0)
    end
  }

  -- Lisp stuff
  local sexp_filetypes = {"clojure", "lisp", "scheme", "racket", "jbuild", "fennel", "pddl"}

  -- use {
  --   "eraserhd/parinfer-rust",
  --   run = "cargo build --release",
  --   ft = sexp_filetypes,
  -- }

  use {
    "Olical/conjure",
    ft = {"fennel", "clojure"}
  }

  use {
    "Olical/aniseed"
  }
end

return {
  setup = setup
}
