local function setup()
    vim.cmd [[autocmd BufEnter * lua require'config/completion'.on_attach()]]
    vim.g.completion_enable_snippet = "UltiSnips"
end

local function on_attach()
    local chain_complete_list = {
        default = {
            {complete_items = {'lsp', 'snippet'}},
            {complete_items = {'ts'}},
            {complete_items = {'path'}, triggered_only = {'/'}},
            {complete_items = {'buffers'}},
        },
    }

    require'completion'.on_attach({
        matching_strategy_list= {'exact', 'substring'},
        chain_complete_list = chain_complete_list,
        completion_timer_cycle = 80,
        completion_auto_change_source = 1,
        completion_sorting = "length",
        completion_enable_snippet = "UltiSnips",
        enable_auto_signature = 1,
        completion_matching_ignore_case = 1,
        completion_trigger_on_delete = 1,
        completion_enable_auto_paren = 0,
    })
end


return {
    setup = setup,
    on_attach = on_attach,
}
