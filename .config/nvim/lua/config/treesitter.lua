local function setup()
  require'nvim-treesitter.configs'.setup {
    ensure_installed = "all",     -- one of "all", "language", or a list of languages
    highlight = {
      enable = false,
      disable = {},  -- list of language that will be disabled
    },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "<BS>",
        node_incremental = "<BS>",
        scope_incremental = "<c-s>",
        node_decremental = "<A-BS>",
      },
    },
    refactor = {
      highlight_definitions = { enable = true },
      highlight_current_scope = { enable = true },
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
          ["ac"] = "@class.outer",
          ["ic"] = "@class.inner",

          ["iF"] = {
            python = "(function_definition) @function",
            cpp = "(function_definition) @function",
            c = "(function_definition) @function",
            java = "(method_declaration) @function",
          },
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
      swap = {
        enable = true,
        swap_next = {
          ["<leader>a"] = "@parameter.inner",
        },
        swap_previous = {
          ["<leader>A"] = "@parameter.inner",
        },
      },
      lsp_interop = {
        enable = true,
        peek_definition_code = {
          ["<leader>df"] = "@function.outer",
          ["<leader>dF"] = "@class.outer",
        },
      },
    }
  }
end

return {
  setup = setup
}
