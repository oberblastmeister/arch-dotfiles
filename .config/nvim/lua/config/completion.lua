local function config()
    vim.g.completion_auto_change_source = 1
    vim.g.completion_enable_snippet = 'vim-vsnip'
    vim.g.completion_matching_strategy_list = {'exact', 'substring'}
    vim.g.diagnostic_virtual_text_prefix = ' '
    vim.g.completion_confirm_key = [[\<C-y>]]
    -- vim.g.UltiSnipsExpandTrigger="<c-l>"

    vim.g.completion_chain_complete_list = {
        default = {
            default = {
                {complete_items = {'lsp', 'snippet'}},
                {complete_items = {'ts'}},
                {complete_items = {'path'}},
                {complete_items = {'buffers'}},
            }
        }
    }
end

local function start()
    local completion = require('completion')
    completion.on_attach()
    vim.cmd [[autocmd BufEnter * lua require'completion'.on_attach()]]
end

return {
    config = config,
    start = start,
}
