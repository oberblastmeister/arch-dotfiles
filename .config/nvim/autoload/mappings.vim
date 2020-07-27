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

function! mappings#run_code()
  if &filetype == 'python'
    call VimuxRunCommand("clear; ipython " . expand("%:p"))
  elseif &filetype == 'rust'
    Dispatch cargo run --release
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
    call VimuxRunCommand("clear; java " . bufname("%"))
  elseif &filetype == 'go'
    call VimuxRunCommand("clear; go " . bufname("%"))
  elseif &filetype == 'r'
    call VimuxRunCommand("clear; rscript " . bufname("%"))
  endif
endfunction

function mappings#configure_debugger()
  if &filetype == 'python'
    silent exe "!cp -u ~/.config/nvim/vimspector/python/.vimspector.json " . shellescape(getcwd())
  elseif &filetype == 'rust'
    silent exe "!cp -u ~/.config/nvim/vimspector/rust/.vimspector.json " . shellescape(getcwd())
  endif
  edit .vimspector.json
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

function! mappings#restart_language_server()
  if &filetype == 'rust'
    CocCommand rust-analyzer.reload
  endif
endfunction
