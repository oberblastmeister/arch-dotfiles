local utils = require('utils')

local M = {}

function M.setup()
  -- lsp stuff
  utils.nnoremap('<c-t>', [[<cmd>lua require'telescope.builtin'.lsp_document_symbols{}<CR>]])
  utils.nnoremap('<leader>ft', [[<cmd>lua require'telescope.builtin'.lsp_workspace_symbols{}<CR>]])
  utils.nnoremap('<leader>ft', [[<cmd>lua require'telescope.builtin'.lsp_workspace_symbols{}<CR>]])
  utils.nnoremap('<leader>fa', [[<cmd>lua require'telescope.builtin'.lsp_code_actions(require('telescope.themes').get_dropdown())<CR>]])

  -- common
  utils.nnoremap('<c-b>', [[<cmd>lua require'telescope.builtin'.buffers(require('telescope.themes').get_dropdown())<cr>]])

  -- treesitter
  utils.nnoremap('<leader>fT', [[<cmd>lua require'telescope.builtin'.treesitter{}<CR>]])

  -- misc
  utils.nnoremap('<leader>fh', [[<cmd>lua require'telescope.builtin'.command_history(require('telescope.themes').get_dropdown())<CR>]])
  utils.nnoremap('<leader>fg', [[<cmd>lua require'telescope.builtin'.git_files{}<CR>]])
  utils.nnoremap('<leader>fu', [[<cmd>lua require'telescope.builtin'.oldfiles{}<CR>]])
  utils.nnoremap('<leader>fh', [[<cmd>lua require'telescope.builtin'.command_history(require('telescope.themes').get_dropdown())<CR>]])
end

-- function M.dotfiles()
--   Finder:new {
--     entry_maker = function(line) end,
--     fn_command = function() { command = "yadm" args = {"ls-files"} } end,
--     static = false,
--     maximum_results = false,
--   }
-- end

return M
