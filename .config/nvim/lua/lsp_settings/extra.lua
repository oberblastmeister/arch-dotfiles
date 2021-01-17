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

  configs.tomllsp = {
    default_config = {
      cmd = {"/home/brian/projects/toml-lsp/target/release/toml-lsp"},
      filetypes = {"toml"},
      root_dir = util.root_pattern(".git", vim.fn.getcwd()),
      docs = {
        description = [[]],
        default_config = {root_dir = [[root_pattern(".git", vim.fn.getcwd())]]},
      },
    }
  }
end

return {setup = setup}
