return {
  ["rust-analyzer"] = {
    checkOnSave = {
      command = "clippy"
    },
    completion = {
      addCallArgumentSnippets = true,
      addCallParenthesis = true,
    }
  }
}