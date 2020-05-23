nnoremap <silent> <leader>p :call Cargo()<CR>
" nnoremap <silent> <leader>r :VimuxRunCommand("./target/debug/" . substitute(getcwd(), '^.*/', '', ''))<CR>
nnoremap <silent> <leader>r :write!<cr>:VimuxRunCommand("clear; cargo run")<cr>
nnoremap <silent> <leader>sr :VimuxRunCommand("irust")<cr>

function Cargo()
  let cargo_choice = confirm("Project options:", "New Bi&nary\nNew &Library\n&Build!\n&Run\n&Check")
  if cargo_choice == 1
    call NewProject("--bin")
  elseif cargo_choice == 2
    call NewProject("--lib")
  elseif cargo_choice == 3
    Dispatch! cargo build
  elseif cargo_choice == 4
    Dispatch cargo run
  elseif cargo_choice == 5
    Dispatch cargo check
  endif
endfunction

function! NewProject(flag)
  let s:cargo_project = ""
  let s:cargo_project = input("Project name: ")
  if s:cargo_project != ""
    execute 'Dispatch cargo new' s:cargo_project a:flag
  endif
endfunction
