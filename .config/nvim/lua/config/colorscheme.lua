local function setup()
    -- gruvbox
    vim.cmd [[colorscheme gruvbox]]
    vim.g.gruvbox_sign_column='bg0'
    vim.o.background = 'dark'

    -- customized colorscheme
    local highlights = {
        'EndOfBuffer ctermbg=bg ctermfg=bg guibg=bg guifg=bg',
        'StatusLine ctermbg=bg ctermfg=bg guibg=bg guifg=bg',
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

    for _,value in ipairs(highlights) do
        vim.cmd('highlight ' .. value)
    end
end

return {
    setup = setup
}
