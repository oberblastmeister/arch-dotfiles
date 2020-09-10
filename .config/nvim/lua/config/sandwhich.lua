local function setup()
    vim.cmd [[runtime macros/sandwich/keymap/surround.vim]]

    local sandwhich_recipes = vim.g['sandwich#recipes']

    local auto_indent = {
        {
            buns = {'{', '}'},
            motionwise = {'line'},
            kind = {'delete'},
            linewise = 1,
            command = {"'[,']normal! <<"},
        },
        {
            buns = {'(', ')'},
            motionwise = {'line'},
            kind = {'add'},
            linewise = 1,
            command = {"'[+1,']-1normal! >>"},
        },
        {
            buns = {'(', ')'},
            motionwise = {'line'},
            kind = {'delete'},
            linewise = 1,
            command = {"'[,']normal! <<"},
        },
        {
            buns = {'[', ']'},
            motionwise = {'line'},
            kind = {'add'},
            linewise = 1,
            command = {"'[+1,']-1normal! >>"},
        },
        {
            buns = {'[', ']'},
            motionwise = {'line'},
            kind = {'delete'},
            linewise = 1,
            command = {"'[,']normal! <<"},
        }
    }

    local bracket_with_spaces = {
        {
            buns = {'{ ', ' }'},
            nesting = 1,
            match_syntax = 1,
            motionwise = {'char', 'block'},
            kind = {'add', 'replace'},
            action = {'add'},
            input = {'}'}
        },
        {
            buns = {'[ ', ' ]'},
            nesting = 1,
            match_syntax = 1,
            motionwise = {'char', 'block'},
            kind = {'add', 'replace'},
            action = {'add'},
            input = {'}'}
        },
        {
            buns = {'( ', ' )'},
            nesting = 1,
            match_syntax = 1,
            motionwise = {'char', 'block'},
            kind = {'add', 'replace'},
            action = {'add'},
            input = {')'}
        },
        {
            buns = {[[{\s*]], [[\s*}]]},
            nesting = 1,
            regex = 1,
            match_syntax = 1,
            motionwise = {'char', 'block'},
            kind = {'delete', 'replace', 'textobj'},
            action = {'delete'},
            input = {'{'}
        },
        {
            buns = {[[\[\s*]], [[\s*\]]},
            nesting = 1,
            regex = 1,
            match_syntax = 1,
            motionwise = {'char', 'block'},
            kind = {'delete', 'replace', 'textobj'},
            action = {'delete'},
            input = {'['}
        },
        {
            buns = {[[(\s*]], [[\s*)]]},
            nesting = 1,
            regex = 1,
            match_syntax = 1,
            motionwise = {'char', 'block'},
            kind = {'delete', 'replace', 'textobj'},
            action = {'delete'},
            input = {'('}
        },
    }

    table.insert(sandwhich_recipes, auto_indent)
    table.insert(sandwhich_recipes, bracket_with_spaces)
end

return {
    setup = setup
}
