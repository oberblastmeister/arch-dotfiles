function dump(...)
  local objects = vim.tbl_map(vim.inspect, {...})
  print(unpack(objects))
end

-- packer throws error if is not on
vim.o.termguicolors = true

-- disable python 2 support
vim.g.loaded_python_provider = 0

-- disable netrw
vim.g.loaded_netrwPlugin = 1

require('plugins')
