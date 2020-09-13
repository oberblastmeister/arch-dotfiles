local function setup()
    vim.g.signify_sign_ad = '┃'
    vim.g.signify_sign_delet = '┃'
    vim.g.signify_sign_delete_first_lin = '┃'
    vim.g.signify_sign_chang = '┃'
    vim.g.signify_sign_show_count = 1
    vim.g.signify_sign_show_text = 1
    vim.g.signify_disable_by_default = 0
    vim.g.signify_line_highlight = 0
end

return {
    setup = setup
}
