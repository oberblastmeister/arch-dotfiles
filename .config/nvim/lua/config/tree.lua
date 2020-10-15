local function setup()
  vim.g.lua_tree_ignore = {".git"}
  vim.g.lua_tree_auto_close = 1
  vim.g.lua_tree_follow = 1
  vim.g.lua_tree_show_icons = {
    git = 1,
    folders = 1,
    files = 1
  }
  vim.g.lua_tree_icons = {
    default = "",
    git = {
      unstaged = "✗",
      staged = "✓",
      unmerged = "",
      renamed = "➜",
      untracked = "★"
    },
    folder = {
      default = "",
      open = ""
    }
  }

  vim.api.nvim_exec(
[[
augroup LuaTreeOverride
  au!
  au FileType LuaTree setlocal nowrap
augroup END
]]
, "")
end

return {
  setup = setup
}
