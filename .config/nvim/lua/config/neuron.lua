local api = vim.api

local function goto_index()
  vim.cmd [[cd ~/neuron]]
  vim.cmd [[e ~/neuron/index.md]]
end

local function custom_packadd()
  print('loaded neuron', vim.g.loaded_neuron)
  if not vim.g.loaded_neuron then
    vim.cmd [[echoerr 'added neuron']]
    print "added neuron"
    vim.cmd [[packadd neuron.vim]]
    vim.api.nvim_set_var('loaded_neuron', true)
  else
    vim.cmd "echoerr 'not dading neuorn'"
  end
end

local function setup_packadd()
  vim.cmd [[au BufRead,BufNewFile ~/neuron/*.md lua require'config/neuron'.custom_packadd()]]
end

local function setup()
  require"neuron".setup()
  vim.cmd [[nnoremap gzi <cmd>lua require'neuron'.goto_index()<CR>]]
end

return {
  setup_packadd = setup_packadd,
  custom_packadd = custom_packadd,
  goto_index = goto_index,
  setup = setup,
}
