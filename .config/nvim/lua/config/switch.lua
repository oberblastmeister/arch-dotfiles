local function setup()
    vim.g.switch_custom_definitions = {
        {'foo', 'bar', 'baz'},
        {'0', '1'},
        {'==', '!='},
        {'&', '|'},
        {'&&', '||'},
        {'and', 'or'},
        {'on', 'off'},
        {'yes', 'no'},
        {'vim', 'emacs'},
    }
end

return {
    setup = setup
}
