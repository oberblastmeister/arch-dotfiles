local function setup()
  require'rooter'.setup {
    echo = false
  }
end

return {
  setup = setup
}
