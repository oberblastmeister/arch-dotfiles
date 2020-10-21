local function setup()
  vim.g.vimwiki_list = {
    path = '~/notes/',
    syntax = 'markdown',
    ext = '.md'
  }
  vim.g.vimwiki_map_prefix = '<Leader>n'
  vim.g.vimwiki_global_ext = 0
end

return {
  setup = setup,
}
