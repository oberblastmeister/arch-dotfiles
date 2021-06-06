augroup settings
  autocmd!

  autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'FloatermNew lf' argv()[0] | endif

  autocmd VimResized * wincmd =

  autocmd TextYankPost * silent! lua vim.highlight.on_yank{higroup="Visual", timeout=250}

  autocmd User GoyoEnter nested call mappings#goyo_enter()
  autocmd User GoyoLeave nested call mappings#goyo_leave()

  autocmd User GoyoEnter Limelight
  autocmd User GoyoLeave Limelight!
  " " limelight turns on cursorline for some reason
  autocmd User GoyoLeave set nocursorline
augroup end

augroup nostatusline
  autocmd!

  autocmd FileType fzf set laststatus=0 noruler
    \| autocmd BufLeave <buffer> set laststatus=2 ruler
augroup end
