local use = require("packer").use

local function setup()
  ----------------------------- LSP/DAP ----------------------------------
  -- debug adapter client
  use {
    "puremourning/vimspector",
    run = function()
      vim.g.vimspector_install_gadgets = {"debugpy", "vscode-cpptools", "CodeLLDB", "vscode-bash-debug"}
      vim.cmd [[VimspectorInstall]]
    end,
    setup = function()
      vim.g.vimspector_enable_mappings = "HUMAN"
    end,
    cmd = "LaunchVimspector",
    disable = true,
  }

  use {
    "mfussenegger/nvim-dap",
    requires = {
      "theHamsta/nvim-dap-virtual-text",
      "mfussenegger/nvim-dap-python",
      "nvim-telescope/telescope-dap.nvim",
    },
    config = function()
      require'config/dap'.setup()
    end,
    disable = true,
  }
end

return {
  setup = setup,
}
