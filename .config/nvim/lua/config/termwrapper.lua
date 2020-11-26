local function setup()
  require'termwrapper'.setup {
    log = 1,
  }
end

return {
  setup = setup
}
