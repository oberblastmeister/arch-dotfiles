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

function! fuzzy_finding#centered_floating_window(border)
    let width = min([&columns - 4, max([80, &columns - 20])])
    let height = min([&lines - 4, max([20, &lines - 10])])
    let top = ((&lines - height) / 2) - 1
    let left = (&columns - width) / 2
    let opts = {'relative': 'editor', 'row': top, 'col': left, 'width': width, 'height': height, 'style': 'minimal'}

    if a:border == v:true
        let top = "╭" . repeat("─", width - 2) . "╮"
        let mid = "│" . repeat(" ", width - 2) . "│"
        let bot = "╰" . repeat("─", width - 2) . "╯"
        let lines = [top] + repeat([mid], height - 2) + [bot]
        let s:buf = nvim_create_buf(v:false, v:true)
        call nvim_buf_set_lines(s:buf, 0, -1, v:true, lines)
        call nvim_open_win(s:buf, v:true, opts)
        set winhl=Normal:Normal
        let opts.row += 1
        let opts.height -= 2
        let opts.col += 2
        let opts.width -= 4
        call nvim_open_win(nvim_create_buf(v:false, v:true), v:true, opts)
        au BufWipeout <buffer> exe 'bw '.s:buf
    else
        call nvim_open_win(nvim_create_buf(v:false, v:true), v:true, opts)
    endif
endfunction
