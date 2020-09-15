local function setup()
  vim.g['lightline#bufferline#show_number'] = 2
  vim.g['lightline#bufferline#clickable'] = 1
  vim.g['lightline#bufferline#modified'] = ' '
  vim.g['lightline#bufferline#read_only'] = ' '
  vim.g['lightline#bufferline#more_buffers'] = '…'
  vim.g['lightline#bufferline#unnamed'] = '_'

  -- for lightline bufferline
  vim.o.showtabline = 2
  -- allow lightline buffer line to be shown if gui is running
  if vim.fn.has('gui_running') = 1 then
    vim.cmd [[set guioptions-=e]]
  end
end

return {
  setup = setup,
}
