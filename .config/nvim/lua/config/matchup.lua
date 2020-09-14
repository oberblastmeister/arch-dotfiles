local function setup()
  -- remove feature by setting it to empty
  vim.g.matchup_matchparen_offscreen = {method = 'popup'}
  -- vim.g.matchup_matchparen_offscreen = {}
end

return {
  setup = setup,
}
