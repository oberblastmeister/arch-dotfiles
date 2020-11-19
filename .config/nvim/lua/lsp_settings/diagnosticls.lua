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
    }
  },

  formatters = {
    ["lua-format"] = {
      command = "lua-format",
      args = {"-i"},
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

    brittany = {
      command = "brittany",
      args = {"--write-mode=inplace"}
    },
  },

  filetypes = {
    javascript = "eslint",
    typescript = "eslint",
    -- markdown = "languagetool",
    markdown = {"markdownlint", "write-good"},
    sh = "shellcheck",
    vim = "vint",
  },

  formatFiletypes = {
    lua = "lua-format",
    sh = "shfmt",
    haskell = "brittany",
  },
}
