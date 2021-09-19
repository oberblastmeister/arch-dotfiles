-- some globals for convenience
R = require
A = vim.api

function each(z)
  return (function (x) return x(x) end) (function (x) return function (...) z(...) return x(x) end end)
end

function reload(module)
  require('plenary.reload').reload_module(module)
end

function make_buffer()
  compl_buf = vim.api.nvim_create_buf(false, false)
end

function key_callback()
  local counter = 0

  vim.register_keystroke_callback(function(k)
    if not A.nvim_get_mode().mode:find("i", 1, true) then
      return
    end

    if k == "(" then
      print('hit', counter)
      A.nvim_put({')'}, 'c', false, false)
    elseif k == "{" then
      print('hit', counter)
      A.nvim_put({'}'}, 'c', false, false)
    end

    counter = counter + 1
  end)
end

compl_config = {
  relative = "cursor",
  width = 20,
  height = 20,
  focusable = false,
  border = "shadow",
  style = "minimal",
  row = 1,
  col = 1,
}

function open_float()
  compl_win = vim.api.nvim_open_win(compl_buf, false, compl_config)
  vim.cmd[[autocmd InsertCharPre * noautocmd call v:lua.move_float()]]
end

function move_float()
  vim.api.nvim_win_set_config(compl_win, compl_config)
end

if vim.fn.exists('g:vscode') == 1 then
  vim.cmd [[
    set noloadplugins

    set clipboard^=unnamed,unnamedplus

    nnoremap <C-/> <Cmd>call VSCodeNotify('editor.action.startFindReplaceAction')<CR>
    nnoremap <space>/ <Cmd>call VSCodeNotify('workbench.action.replaceInFiles')<CR>

    xmap <space>c  <Plug>VSCodeCommentary
    nmap <space>c  <Plug>VSCodeCommentary
    omap <space>c  <Plug>VSCodeCommentary
    nmap <space>cc <Plug>VSCodeCommentaryLine

    nnoremap <C-j> <Cmd>call VSCodeNotify('workbench.action.focusBelowGroup')<CR>
    xnoremap <C-j> <Cmd>call VSCodeNotify('workbench.action.focusBelowGroup')<CR>
    nnoremap <C-k> <Cmd>call VSCodeNotify('workbench.action.focusAboveGroup')<CR>
    xnoremap <C-k> <Cmd>call VSCodeNotify('workbench.action.focusAboveGroup')<CR>
    nnoremap <C-h> <Cmd>call VSCodeNotify('workbench.action.focusLeftGroup')<CR>
    xnoremap <C-h> <Cmd>call VSCodeNotify('workbench.action.focusLeftGroup')<CR>
    nnoremap <C-l> <Cmd>call VSCodeNotify('workbench.action.focusRightGroup')<CR>
    xnoremap <C-l> <Cmd>call VSCodeNotify('workbench.action.focusRightGroup')<CR>

    nnoremap ]g <Cmd>call VSCodeNotify('editor.action.marker.next')<CR>
    nnoremap [g <Cmd>call VSCodeNotify('editor.action.marker.prev')<CR>
    nnoremap ]G <Cmd>call VSCodeNotify('editor.action.marker.nextInFiles')<CR>
    nnoremap [G <Cmd>call VSCodeNotify('editor.action.marker.prevInFiles')<CR>

    nnoremap gy <Cmd>call VSCodeNotify('editor.action.goToTypeDefinition')<CR>
    nnoremap gr <Cmd>call VSCodeNotify('editor.action.goToReferences')<CR>
    nnoremap gD <Cmd>call VSCodeNotify('editor.action.goToImplementation')<CR>
    nnoremap <space>= <Cmd>call VSCodeNotify('editor.action.formatDocument')<CR>
    nnoremap <space>rn <Cmd>call VSCodeNotify('editor.action.rename')<CR>
    nnoremap <space>a <Cmd>call VSCodeNotify('keyboard-quickfix.openQuickFix')<CR>
    nnoremap <space>l <Cmd>call VSCodeNotify('codelens.showLensesInCurrentLine')<CR>

    nnoremap <space>q <Cmd>Quit<CR>
    nnoremap <space>Q <Cmd>Quit!<CR>

    nnoremap <space>w <Cmd>Write<CR>
    nnoremap <space>W <Cmd>Wall<CR>

    nnoremap <space>x <Cmd>Wq<CR>
    nnoremap <space>X <Cmd>Wq!<CR>

    nnoremap <space>o <Cmd>Only<CR>

    inoremap <C-f> <Right>
    inoremap <C-b> <Left>

    nnoremap <space>hr <Cmd>call VSCodeNotify('git.revertSelectedRanges')<CR>
    nnoremap <space>hs <Cmd>call VSCodeNotify('git.stageSelectedRanges')<CR>
    nnoremap <space>b <Cmd>call VSCodeNotify('workbench.action.toggleSidebarVisibility')<CR>
  ]]

  vim.cmd [[packadd vim-surround]]

  return
end

vim.o.termguicolors = true

vim.g.loaded_python_provider = 0

vim.g.coq_settings = {
  auto_start = true,
  ["keymap.recommended"] = false,
  ["keymap.jump_to_mark"] = "<Down>"
}

function smart_select()
  local t = termcodes
  if vim.fn.pumvisible() ~= 0 then
    if vim.fn.complete_info().selected == -1 then
      A.nvim_select_popupmenu_item(0, true, true, {})
    else
      feedkeys(t'<C-e><Tab>', 'm')
    end
  else
    feedkeys(t'<Tab>', 'n')
  end
end

vim.cmd [[
ino <silent> <Tab> <cmd>lua smart_select()<CR>
ino <silent><expr> <CR>    pumvisible() ? (complete_info().selected == -1 ? "\<C-e><CR>" : "\<C-y>") : "\<CR>"
ino <silent><expr> <Tab>    pumvisible() ? (complete_info().selected == -1 ? "\<C-e><Tab>" : "\<C-y>") : "\<Tab>"
ino <silent><expr> <Esc>   pumvisible() ? "\<C-e><Esc>" : "\<Esc>"
ino <silent><expr> <C-c>   pumvisible() ? "\<C-e><C-c>" : "\<C-c>"
ino <silent><expr> <BS>    pumvisible() ? "\<C-e><BS>"  : "\<BS>"
]]

require"defaults".setup()
require"plugins".setup()
require"config/neovide".setup()

termcodes = function(keys)
  return A.nvim_replace_termcodes(keys, true, true, true)
end

function feedkeys(keys, mode)
  keys = A.nvim_replace_termcodes(keys, true, true, true)
  A.nvim_feedkeys(keys, mode, true)
end

function replace(keys)
  return A.nvim_replace_termcodes(keys, true, true, true)
end

vim.cmd [[nnoremap <leader><CR> <cmd>luafile %<CR>]]
