local function get_lua_runtime()
  local result = {};

  for _, path in pairs(vim.api.nvim_list_runtime_paths()) do
    local lua_path = path .. "/lua/";
    if vim.fn.isdirectory(lua_path) then
      table.insert(result, lua_path)
    end
  end

  -- This loads the `lua` files from nvim into the runtime.
  table.insert(result, vim.fn.expand("$VIMRUNTIME/lua"))

  -- TODO: Figure out how to get these to work...
  --  Maybe we need to ship these instead of putting them in `src`?...
  table.insert(result, vim.fn.expand("~/build/neovim/src/nvim/lua"))

  return result;
end

return {
  ["lua-analyzer"] = {
    workspace = {
      library = get_lua_runtime(),
    }
  }
}
