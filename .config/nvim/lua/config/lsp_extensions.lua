local function setup()
  -- vim.cmd [[autocmd Lsp CursorHold,CursorHoldI *.rs :silent! lua require'lsp_extensions'.inlay_hints{
  -- highlight = "Comment",
  -- prefix = " » ",
  -- aligned = false,
  -- only_current_line = false
-- }]]

  -- DART_KIND_PREFIXES = {
  --   CLASS = "",
  --   CLASS_TYPE_ALIAS = "",
  --   COMPILATION_UNIT = "ﴒ",
  --   CONSTRUCTOR = "",
  --   CONSTRUCTOR_INVOCATION = "",
  --   ENUM = "טּ",
  --   ENUM_CONSTANT = "יּ",
  --   EXTENSION = "",
  --   FIELD = "ﬧ",
  --   FILE = "",
  --   FUNCTION = "",
  --   FUNCTION_INVOCATION = "",
  --   FUNCTION_TYPE_ALIAS = "",
  --   GETTER = "",
  --   LABEL = "",
  --   LIBRARY = "",
  --   LOCAL_VARIABLE = "",
  --   METHOD = "",
  --   MIXIN = "ﭚ",
  --   PARAMETER = "",
  --   PREFIX = "並",
  --   SETTER = "",
  --   TOP_LEVEL_VARIABLE = "ﬢ",
  --   TYPE_PARAMETER = "",
  --   UNIT_TEST_GROUP = "﬽",
  --   UNIT_TEST_TEST = "",
  --   UNKNOWN = "",
  -- }

  -- require('lsp_extensions.dart.outline').telescope {
  --   kind_prefixes = DART_KIND_PREFIXES,
  --   telescope_opts = {borderchars={'▃', '▐', '▀', '▍', '▃', '▃', '▀', '▀'}}
  -- }
end

return {
  setup = setup,
}
