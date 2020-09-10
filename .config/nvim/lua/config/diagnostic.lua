local function setup()
    vim.g.diagnostic_insert_delay = 1
    vim.g.diagnostic_show_sign = 1
    vim.g.diagnostic_enable_virtual_text = 0
end

return {
    setup = setup
}
