augroup settings
  autocmd!

  " turn off autocomment
  autocmd FileType * setlocal formatoptions-=cro

  " quit vimux when vim leaves
  " autocmd VimLeave * call VimuxCloseRunner()

  autocmd User GoyoEnter nested call mappings#goyo_enter()
  autocmd User GoyoLeave nested call mappings#goyo_leave()

  autocmd User GoyoEnter Limelight
  autocmd User GoyoLeave Limelight!

  autocmd VimResized * wincmd =

  autocmd FileType fzf setlocal nonumber norelativenumber signcolumn=no
  autocmd FileType gitcommit let b:coc_suggest_disable = 1
  autocmd FileType mail let b:coc_suggest_disable = 1

  " autocmd BufNewFile,BufRead * if empty(&filetype) | execute 'IndentLinesToggle'
  autocmd FileType sxhkdrc setlocal commentstring=#\ %s

  autocmd FileType markdown let b:coc_suggest_disable = 1
  
  " neovim master branch
  autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank('Visual', 300)

  autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()

  autocmd Filetype help setlocal signcolumn=no

  autocmd FileType fzf set laststatus=0
    \| autocmd BufLeave <buffer> set laststatus=2

  autocmd FileType floaterm set laststatus=0
    \| autocmd BufLeave <buffer> set laststatus=2

  autocmd BufWinEnter,WinEnter term://* startinsert
  autocmd BufLeave term://* stopinsert
augroup end
