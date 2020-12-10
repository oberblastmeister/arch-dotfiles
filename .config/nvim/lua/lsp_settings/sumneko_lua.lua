return {
  Lua = {
    runtime = {
      version = "LuaJIT",

      -- add lua plugins to server, might make it really slow
      path = vim.split(package.path, ';')
    },
    diagnostics = {
      globals = {"vim"},

      disable = {
        "lowercase-global"
      }
    },
    workspace = {
      -- Make the server aware of Neovim runtime files
      library = {
        [vim.fn.expand('$VIMRUNTIME/lua')] = true,
        [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
      },
    },
  }
}
