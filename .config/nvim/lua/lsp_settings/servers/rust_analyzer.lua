return {
  ["rust-analyzer"] = {
    -- checkOnSave = {
    --   command = "clippy"
    -- },
    completion = {
      addCallArgumentSnippets = true,
      addCallParenthesis = true,
    },
    assist = {
      importPrefix = true,
    },
    rustfmt = {
      override = {
        Command = "rustfmt",
      }
    }
  }
}
