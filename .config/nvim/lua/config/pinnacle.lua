local function setup()
    vim.cmd('highlight LspDiagnosticsError ' .. vim.fn['pinnacle#decorate']('underline', 'GruvboxRed'))

    vim.cmd('highlight LspDiagnosticsHint ' .. vim.fn['pinnacle#decorate']('underline', 'GruvboxBlue'))
    vim.cmd('highlight LspDiagnosticsHint ' .. vim.fn['pinnacle#decorate']('underline', 'GruvboxBlue'))

    execute 'highlight LspDiagnosticsHintSign ' . pinnacle#highlight({
        \   'bg': pinnacle#extract_bg('ColorColumn'),
        \   'fg': pinnacle#extract_fg('Type')
        \ })

        execute 'highlight LspDiagnosticsErrorSign ' . pinnacle#highlight({
            \   'bg': pinnacle#extract_bg('ColorColumn'),
            \   'fg': pinnacle#extract_fg('ErrorMsg')
            \ })
        end
