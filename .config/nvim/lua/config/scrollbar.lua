local function setup()
  vim.cmd [[augroup ScrollbarInit]]
  vim.cmd [[autocmd!]]
  vim.cmd [[autocmd CursorMoved,VimResized,QuitPre * silent! lua require('scrollbar').show()]]
  vim.cmd [[autocmd WinEnter,FocusGained           * silent! lua require('scrollbar').show()]]
  vim.cmd [[autocmd WinLeave,FocusLost             * silent! lua require('scrollbar').clear()]]
  vim.cmd [[augroup end]]
end

return {
  setup = setup
}
