local utils = require("utils")

local M = {}

function M.setup()
  -- gruvbox
  vim.cmd [[colorscheme gruvbox]]
  vim.g.gruvbox_sign_column='bg0'
  vim.o.background = 'dark'

  -- customized colorscheme
  local highlights = {
    'EndOfBuffer ctermbg=bg ctermfg=bg guibg=bg guifg=bg',
    -- 'StatusLine ctermbg=bg ctermfg=bg guibg=bg guifg=bg',
    'CursorLineNr ctermbg=bg guibg=bg',
    'FloatermBorder guifg=#928374',
    'CocErrorVirtualText guibg=#3c3836 guifg=#fb4934',
    'LspDiagnosticsErrorSign guifg=#fb4934',
    'CocHintVirtualText guibg=#3c3836 guifg=#83a598',
    'LspDiagnosticsHintSign guifg=#83a598',
    'CocRustChainingHint guibg=#3c3836 guifg=#83a598',
    'CocWarningVirtualText guibg=#3c3836 guifg=#fe8019',
    'CocCursorRange guibg=#d3869b guifg=#282828',
  }

  utils.hi("CursorLineNr", "bg", "bg")
  utils.hi("EndOfBuffer", "bg", "bg", "bg", "bg")

  -- treesitter highlights
  utils.hi_link("TSKeywordFunction", "GruvboxAqua") -- original is gruvbox red
  utils.hi_link("TSInclude", "GruvboxRed") -- original is GruvboxAqua

  utils.hi_link("LspDiagnosticsError", "GruvboxRed")
  utils.hi_link("LspDiagnosticsErrorSign", "GruvboxRed")
  utils.hi_link("LspDiagnosticsErrorFloating", "GruvboxRed")

  utils.hi_link("LspDiagnosticsWarning", "GruvboxOrange")
  utils.hi_link("LspDiagnosticsWarningSign", "GruvboxOrange")
  utils.hi_link("LspDiagnosticsWarningFloating", "GruvboxOrange")

  utils.hi_link("LspDiagnosticsInformation", "GruvboxYellow")
  utils.hi_link("LspDiagnosticsInformationSign", "GruvboxYellow")
  utils.hi_link("LspDiagnosticsInformationFloating", "GruvboxYellow")

  utils.hi_link("LspDiagnosticsHint", "GruvboxBlue")
  utils.hi_link("LspDiagnosticsHintSign", "GruvboxBlue")
  utils.hi_link("LspDiagnosticsHintFloating", "GruvboxBlue")

  -- local links = {
  --     -- errors
  --     LspDiagnosticsError = 'CocErrorVirtualText',
  --     LspDiagnosticsErrorSign = 'CocErrorSign',
  --     LspDiagnosticsErrorFloating = 'CocErrorFloat',
  --     -- warnings
  --     LspDiagnosticsWarning = 'CocWarningVirtualText',
  --     LspDiagnosticsWarningSign = 'CocWarningSign',
  --     LspDiagnosticsWarningFloating = 'CocWarningFloat',
  --     -- info
  --     LspDiagnosticsInformation = 'CocInfoVirtualText',
  --     LspDiagnosticsInformationSign = 'CocInfoSign',
  --     LspDiagnosticsInformationFloating = 'CocInfoFloat',
  --     -- hints
  --     LspDiagnosticsHint = 'CocHintVirtualText',
  --     LspDiagnosticsHintSign = 'CocHintSign',
  --     LspDiagnosticsHintFloating = 'CocHintFloat',
  -- }
  -- local links = {
  --     LspDiagnosticsError = 'CocErrorVirtualText',
  --     LspDiagnosticsWarning = 'CocWarningVirtualText',
  --     LspDiagnosticsInformation = 'CocInfoVirtualText',
  --     LspDiagnosticsHint = 'CocHintVirtualText',
  -- }

  -- for from, to in pairs(links) do
  --     vim.cmd(string.format("highlight! link %s %s", from, to))
  -- end
  -- local links = {
  --     -- errors
  --     LspDiagnosticsError = 'CocErrorVirtualText',
  --     LspDiagnosticsErrorSign = 'GruvboxRed',
  --     LspDiagnosticsErrorFloating = 'GruvboxRed',
  --     -- warnings
  --     LspDiagnosticsWarning = 'CocWarningVirtualText',
  --     LspDiagnosticsWarningSign = 'GruvboxOrange',
  --     LspDiagnosticsWarningFloating = 'GruvboxOrange',
  --     -- info
  --     LspDiagnosticsInformation = 'CocInfoVirtualText',
  --     LspDiagnosticsInformationSign = 'GruvboxYellow',
  --     LspDiagnosticsInformationFloating = 'GruvboxYellow',
  --     -- hints
  --     LspDiagnosticsHint = 'CocHintVirtualText',
  --     LspDiagnosticsHintSign = 'GruvboxBlue',
  --     LspDiagnosticsHintFloating = 'GruvboxBlue',
  -- }
  -- local errors = {
  --   LspDiagnosticsError = 'CocErrorVirtualText',
  --   LspDiagnosticsErrorSign = 'GruvboxRed',
  --   LspDiagnosticsErrorFloating = 'GruvboxRed',
  -- }
  -- local warnings = {
  --   LspDiagnosticsWarning = 'CocWarningVirtualText',
  --   LspDiagnosticsWarningSign = 'GruvboxOrange',
  --   LspDiagnosticsWarningFloating = 'GruvboxOrange',
  -- }

  -- local info = {
  --   LspDiagnosticsInformation = 'CocInfoVirtualText',
  --   LspDiagnosticsInformationSign = 'GruvboxYellow',
  --   LspDiagnosticsInformationFloating = 'GruvboxYellow',
  -- }
  -- local hints = {
  --   LspDiagnosticsHint = 'CocHintVirtualText',
  --   LspDiagnosticsHintSign = 'GruvboxBlue',
  --   LspDiagnosticsHintFloating = 'GruvboxBlue',
  -- }

  -- local highlighter = require'highlighter'

  -- for key, _ in pairs(errors) do
  --   local info = highlighter.extract_fg('GruvboxRed')
  --   local command = string.format("highlight %s %s guibg=NONE", key, info)
  --   vim.cmd(command)
  -- end

  -- for key, _ in pairs(warnings) do
  --   local info = highlighter.extract_fg('GruvboxOrange')
  --   local command = string.format("highlight %s %s guibg=NONE", key, info)
  --   vim.cmd(command)
  -- end

  -- for key, _ in pairs(info) do
  --   local info = highlighter.extract_fg('GruvboxYellow')
  --   local command = string.format("highlight %s %s guibg=NONE", key, info)
  --   vim.cmd(command)
  -- end

  -- for key, _ in pairs(hints) do
  --   local info = highlighter.extract_fg('GruvboxBlue')
  --   local command = string.format("highlight %s %s guibg=NONE", key, info)
  --   vim.cmd(command)
  -- end

  -- highlighter.highlight_components('CocWarningVirtualText', {
  --   fg = 'NONE',
  --   bg = 'GruvboxRed',
  -- })

  -- links lsp highlights to coc
  -- for from, to in pairs(links) do
  --     vim.cmd(string.format("highlight! link %s %s", from, to))
  -- end

  -- local background_clear = {
  --     LspDiagnosticsErrorSign = 'CocErrorSign',
  --     LspDiagnosticsWarningSign = 'CocWarningSign',
  --     LspDiagnosticsInformationSign = 'CocInfoSign',
  --     LspDiagnosticsHintSign = 'CocHintSign',
  -- }

  -- for group1, group in pairs(background_clear) do
  --     vim.cmd(string.format("highlight %s guibg=NONE", group))
  --     vim.cmd(string.format("highlight %s guibg=NONE", group1))
  -- end

  -- vim.cmd [[highlight! link LspDiagnosticsError CocErrorVirtualText]]
  -- vim.cmd [[highlight! link LspDiagnosticsErrorSign CocErrorSign]]
  -- vim.cmd [[highlight! link LspDiagnosticsErrorFloating CocErrorFloat]]
  -- vim.cmd [[highlight! link LspDiagnosticsWarning CocWarningVirtualText]]
  -- vim.cmd [[highlight! link LspDiagnosticsWarningSign CocWarningSign]]
  -- vim.cmd [[highlight! link LspDiagnosticsWarningFloating CocWarningFloat]]
  -- vim.cmd [[highlight! link LspDiagnosticsInformation CocInfoVirtualText]]
  -- vim.cmd [[highlight! link LspDiagnosticsInformationSign CocInfoSign]]
  -- vim.cmd [[highlight! link LspDiagnosticsInformationFloating CocInfoFloat]]
  -- vim.cmd [[highlight! link LspDiagnosticsHint CocHintVirtualText]]
  -- vim.cmd [[highlight! link LspDiagnosticsHintSign CocHintSign]]
  -- vim.cmd [[highlight! link LspDiagnosticsHintFloating CocHintFloat]]
end

return M
