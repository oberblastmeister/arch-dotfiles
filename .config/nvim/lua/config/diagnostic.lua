local function setup()
    vim.g.diagnostic_insert_delay = 0
    vim.g.diagnostic_show_sign = 1
    vim.g.diagnostic_enable_virtual_text = 1
    vim.g.diagnostic_virtual_text_prefix = ' '

    vim.fn.sign_define("LspDiagnosticsErrorSign", {
        text = "✘",
        texthl = "LspDiagnosticsError"
    })
    vim.fn.sign_define("LspDiagnosticsWarningSign", {
        text = "🛆",
        texthl = "LspDiagnosticsWarning"
    })
    vim.fn.sign_define("LspDiagnosticsInformationSign", {
        text = "●",
        texthl = "LspDiagnosticsInformation"
    })
    vim.fn.sign_define("LspDiagnosticsHintSign", {
        text = "○",
        texthl = "LspDiagnosticsHint"
    })
end

return {
    setup = setup
}
