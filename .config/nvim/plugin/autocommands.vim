augroup settings
  autocmd!

  " turn off autocomment
  " autocmd FileType vim setlocal formatoptions-=cro

  " autocommand to autoopen floaterm lf when opening directory
  autocmd StdinReadPre * let s:std_in=1
  autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'FloatermNew lf' argv()[0] | endif

  autocmd VimResized * wincmd =

  autocmd BufNewFile,BufRead * if empty(&filetype) | execute 'IndentLinesToggle'

  " highlighted yank
  autocmd TextYankPost * silent! lua vim.highlight.on_yank{higroup="Visual", timeout=250}

  " autocmd TermOpen * startinsert

  autocmd User GoyoEnter nested call mappings#goyo_enter()
  autocmd User GoyoLeave nested call mappings#goyo_leave()

  autocmd User GoyoEnter Limelight
  autocmd User GoyoLeave Limelight!
  " " limelight turns on cursorline for some reason
  autocmd User GoyoLeave set nocursorline

  " / does tag search in vista
  autocmd FileType vista,vista_kind nnoremap <buffer> <silent> / :<c-u>call vista#finder#fzf#Run()<CR>
  " autocmd VimEnter * call SetupLightlineColors()

augroup end

augroup nostatusline
  autocmd!

  autocmd FileType fzf set laststatus=0 noruler
    \| autocmd BufLeave <buffer> set laststatus=2 ruler

  autocmd FileType TelescopePrompt set laststatus=0 noruler
    \| autocmd BufLeave <buffer> set laststatus=2 ruler

  autocmd FileType floaterm set laststatus=0 noruler
    \| autocmd BufLeave <buffer> set laststatus=2 ruler

  autocmd  FileType which_key set laststatus=0 noruler
    \| autocmd BufLeave <buffer> set laststatus=2 ruler
augroup end

" augroup scrollbar
"     autocmd!
"     autocmd BufEnter    * silent! lua require('scrollbar').show()
"     autocmd BufLeave    * silent! lua require('scrollbar').clear()

"     autocmd CursorMoved * silent! lua require('scrollbar').show()
"     autocmd VimResized  * silent! lua require('scrollbar').show()

"     autocmd FocusGained * silent! lua require('scrollbar').show()
"     autocmd FocusLost   * silent! lua require('scrollbar').clear()
" augroup end
