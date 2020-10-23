local utils = require("utils")

local M = {}

function M.setup_gruvbox()
  utils.hi {
    group = "CursorLineNr",
    guibg = "bg",
    guifg = "bg",
  }

  utils.hi {
    group = "EndOfBuffer",
    guibg = "bg",
    guifg = "bg",
    ctermbg = "bg",
    ctermfg = "bg",
  }

  -- treesitter highlights
  utils.hi_link("TSKeywordFunction", "GruvboxAqua") -- original is gruvbox red
  utils.hi_link("TSInclude", "GruvboxRed") -- original is GruvboxAqua
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
end

function M.setup()
  -- gruvbox
  vim.cmd [[colorscheme gruvbox]]
  vim.g.gruvbox_sign_column='bg0'
  vim.o.background = 'dark'

  M.setup_gruvbox()

  -- customized colorscheme
  -- local highlights = {
  --   'EndOfBuffer ctermbg=bg ctermfg=bg guibg=bg guifg=bg',
  --   -- 'StatusLine ctermbg=bg ctermfg=bg guibg=bg guifg=bg',
  --   'CursorLineNr ctermbg=bg guibg=bg',
  --   'FloatermBorder guifg=#928374',
  --   'CocErrorVirtualText guibg=#3c3836 guifg=#fb4934',
  --   'LspDiagnosticsErrorSign guifg=#fb4934',
  --   'CocHintVirtualText guibg=#3c3836 guifg=#83a598',
  --   'LspDiagnosticsHintSign guifg=#83a598',
  --   'CocRustChainingHint guibg=#3c3836 guifg=#83a598',
  --   'CocWarningVirtualText guibg=#3c3836 guifg=#fe8019',
  --   'CocCursorRange guibg=#d3869b guifg=#282828',
  -- }
end

return M
