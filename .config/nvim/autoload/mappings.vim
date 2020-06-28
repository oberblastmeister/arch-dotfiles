" Cycle through relativenumber + number, number (only), and no numbering.
function! mappings#toggle_numbering() abort
  if exists('+relativenumber')
    execute {
          \ '00': 'set relativenumber   | set number',
          \ '01': 'set norelativenumber | set number',
          \ '10': 'set norelativenumber | set nonumber',
          \ '11': 'set norelativenumber | set number' }[&number . &relativenumber]
  else
    " No relative numbering, just toggle numbers on and off.
    set number!<CR>
  endif
endfunction

" Zap trailing whitespace.
function! mappings#zap() abort
  let l:pos=getcurpos()
  let l:search=@/
  keepjumps %substitute/\s\+$//e
  let @/=l:search
  nohlsearch
  call setpos('.', l:pos)
endfunction

function! mappings#run_code() abort
  let g:VimuxHeight = "55"
  let g:VimuxOrientation = "h"
  if &filetype == 'python'
    :write!
    call VimuxRunCommand("clear; ipython " . expand("%:p"))
  elseif &filetype == 'javascript'
    :Bracey
    " call VimuxRunCommand("clear; node " . bufname("%"))
  elseif &filetype == 'html'
    :Bracey
  elseif &filetype == 'css'
    :Bracey
  elseif &filetype == 'markdown'
    :MarkdownPreview
  elseif &filetype == 'java'
    :write
    call VimuxRunCommand("clear; java " . bufname("%"))
  elseif &filetype == 'go'
    :write
    call VimuxRunCommand("clear; go " . bufname("%"))
  elseif &filetype == 'r'
    :write
    call VimuxRunCommand("clear; rscript " . bufname("%"))
  endif
  let g:VimuxHeight = "30"
  let g:VimuxOrientation = "v"
endfunction

function mappings#start_debugger()
  if &filetype == 'python'
    call vimspector#LaunchWithSettings({ 'configuration': 'Python' })
  elseif &filetype == 'rust' || &filetype == 'cpp'
    call vimspector#LaunchWithSettings({ 'configuration': 'C family' })
  endif
endfunction

function! mappings#source_vimrc()
  source ~/.config/nvim/init.vim

  source ~/.config/nvim/plugin/coc.vim
  source ~/.config/nvim/plugin/coc_snippets.vim

  source ~/.config/nvim/plugin/mappings/command.vim
  source ~/.config/nvim/plugin/mappings/fuzzy_finding.vim
  source ~/.config/nvim/plugin/mappings/normal.vim
  source ~/.config/nvim/plugin/mappings/leader.vim

  source ~/.config/nvim/plugin/settings.vim

  source ~/.config/nvim/ftplugin/python.vim
  source ~/.config/nvim/ftplugin/rust.vim
endfunction

function! mappings#goyo_enter()
  set noshowcmd
  set nocursorline
  " silent! CocDisable
endfunction

function! mappings#goyo_leave()
  set showcmd
  set cursorline
  " goyo removes the ~ conceal
  highlight! EndOfBuffer ctermbg=bg ctermfg=bg guibg=bg guifg=bg
  " silent! CocEnable
endfunction

function! mappings#toggle_yadm()
  " toggles yadm
  " if !exists('g:yadm_on')
  "   let g:yadm_on = 0
  " endif

  if g:yadm_on == 0
    let $GIT_DIR="/home/brian/.config/yadm/repo.git"
    let g:yadm_on = 1
  else
    unlet $GIT_DIR
    let g:yadm_on = 0
  endif

  if !empty(&filetype)
    edit %
  endif
endfunction
