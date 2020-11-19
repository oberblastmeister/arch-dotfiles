local function setup()
  require'termwrapper'.setup {
    log = 2,
  }
end

return {
  setup = setup
}
