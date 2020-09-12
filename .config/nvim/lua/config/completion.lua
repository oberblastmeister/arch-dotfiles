local function setup()
    vim.g.completion_auto_change_source = 1
    vim.cmd [[autocmd BufEnter * lua require'config/completion'.on_attach()]]
end

local function on_attach()
    local chain_complete_list = {
        default = {
            {complete_items = {'lsp', 'snippet'}},
            {complete_items = {'path'}, triggered_only = {'/'}},
            {complete_items = {'buffers'}},
        },
    }

    require'completion'.on_attach({
        matching_strategy_list= {'exact', 'substring'},
        chain_complete_list = chain_complete_list,
        completion_timer_cycle = 70,
        completion_auto_change_source = 1,
        completion_sorting = "length",
        completion_enable_snippet = "UltiSnips",
        enable_auto_signature = 1,
    })
end


return {
    setup = setup,
    on_attach = on_attach,
}
