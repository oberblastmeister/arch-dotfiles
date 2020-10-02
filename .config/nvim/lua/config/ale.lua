local function config()
  vim.g.ale_linters = {
    sh = {'shellcheck'},
    -- markdown = {'markdownlint', 'languagetool'},
    markdown = {'languagetool'},
  }
end

return {
  config = config
}
