local function setup()
  require'termwrapper'.setup {
    log = 1,
    winenter_autoinsert = true,
  }
end

return {
  setup = setup
}
