augroup settings
  autocmd!

  " turn off autocomment
  " maybe add this into a mapping
  " autocmd FileType * setlocal formatoptions-=cro

  " quit vimux when vim leaves
  autocmd VimLeave * call VimuxCloseRunner()

  " auto resize vim when the host is resized
  " autocmd VimResized * redraw!

  autocmd User GoyoEnter nested call mappings#goyo_enter()
  autocmd User GoyoLeave nested call mappings#goyo_leave()

  autocmd User GoyoEnter Limelight
  autocmd User GoyoLeave Limelight!

  autocmd VimResized * wincmd =

  " autocmd ColorScheme * highlight! EndOfBuffer ctermbg=bg ctermfg=bg guibg=bg guifg=bg

  " sometimes lightline stays black after clap and doesn't revert to normal
  autocmd User ClapOnExit call lightline#update()

  autocmd FileType fzf set nonumber norelativenumber
  autocmd FileType gitcommit let b:coc_suggest_disable = 1
  autocmd FileType mail let b:coc_suggest_disable = 1

  " autocmd BufNewFile,BufRead * if empty(&filetype) | execute 'IndentLinesToggle'
  autocmd FileType sxhkdrc setlocal commentstring=#\ %s
augroup end

augroup markdown
  autocmd!
  autocmd FileType markdown let b:coc_suggest_disable = 1
augroup end
