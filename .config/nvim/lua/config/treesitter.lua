local function setup()
    require'nvim-treesitter.configs'.setup {
        ensure_installed = "all",     -- one of "all", "language", or a list of languages
        -- ensure_installed = {"python", "bash", "rust", "lua", "c", "cpp", "toml", "regex", "yaml", "json", "java", "markdown", "html", "javascript"},
        highlight = {
            enable = true,              -- false will disable the whole extension
            disable = {},  -- list of language that will be disabled
        },
    }
end

return {
    setup = setup
}
