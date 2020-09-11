local function config()
    vim.g.completion_auto_change_source = 1
    vim.g.completion_sorting = "length"
    vim.g.completion_enable_snippet = 'UltiSnips'
    vim.g.completion_matching_strategy_list = {'exact', 'substring', 'fuzzy'}
    vim.g.completion_timer_cycle = 80

    vim.cmd [[autocmd BufEnter * lua require'completion'.on_attach()]]

    vim.g.completion_chain_complete_list = {
        {complete_items = {'lsp', 'snippet'}},
        {complete_items = {'path'}},
        {complete_items = {'buffers'}},
    }
end


return {
    config = config,
}
