local function setup()
  vim.g.fzf_preview_window = 'right'
  vim.g.fzf_layout = {
    window = {
      width = 0.8,
      height = 0.5
    }
  }
  vim.g.fzf_buffers_jump = 1
  vim.g.fzf_preview_window = 'right'
  vim.g.fzf_layout = {
    window = {
      width = 0.8,
      height = 0.5
    }
  }
  vim.g.fzf_buffers_jump = 1

end

return {
  setup = setup
}
