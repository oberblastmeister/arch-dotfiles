local function setup()
  vim.g.neovide_refresh_rate=240
  -- let g:neovide_cursor_vfx_mode = "pixiedust"
  -- vim.g.neovide_cursor_vfx_mode = "railgun"
  vim.g.neovide_cursor_animate_in_insert_mode=0
  vim.g.neovide_cursor_animation_length=0
end

return {setup = setup}
