local function setup()
  -- remove markdown parser for now
  -- require "nvim-treesitter.parsers".get_parser_configs().markdown = nil
  -- require "nvim-treesitter.parsers".get_parser_configs().haskell = nil --haskell will crash the editor

  require'nvim-treesitter.configs'.setup {
    ensure_installed = "maintained",     -- one of "all", "language", or a list of languages

    highlight = {
      enable = true,
      -- use_languagetree = true, -- language injection (highly unstable)
      -- disable = {"haskell"},  -- list of language that will be disabled
      disable = {},
      custom_captures = {}
    },

    indent = {
      enable = false,
    },

    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "<CR>",
        node_incremental = "<CR>",
        scope_incremental = "<c-s>",
        node_decremental = "<BS>",
      },
    },

    refactor = {
      -- highlight_definitions = { enable = true },
      -- highlight_current_scope = { enable = true },

      smart_rename = {
        enable = true,
        keymaps = {
          smart_rename = "<leader>tr",
        },
      },

      navigation = {
        enable = true,
        keymaps = {
          goto_definition = "<c-\\>",
          -- list_definitions = "gnD",
          list_definitions_toc = "gO",
          goto_next_usage = "]t",
          goto_previous_usage = "[t",
        },
      },
    },

    textobjects = {
      select = {
        enable = true,
        keymaps = {
          -- You can use the capture groups defined in textobjects.scm
          ["af"] = "@function.outer",
          ["if"] = "@function.inner",

          ["iF"] = {
            python = "(function_definition) @function",
            cpp = "(function_definition) @function",
            c = "(function_definition) @function",
            java = "(method_declaration) @function",
          },

          ["ac"] = "@class.outer",
          ["ic"] = "@class.inner",

          -- mneumonic: inner arg
          ["ia"] = "@parameter.inner",

          ["as"] = "@statement.outer",

          ["ib"] = "@block.inner",
          ["ab"] = "@block.outer",

          -- mneumonic: inner if
          ["ii"] = "@conditional.inner",
          ["ai"] = "@conditional.outer",

          ["il"] = "@loop.inner",
          ["al"] = "@loop.outer",

          ["iC"] = "@call.inner",
          ["aC"] = "@call.outer",
        }
      },

      move = {
        enable = true,
        goto_next_start = {
          ["]m"] = "@function.outer",
          ["]]"] = "@class.outer",
        },
        goto_next_end = {
          ["]M"] = "@function.outer",
          ["]["] = "@class.outer",
        },
        goto_previous_start = {
          ["[m"] = "@function.outer",
          ["[["] = "@class.outer",
        },
        goto_previous_end = {
          ["[M"] = "@function.outer",
          ["[]"] = "@class.outer",
        },
      },

      -- same keys as above but prefixed with s for swap
      swap = {
        enable = true,
        swap_next = {
          ["<leader>a"] = "@parameter.inner",
          ["<leader>sm"] = "@function.outer",
          ["<leader>s]"] = "@class.outer",
        },
        swap_previous = {
          ["<leader>A"] = "@parameter.inner",
          ["<leader>sM"] = "@function.outer",
          ["<leader>s["] = "@class.outer",
        },
      },

      -- menumonic: def function
      lsp_interop = {
        enable = true,
        peek_definition_code = {
          ["<leader>df"] = "@function.outer",
          ["<leader>dF"] = "@class.outer",
        },
      },

      query_linter = {
        enable = true,
        use_virtual_text = true,
        lint_events = {"BufWrite", "CursorHold"},
      }
    }
  }
end

return {
  setup = setup
}
