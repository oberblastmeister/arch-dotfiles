function! fuzzy_finding#fuzzy_files()
  " let $FZF_DEFAULT_COMMAND = 'fdfind --type file --follow --color=always'
  " if "" . getcwd() == '/home/brian'
    " Files
  " else
  Clap files
  " endif
  " let $FZF_DEFAULT_COMMAND = "fdfind --type file --follow --hidden --exclude .git --color=always"
endfunction

function! fuzzy_finding#fuzzy_explorer()
  if &filetype == 'coc-explorer'
    let explor_cwd = getcwd(g:explorer_win)
    CocCommand explorer --position floating

    exe "normal!" g:explorer_file_win . "\<C-w>w"
    exe "cd" explor_cwd

    sleep 60m

    call fuzzy_finding#fuzzy_files()

    let g:explorer_reopen = 1

    autocmd! BufEnter * ++once let g:explorer_reopen = 0
    autocmd! User ClapOnExit ++once call fuzzy_finding#explorer_should_reopen()

  else
    call fuzzy_finding#fuzzy_files()
  endif
endfunction

function! fuzzy_finding#open_nnn()
  let $VISUAL='floaterm'
  FloatermNew nnn
  let $VISUAL='nvim'
endfunction

function! fuzzy_finding#explorer_should_reopen()
  if g:explorer_reopen == 1
    CocCommand explorer --position floating
  endif
endfunction

function! fuzzy_finding#fuzzy_dotfiles()
  let s:cwd = getcwd()
  if s:cwd != '/home/brian/.config/nvim'
    cd ~/.dotfiles
  endif
  if &filetype == 'coc-explorer'
    CocCommand explorer
  endif
  Clap files
endfunction

function fuzzy_finding#rg_and_replace()
    write!

    let s:word = expand("<cword>")
    execute "Rg" s:word

    let replace = ""
    let replace = input("Replace with: ")

    if replace != ""

      let mode = ""
      let mode = input("Mode: ")

      if mode != ""
        execute "%s/" . s:word . "/" . replace . "/" . mode
      else
        echo "canceled"
      endif
    else
      echo "canceled"
    endif
endfunction
