local function setup()
  vim.cmd [[autocmd CursorHold,CursorHoldI *.rs :silent! lua require'lsp_extensions'.inlay_hints{
    highlight = "Comment",
    prefix = " » ",
    aligned = false,
    only_current_line = true
  }]]
end

return {
  setup = setup,
}
