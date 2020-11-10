local function setup()
  vim.g.indentLine_char = '▏'
  vim.g.indentLine_fileTypeExclude = {"dashboard", ""}
end

return {
  setup = setup
}
