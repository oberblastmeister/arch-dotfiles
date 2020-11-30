-- diagnosticls init_options to be imported when .setup is called (init_options key)

return {
  linters = {
    shellcheck = {
      command = "shellcheck",
      debounce = 100,
      args = {
        "--format",
        "json",
        "-"
      },
      sourceName = "shellcheck",
      parseJson = {
        line = "line",
        column = "column",
        endLine = "endLine",
        endColumn = "endColumn",
        message = "${message} [${code}]",
        security = "level"
      },
      securities = {
        error = "error",
        warning = "warning",
        info = "info",
        style = "hint"
      }
    },

    -- lint markdown
    markdownlint = {
      command = "markdownlint",
      isStderr = true,
      debounce = 100,
      args = { "--stdin" },
      offsetLine = 0,
      offsetColumn = 0,
      sourceName = "markdownlint",
      formatLines = 1,
      formatPattern = {
         '^.*:(\\d+)\\s+(.*)$',
         -- "^.*?:\\s+(\\d+):\\s+(.*)(\\r|\\n)*$",
        {
          line = 1,
          column = -1,
          message = 2
        }
      }
    },

    ["write-good"] = {
      command = "write-good",
      debounce = 100,
      args = { "--text=%text" },
      offsetLine = 0,
      offsetColumn = 1,
      sourceName = "write-good",
      formatLines = 1,
      formatPattern = {
        "(.*)\\s+on\\s+line\\s+(\\d+)\\s+at\\s+column\\s+(\\d+)\\s*$",
        {
          line = 2,
          column = 3,
          message = 1
        }
      }
    },

    languagetool = {
      command = "languagetool",
      debounce = 1500,
      args = {"%filepath"},
      -- args = {"-"},
      offsetLine = 0,
      offsetColumn = 0,
      sourceName = "languagetool",
      formatLines = 2,
      formatPattern = {
        "^\\d+?\\.\\)\\s+Line\\s+(\\d+),\\s+column\\s+(\\d+),\\s+([^\\n]+)\nMessage:\\s+(.*)(\\r|\\n)*$",
        {
          line = 1,
          column = 2,
          message = {4, 3}
        }
      },
    },

    vint = {
      command = "vint",
      debounce = 100,
      args = { "--enable-neovim", "-"},
      offsetLine = 0,
      offsetColumn = 0,
      sourceName = "vint",
      formatLines = 1,
      formatPattern = {
        "[^:]+:(\\d+):(\\d+):\\s*(.*)(\\r|\\n)*$",
        {
          line = 1,
          column = 2,
          message = 3
        }
      }
    },

    eslint = {
      command = "./node_modules/.bin/eslint",  -- this will find local eslint first, if local eslint not found, it
      rootPatterns = {
        ".git"
      },
      debounce = 100,
      args = {
        "--stdin",
        "--stdin-filename",
        "%filepath",
        "--format",
        "json"
      },
      sourceName = "eslint",
      parseJson = {
        errorsRoot = "[0].messages",
        line = "line",
        column = "column",
        endLine = "endLine",
        endColumn = "endColumn",
        message = "${message} [${ruleId}]",
        security = "severity"
      },
      securities = {
        [2] = "error",
        [1] = "warning",
      }
    },

    cpplint = {
      command = "cpplint",
      args = {"%file"},
      debounce = 100,
      isStderr = true,
      isStdout = false,
      sourceName = "cpplint",
      offsetLine = 0,
      offsetColumn = 0,
      formatPattern = {
        "^[^:]+:(\\d+):(\\d+)?\\s+([^:]+?)\\s\\[(\\d)\\]$",
        {
          line = 1,
          column = 2,
          message = 3,
          security = 4
        }
      },
      securities = {
        [1] = "info",
        [2] = "warning",
        [3] = "warning",
        [4] = "error",
        [5] = "error"
      }
    },

    -- cppcheck = {
    --   command = "cppcheck",
    --   args = {"%file"},
    --   debounce = 100,
    --   isStderr = true,
    --   isStdout = false,
    --   offsetLine = 0,
    --   offsetColumn = 0,
    --   formatPattern = {
    --     "^[^:]+:(\\d+):(\\d+):\\s+([^:]+)\\s([^:])$"
    --     {
    --       line = 1,
    --       column = 2,
    --       security = 3,
    --       message = 4,
    --     }
    --   },
    --   securities = {
    --     note = "warning",
    --     error = "error",
    --   }
    -- },

    hlint = {
      command = "hlint",
      debounce = 100,
      args = {"--json", "-"},
      sourceName = "hlint",
      parseJson = {
        line = "startLine",
        column = "startColumn",
        endLine = "endLine",
        endColumn = "endColumn",
        message = "${hint}",
        security = "severity"
      },
      securities = {
        Error = "error",
        Warning = "warning",
        Suggestion = "info"
      }
    },

    -- latex linting
    textidote = {
      command = "textidote",
      debounce = 500,
      args = {"--check", "en_GB", "--output", "singleline"},
      offsetLine = 0,
      offsetColumn = 0,
      sourceName = "textidote",
      formatLines = 1,
      formatPattern = {
        "^[^ ]+?\\(L(\\d+)C(\\d+)-L(\\d+)C(\\d+)\\)[^:]*?:(.*)\".*\"(\\r|\\n)*$",
        {
          line = 1,
          column = 2,
          endLine = 3,
          endColumn = 4,
          message = 5
        }
      },
    },

    fish = {
      command = "fish",
      args = {"-n", "%file"},
      isStdout = false,
      isStderr = true,
      sourceName = "fish",
      formatLines = 1,
      formatPattern = {
        "^.*\\(line (\\d+)\\): (.*)$",
        {
          line = 1,
          message = 2
        }
      }
    }

  },

  formatters = {
    ["lua-format"] = {
      command = "lua-format",
      args = {"-i", [[--indent-width]], "2"},
    },

    shfmt = {
      command = "shfmt"
    },

    prettier = {
      command = "prettier", -- installed globally, or "./node_modules/.bin/prettier" for local install
      args = {"--stdin", "--stdin-filepath", "%filepath"},
      rootPatterns = {
        ".prettierrc",
        ".prettierrc.json",
        ".prettierrc.toml",
        ".prettierrc.json",
        ".prettierrc.yml",
        ".prettierrc.yaml",
        ".prettierrc.json5",
        ".prettierrc.js",
        ".prettierrc.cjs",
        "prettier.config.js",
        "prettier.config.cjs"
      }
    },

    prettier_standard = {
      command = "prettier-standard", -- installed globally, or "./node_modules/.bin/prettier-standard" for local install
      args = {"--stdin"}
    },

    fish_indent = {
      command = "fish_indent"
    },

  },

  filetypes = {
    javascript = "eslint",
    typescript = "eslint",

    -- markdown = "languagetool",
    markdown = {"markdownlint", "write-good"},

    sh = "shellcheck",
    fish = "fish",

    vim = "vint",

    latex = "textidote",

    c = "cpplint",
    cpp = "cpplint",

    haskell = "hlint",
  },

  formatFiletypes = {
    lua = "lua-format",
    sh = "shfmt",
    fish = "fish_indent"
  },
}
