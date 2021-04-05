local configs = require("lspconfig/configs")
local util = require "lspconfig/util"

local function setup()
  configs.amuletlsp = {
    default_config = {
      cmd = {"amulet-lsp"},
      filetypes = {"ocaml"},
      root_dir = util.root_pattern(".git", vim.fn.getcwd()),
      docs = {
        description = [[]],
        default_config = {root_dir = [[root_pattern(".git", vim.fn.getcwd())]]},
      },
    },
  }

  configs.testlsp = {
    default_config = {
      cmd = {"/home/brian/projects/lsp-server/target/release/lsp-server"},
      filetypes = {"rust"},
      root_dir = util.root_pattern(".git", vim.fn.getcwd()),
      docs = {
        description = [[]],
        default_config = {root_dir = [[root_pattern(".git", vim.fn.getcwd())]]},
      },
    },
  }

  configs.taplolsp = {
    default_config = {
      -- cmd = {"/home/brian/projects/taplo/target/release/taplo-lsp", "run"},
      cmd = {"taplo-lsp", "run"},
      filetypes = {"toml"},
      root_dir = util.root_pattern("*.toml", vim.fn.getcwd()),
      docs = {
        description = [[]],
        default_config = {root_dir = [[root_pattern(".git", vim.fn.getcwd())]]},
      },
    }
  }

  configs.lua_analyzer = {
    default_config = {
      cmd = { "lua-analyzer" },
      filetypes = {"lua"},
      root_dir = util.root_pattern("*.lua", vim.fn.getcwd()),
      docs = {
        description = [[]],
        default_config = {root_dir = [[root_pattern(".git", vim.fn.getcwd())]]},
      },
    }
  }
end

return {setup = setup}
