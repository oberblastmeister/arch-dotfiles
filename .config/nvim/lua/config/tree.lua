local utils = require('utils')

local function setup()
  vim.g.nvim_tree_ignore = {".git"}

  vim.g.nvim_tree_auto_close = 1

  vim.g.nvim_tree_indent_markers = 0 -- 0 by default, this option shows indent markers when folders are open

  vim.g.nvim_tree_follow = 0

  vim.g.nvim_tree_show_icons = {
    git = 1,
    folders = 1,
    files = 1
  }

  vim.g.nvim_tree_icons = {
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

  vim.g.nvim_tree_bindings = {
    edit =            {'<CR>', 'o', 'l'},
    edit_vsplit =     '<C-v>',
    edit_split =      '<C-x>',
    edit_tab =        '<C-t>',
    close_node =      {'<S-CR>', '<BS>', 'h'},
    toggle_ignored =  '.',
    toggle_dotfiles = 'H',
    refresh =         'R',
    preview =         '<Tab>',
    cd =              '<C-]>',
    create =          'a',
    remove =          'D',
    rename =          'r',
    cut =             'x',
    copy =            'c',
    paste =           'p',
    prev_git_item =   '[c',
    next_git_item =   ']c',
    dir_up =          '-',
    close =           'q',
  }

  -- vim.api.nvim_exec([[
-- augroup LuaTreeOverride
  -- au!
  -- au FileType LuaTree setlocal nowrap
  -- au FileType LuaTree nnoremap <buffer> h :execute "normal ggo"<CR>
-- augroup END
-- ]], false)
end

return {
  setup = setup
}
