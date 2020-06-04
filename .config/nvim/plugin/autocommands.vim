augroup settings
  autocmd!

  " turn off autocomment
  " maybe add this into a mapping
  " autocmd FileType * setlocal formatoptions-=cro

  " quit vimux when vim leaves
  autocmd VimLeave * call VimuxCloseRunner()

  " when a directory is an arg for vim in the terminal it changes to that dir when opened
  autocmd StdinReadPre * let s:std_in=1
  autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'cd '.argv()[0] | endif

  " close nerdtree when it is the only buffer left
  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

  " auto resize vim when the host is resized
  autocmd VimResized * execute "normal! \<c-w>="

  autocmd User GoyoEnter nested call mappings#goyo_enter()
  autocmd User GoyoLeave nested call mappings#goyo_leave()

  autocmd User GoyoEnter Limelight
  autocmd User GoyoLeave Limelight!

  autocmd ColorScheme * highlight! EndOfBuffer ctermbg=bg ctermfg=bg guibg=bg guifg=bg

  " sometimes lightline stays black after clap and doesn't revert to normal
  autocmd User ClapOnExit call lightline#update()

  autocmd FileType fzf set nonumber norelativenumber
  autocmd FileType gitcommit let b:coc_suggest_disable = 1

  " autocmd BufNewFile,BufRead * if empty(&filetype) | execute 'IndentLinesToggle'
augroup end

augroup markdown
  autocmd!
  autocmd FileType markdown let b:coc_suggest_disable = 1
augroup end
