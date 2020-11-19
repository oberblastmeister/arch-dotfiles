-- diagnosticls init_options to be imported when .setup is called (init_options key)

return {
  pyls = {
    configurationSources = {"pycodestyle", "pyflakes"},
    plugins = {
      jedi_completion = {
        enabled = true,
        fuzzy = false,
      },
      mccabe = {
        enabled = true
      },
      pycodestyle = {
        enabled = true
      },
      pydocstyle = {
        enabled = true
      },
      pyflakes = {
        enabled = true
      },
      pylint = {
        enabled = false
      },
      rope_completion = {
        enabled = true
      },
      yapf = {
        enabled = true
      },
      -- mypy type checking
      pyls_mypy = {
        enabled = true,
        live_mode = true,
      }
    }
  }
}
